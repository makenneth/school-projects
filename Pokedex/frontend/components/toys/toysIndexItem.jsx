var React = require('react');


var ToysIndexItem = React.createClass({

  render: function() {
    return (
      <li className="toy-list-item">
        <p>Name: {this.props.toy.name}</p>
        <p>Happiness: {this.props.toy.happiness}</p>
        <p>Price: {this.props.toy.price}</p>
      </li>
    );
  }

});

module.exports = ToysIndexItem;
