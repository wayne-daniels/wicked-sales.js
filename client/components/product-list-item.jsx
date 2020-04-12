import React from 'react';

export default function ProductListItem(props) {
  return (
    <div id={props.productId} onClick={props.setViewDetail} style={{ cursor: 'pointer' }} className="d-flex flex-row align-items-xl-center h-45 col-md-3 mb-4 mx-4 shadow bg-white">
      <div className="inner-shadow">
        <img src={props.product.image} className="card-img-top h-50" alt={props.product.name} />
        <div className="d-flex flex-column justify-content-center card-body">
          <h3 className="card-title mt-4">{props.product.name}</h3>
          <p className="card-subtitle text-secondary mt-2">$ {((props.product.price) * 0.01).toFixed(2)}</p>
          <p className="card-text mt-2">{props.product.shortDescription}</p>
        </div>
      </div>
    </div>
  );
}
