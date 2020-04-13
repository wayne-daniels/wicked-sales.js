import React from 'react';

export default class ProductDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = { product: null };
    this.setViewCat = this.setViewCat.bind(this);
    this.addToCart = this.addToCart.bind(this);
  }

  componentDidMount() {
    fetch(`/api/products/${this.props.viewParams.productId}`)
      .then(reponse => reponse.json())
      .then(data => {
        return this.setState({ product: data });
      });
  }

  setViewCat(event) {
    this.props.setView('catalog', {});
  }

  addToCart() {
    this.props.addToCart(this.state.product);
  }

  render() {
    if (!this.state.product) return null;
    return (
      <div className="row mt-5 mx-0">
        <div className="card col-7 mx-auto" id={this.props.productId}>
          <div className="hover text-muted my-3 px-0 btn d-flex justify-content-start" onClick={this.setViewCat} style={{ cursor: 'pointer' }}>&lt; Back to catalog</div>
          <div className="row">
            <img
              src={this.state.product.image}
              className="card-img-top col-4"
              alt={this.state.product.name}
              style={{ objectFit: 'contain', maxHeight: '300px' }} />
            <div className="d-flex flex-column col-7">
              <h3 className="card-title">{this.state.product.name}</h3>
              <h5 className="text-muted">${((this.state.product.price) * 0.01).toFixed(2)}</h5>
              <p>{this.state.product.shortDescription}</p>
              <div>
                <button className="btn btn-primary btn-sm"
                  onClick={this.addToCart}>Add to Cart</button>
              </div>
            </div>
          </div>
          <div className="card-body px-0">
            <p>{this.state.product.longDescription}</p>
          </div>
        </div>
      </div>
    );
  }
}
