import React from 'react';

export default function CartSummaryItem(item) {
  return (
    <div className="row justify-content-center col-12 card mb-2">
      <div className="col-4">
        <img className="card-image" src={item.img} alt={item.short} />
      </div>
      <div className="col-8">
        <h5 className="card-title">{item.name}</h5>
        <p>${item.price}</p>
        <p className="card-text">{item.short}</p>
      </div>
    </div>
  );
}
