import React, { Component } from 'react';
import ProductListItem from './product-list-item';

export default class ProductList extends Component {
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
        });
      });
  }

  render() {
    return (
      <div className="row justify-content-around ">
        {
          this.state.products.map(product => {
            return (
              <ProductListItem
                key={product.productId}
                img={product.image}
                name={product.name}
                price={product.price}
                short={product.shortDescription}
              />
            );
          })
        }
      </div>
    );
  }
}
