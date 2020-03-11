import React from 'react';
import ProductListItem from './product-list-item';

export default class ProductList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      products: []
    };
    this.setViewDetail = this.setViewDetail.bind(this);
  }

  componentDidMount() {
    this.getProducts();
  }

  getProducts() {
    fetch('/api/products')
      .then(res => res.json())
      .then(data => {
        return this.setState({ products: data });
      });
  }

  setViewDetail(event) {
    const productId = Number(event.currentTarget.getAttribute('id'));
    this.props.setView('details', { productId });
  }

  render() {
    const products = this.state.products.map(product =>
      <ProductListItem
        product={product}
        key={product.productId}
        name={product.name}
        price={product.price}
        shortDescription={product.shortDescription}
        setViewDetail={this.setViewDetail}
        productId={product.productId}
        handleClick={this.handleClick} />);

    return (
      <div className="w-100">
        <div className="row row-cols-1 row-cols-md-3 d-flex justify-content-center">
          {products}
        </div>
      </div>
    );
  }
}
