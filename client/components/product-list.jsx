import React from 'react';
import ProductListItem from './product-list-item';

export default class ProductList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      products: []
    };
  }

  componentDidMount() {
    this.getProducts();
  }

  getProducts() {
    fetch('/api/products')
      .then(res => res.json())
      .then(data => {
        this.setState({
          products: data
        })
          .catch(err => console.error(err));
      });
  }

  render() {
    const products = this.state.products.map(product =>
      <ProductListItem
        product={product}
        key={product.productId}
        handleClick={this.handleClick} />);

    return (
      <div className="w-50 mx-auto">
        <div className="row row-cols-1 row-cols-md-3">
          {products}
        </div>
      </div>
    );
  }
}
