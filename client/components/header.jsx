import React from 'react';

export default function Header(props) {
  let itemNumber = '';
  if (props.cartItemCount === 1) {
    itemNumber = 'item';
  } else {
    itemNumber = 'items';
  }
  return (
    <div className="vw-100 bg-dark">
      <div className="row justify-content-between pt-3 pb-2">
        <div className="row col-3">
          <h4 className="text-white"><i className="fas fa-dollar-sign fa-lg mr-2 mb-2
        " />Wicked Sales</h4>
        </div>
        <div className="row col-2">
          <a className="text-white back mt-1">{`${props.cartItemCount} ${itemNumber}`}</a>
          <i className="fas fa-shopping-cart fa-2x text-white mr-5" style={{ cursor: 'pointer' }}
            onClick={() => props.setView('cart', {})}></i>
        </div>
      </div>
    </div>
  );
}
