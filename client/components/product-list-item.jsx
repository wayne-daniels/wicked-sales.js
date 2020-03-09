import React from 'react';

export default function ProductListItem(props) {
  const product = props.product;
  return (
    <div className="col-md-4 mb-3">
      <div>
        <img src={product.image} className="card-img-top h-50" alt={product.name} />
        <div className="card-body">
          <h6 className="card-title">{product.name}</h6>
          <p className="card-subtitle test-secondary">$ {(product.price) * 0.01}</p>
          <p className="card-text">{product.shortDescription}</p>
        </div>
      </div>
    </div>

  );
}
