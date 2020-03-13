import React from 'react';
import CartSummaryItem from './cart-summary-item';

export default function CartSummary(props) {
  let total = 0;
  let body = null;
  if (props.cart.length === 0) {
    body = <div className="row"><span>Your Cart is empty! Buy Something!</span></div>;
  } else {
    body = <div className="row mb-3">
      {
        props.items.map(product => {
          total = total + product.price;
          return (
            <CartSummaryItem
              key={product.cartItemId}
              img={product.image}
              name={product.name}
              price={product.price}
              short={product.shortDescription}
            />
          );
        })
      }
    </div>;
  }
  return (
    <div className="container">
      <a onClick={() => props.setView('catalog', {})} className="row my-3 back text-muted">&lt; Back to catalog</a>
      <h2 className="row mb-4">My Cart</h2>
      {body}
      <h3 className="row pb-3">Item Total:${total}</h3>
    </div>
  );
}
