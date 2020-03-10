import React from 'react';

export default function ProductListItem(props) {
  return (
    <div className="col-md-4 mb-3">
      <div>
        <img src={props.product.image} className="card-img-top h-50" alt={props.product.name} />
        <div className="card-body">
          <h5 className="card-title">{props.product.name}</h5>
          <p className="card-subtitle test-secondary">$ {(props.product.price) * 0.01}</p>
          <p className="card-text">{props.product.shortDescription}</p>
        </div>
      </div>
    </div>
  );
}
