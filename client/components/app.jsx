import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: {
        name: 'catalog',
        params: {}
      }
    };
    this.setView = this.setView.bind(this);
  }

  setView(name, params) {
    this.setState({
      view: {
        name: name,
        params
      }
    });
  }

  componentDidMount() {
    fetch('/api/health-check')
      .then(res => res.json())
      .then(data => this.setState({ message: data.message || data.error }))
      .catch(err => this.setState({ message: err.message }))
      .finally(() => this.setState({ isLoading: false }));
  }

  render() {
    const setView = this.setView;
    const viewName = this.state.view.name;
    const viewParams = this.state.view.params;
    if (viewName === 'catalog') {
      return (
        <div className="w-100 bg-light">
          <Header />
          <ProductList setView={setView}/>
        </div>
      );
    } if (viewName === 'details') {
      return (
        <div>
          <Header />
          <ProductDetails product={this.props.product}
            setView={setView} viewParams={viewParams} />
        </div>
      );
    }
  }
}
