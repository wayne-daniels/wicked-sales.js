import React from 'react';
import CartSummaryItem from './cart-summary-item';

export default function CartSummary(props) {
  if (props.cart.length === 0) {
    return (
      <div className="bg-warning">
        <div
          className="text-primary mb-4 pt-2 px-0 btn d-flex justify-content-center"
          style={{ cursor: 'pointer' }}
          onClick={() => props.setView('catalog', {})}>
          &lt; Back to Catalog
        </div>
        <h3 className="text-center text-danger pb-5">Your cart is empty</h3>
      </div>
    );
  }

  const cartItems = props.cart.map(item =>
    <CartSummaryItem item={item} key={item.productId} />
  );
  const totalPrice = props.cart.reduce((acc, cur) => acc + cur.price, 0);

  return (
    <div className="row">
      <div className="d-flex flex-column col-7 mx-auto">
        <div className="text-muted mb-4 pt-0 px-0 btn d-flex justify-content-start"
          style={{ cursor: 'pointer' }}
          onClick={() => props.setView('catalog', {})}>
          &lt; Back to Catalog
        </div>
        <h2 className="mb-4">My Cart</h2>
        {cartItems}
        <div className="mt-3 mb-5 d-flex justify-content-between">
          <h5 className="text-muted d-flex align-items-center">Total Price: <span className="text-success">${((totalPrice) * 0.01).toFixed(2)}</span></h5>
          <div>
            <button type="button" className="btn btn-success btn-lg" onClick={() => props.setView('checkout', {})}>Checkout</button>
          </div>
        </div>
      </div>
    </div>
  );
}
