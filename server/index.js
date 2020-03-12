require('dotenv/config');
const express = require('express');

const db = require('./database');
const ClientError = require('./client-error');
const staticMiddleware = require('./static-middleware');
const sessionMiddleware = require('./session-middleware');

const app = express();

app.use(staticMiddleware);
app.use(sessionMiddleware);

app.use(express.json());

app.get('/api/health-check', (req, res, next) => {
  db.query('select \'successfully connected\' as "message"')
    .then(result => res.json(result.rows[0]))
    .catch(err => next(err));
});

app.get('/api/products', (req, res, next) => {
  db.query('select "productId", "name", "price", "image", "shortDescription" from "products"')
    .then(result => res.json(result.rows))
    .catch(err => next(err));
});

app.get('/api/products/:id', (req, res, next) => {
  if (req.params.id <= 0) {
    return res.status(400).json({
      error: '"ProductId" is invalid.'
    });
  } else {
    db.query(`
   select *
   from   "products"
   where  "productId" = $1;
    `, [req.params.id])
      .then(result => {
        const row = result.rows[0];
        if (!row) res.sendStatus(404);
        else res.json(row);
      }).catch(err => next(err));
  }
});

app.get('/api/cart/', (req, res, next) => {
  const sql = `
  select "c"."cartItemId",
         "c"."price",
         "p"."productId",
         "p"."image",
         "p"."name",
         "p"."shortDescription"
    from "cartItems" as "c"
    join "products"  as "p" using ("productId")
   where "c"."cartId" = $1
  `;
  const value = [req.session.cartId];
  db.query(sql, value)
    .then(result => {
      const data = result.rows;
      res.status(201).json(data);
    })
    .catch(err => next(err));
});

app.post('/api/cart', (req, res, next) => {
  const { productId } = req.body;

  if (!Number(productId)) {
    return next(new ClientError(`${productId} is not a valid Product ID`, 400));
  }

  const sql = `
  select "price"
  from   "products"
  where  "productId" = $1
  `;
  const value = [productId];

  db.query(sql, value)
    .then(result => {
      if (!result.rows[0]) {
        throw new ClientError(`productId ${productId} does not exist`, 400);
      } else if ('cartId' in req.session) {
        return {
          price: result.rows[0].price,
          cartId: req.session.cartId
        };
      }
      const sql = `
      insert into "carts" ("cartId", "createdAt")
      values (default, default)
      returning "cartId"
      `;
      return db.query(sql).then(cartId => ({
        price: result.rows[0].price,
        cartId: cartId.rows[0].cartId
      }));
    })
    .then(data => {
      req.session.cartId = data.cartId;
      const price = data.price;
      const sql = `
        insert into "cartItems" ("cartId", "productId", "price")
        values ($1, $2, $3)
        returning "cartItemId"
      `;
      const values = [data.cartId, productId, price];
      return db
        .query(sql, values)
        .then(cartItemId => cartItemId.rows[0]);
    })
    .then(cartItemId => {
      const sql = `
      select "c"."cartItemId",
        "c"."price",
        "p"."productId",
        "p"."image",
        "p"."name",
        "p"."shortDescription"
      from "cartItems" as "c"
      join "products" as "p" using ("productId")
      where "c"."cartItemId" = $1
      `;
      const value = [cartItemId.cartItemId];
      return db.query(sql, value)
        .then(data => {
          res.status(201).json(data.rows);
        });
    })
    .catch(err => next(err));
});

app.use('/api', (req, res, next) => {
  next(new ClientError(`cannot ${req.method} ${req.originalUrl}`, 404));
});

app.use((err, req, res, next) => {
  if (err instanceof ClientError) {
    res.status(err.status).json({ error: err.message });
  } else {
    console.error(err);
    res.status(500).json({
      error: 'an unexpected error occurred'
    });
  }
});

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log('Listening on port', process.env.PORT);
});
