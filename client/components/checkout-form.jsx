import React from 'react';

export default class CheckoutForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { name: '', card: '', address: '' };
    this.setViewCat = this.setViewCat.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  getTotalPurchase() {
    return this.props.cart.reduce((acc, cur) => acc + cur.price, 0);
  }

  setViewCat(event) {
    this.props.setView('catalog', {});
  }

  handleChange(event) {
    this.setState({ [event.target.id]: event.target.value });
  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.placeOrder(this.state);
    this.setState({ name: '', card: '', address: '' });
  }

  render() {
    const { name, card, address } = this.state;
    const isEnabled = name.length > 0 && card.length > 0 && address.length > 0;
    return (
      <div className="row mx-0">
        <div className="col-7 mx-auto d-flex flex-column">
          <h2 className="mb-4">My Cart</h2>
          <h5 className="d-flex align-items-center text-muted mb-4">Total Purchase: ${(this.getTotalPurchase()) * 0.01.toFixed(2)}</h5>
          <form className="d-flex flex-column">
            <label htmlFor="name">Name</label>
            <input type="text" id="name" className="mb-4" value={this.state.name} onChange={this.handleChange} />
            <label htmlFor="card">Credit Card</label>
            <input type="text" id="card" className="mb-4" value={this.state.card} onChange={this.handleChange} />
            <label htmlFor="address">Shipping Address</label>
            <textarea type="textarea" id="address" className="mb-4" value={this.state.address} rows="4" onChange={this.handleChange} />
            <div className="d-flex justify-content-between">
              <div className="hover text-muted mb-4 pt-0 px-0 btn d-flex justify-content-start" onClick={this.setViewCat}>&lt; Back to catalog</div>
            </div>
            <div>
              <button type="button" className="btn btn-primary" id="order" disabled={!isEnabled} onClick={this.handleSubmit}>Place Order</button>
            </div>
          </form>
        </div>
      </div>
    );
  }
}
