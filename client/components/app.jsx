import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';
import CartSummary from './cart-summary';
import CheckoutForm from './checkout-form';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      message: null,
      isLoading: true,
      view: {
        name: 'catalog',
        params: {}
      },
      cart: []
    };
    this.setView = this.setView.bind(this);
    this.addToCart = this.addToCart.bind(this);
    this.placeOrder = this.placeOrder.bind(this);
  }

  setView(name, params) {
    this.setState({
      view: {
        name: name,
        params
      }
    });
  }

  getCartItems() {
    fetch('/api/cart')
      .then(res => res.json())
      .then(data => {
        this.setState({
          cart: Array.from(data)
        });
      });
  }

  componentDidMount() {
    fetch('/api/health-check')
      .then(res => res.json())
      .then(data => this.setState({ message: data.message || data.error }))
      .catch(err => this.setState({ message: err.message }))
      .finally(() => this.setState({ isLoading: false }));
    this.getCartItems();
  }

  addToCart(product) {
    const cartItems = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(product)
    };
    fetch('/api/cart', cartItems)
      .then(res => res.json())
      .then(data => {
        this.setState({
          cart: this.state.cart.concat(data)
        });
      });
  }

  placeOrder(order) {
    fetch('/api/orders/', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        name: order.name,
        creditCard: order.card,
        shippingAddress: order.address
      })
    })
      .then(res => res.json())
      .then(data => {
        this.setState({ cart: [] });
        this.setView('catalog', {});
      })
      .catch(err => console.error(err));
  }

  render() {
    const viewName = this.state.view.name;
    if (viewName === 'catalog') {
      return (
        <div className="w-100 bg-light">
          <Header setView={this.setView}
            cartItemCount={this.state.cart.length} />
          <ProductList setView={this.setView} />
        </div>
      );
    } else if (viewName === 'details') {
      return (
        <div>
          <Header setView={this.setView}
            cartItemCount={this.state.cart.length} />
          <ProductDetails product={this.props.product}
            setView={this.setView} viewParams={this.state.view.params}
            addToCart={this.addToCart} />
        </div>
      );
    } else if (viewName === 'cart') {
      return (
        <div className="w-100 bg-light">
          <Header setView={this.setView}
            cartItemCount={this.state.cart.length} />
          <CartSummary cart={this.state.cart} setView={this.setView} />
        </div>
      );
    } else if (viewName === 'checkout') {
      return (
        <div className="w-100 bg-light">
          <Header setView={this.setView}
            cartItemCount={this.state.cart.length} />
          <CheckoutForm cart={this.state.cart} setView={this.setView} placeOrder={this.placeOrder}/>
        </div>
      );
    }
  }
}
