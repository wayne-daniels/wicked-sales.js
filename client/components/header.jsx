import React from 'react';

export default function Header(props) {
  let itemNumber = '';
  if (props.cartItemCount === 1) {
    itemNumber = 'item';
  } else {
    itemNumber = 'items';
  }
  return (
    <div className="header vw-100 bg-dark row pt-3 pb-2">
      <div className="col-1"></div>
      <div className="col-5">
        <h4 className="text-white"><i className="fas fa-dollar-sign fa-lg mr-2 mb-2" />Wicked Sales</h4>
      </div>
      <div className="col-5 text-right px-0">
        <a className="text-white back mx-3">{`${props.cartItemCount} ${itemNumber}`}</a>
        <i className="fas fa-shopping-cart fa-2x text-white" style={{ cursor: 'pointer' }}
          onClick={() => props.setView('cart', {})}></i>
      </div>
      <div className="col-1"></div>
    </div>
  );
}
