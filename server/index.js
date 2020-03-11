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

app.get('/api/cart', (req, res, next) => {
//  json[]
});

app.post('/api/cart', (req, res, next) => {
  const productId = req.body.productId;
  const sql = `
  select "price"
  from   "products
  where  "productId" = $1
  `;
  if (parseInt(productId) < 0 || !productId) {
    next(new ClientError(`${productId} is not valid, please re-enter`, 400));
  } else {
    db.query(sql, [productId])
      .then(result => {
        const productIdCheck = result.rows;
        if (!productIdCheck) {
          throw new ClientError('Request is invalid, please re-enter');
        } else {
          const insertNewCartSQL = `
         insert into "carts" ("cartId", "createdAt")
         values              (default, default)
         returning   "cartId"
         `;
          if (!req.session.cartId) {
            return (
              db.query(insertNewCartSQL)
                .then(result => {
                  return (
                    {
                      cartId: result.rows[0].cartId,
                      price: productIdCheck[0].price
                    }
                  );
                })
            );
          } else {
            return (
              {
                cartId: req.session.cartId,
                price: productIdCheck[0].price
              }
            );
          }
        }
      })
      .then(result => {
        const resultCartID = result.cartId;
        const resultPrice = result.price;
        req.session.cartId = resultCartID;
        const insertCartItemsSQL = `
     insert into "cartItems" ("cartId, "productId", "price)
     values ($1, $2, $3)
     returning "cartItemId"
     `;
        return (
          db.query(insertCartItemsSQL, [resultCartID, productId, resultPrice])
            .then(result => {
              return (result.rows[0].cartItemId);
            })
        );
      })
      .then(result => {
        const cartItemId = result;
        const cartItemInformationSQL = `
    select "cartItems"."cartItemId",
           "cartItems"."price",
           "products"."productId",
           "products"."image",
           "products"."name,
           "products"."shortDescription"
      from "cartItems"
      join "products" using ("productId")
     where "cartItems"."cartItemId" = $1
     `;
        return (
          db.query(cartItemInformationSQL, [cartItemId])
            .then(result => {
              const cartItemInformation = result.rows[0];
              res.status(201).json(cartItemInformation);
            }));
      })
      .catch(err => next(err));
  }
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
