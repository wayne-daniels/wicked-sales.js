import React from 'react';

export default function ProductListItem(props) {
  return (
    <div className="col-lg-3 mb-4 mx-3 shadow bg-white">
      <div>
        <img src={props.product.image} className="card-img-top h-50" alt={props.product.name} />
        <div className="card-body">
          <h3 className="card-title">{props.product.name}</h3>
          <p className="card-subtitle text-secondary">$ {((props.product.price) * 0.01).toFixed(2)}</p>
          <p className="card-text">{props.product.shortDescription}</p>
        </div>
      </div>
    </div>
  );
}
