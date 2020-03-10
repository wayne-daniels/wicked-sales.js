import React from 'react';

export default function ProductListItem(props) {
  return (
    <div className="col-md-4 mb-3">
      <div>
        <img src={props.img} className="card-img-top h-50" alt={props.name} />
        <div className="card-body">
          <h6 className="card-title">{props.name}</h6>
          <p className="card-subtitle test-secondary">$ {(props.price) * 0.01}</p>
          <p className="card-text">{props.short}</p>
        </div>
      </div>
    </div>
  );
}
