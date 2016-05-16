var React = require('react');


var PokemonIndexItem = React.createClass({
  contextTypes: {
    router: React.PropTypes.object.isRequired
  },
  showDetail: function(){
    this.context.router.push("pokemon/" + this.props.pokemon.id);
  },
  render: function() {
    return (
        <li className="poke-list-item" onClick={this.showDetail}>
          <p>Name: {this.props.pokemon.name}</p>
          <p>Type: {this.props.pokemon.poke_type}</p>
        </li>
    );
  }

});

module.exports = PokemonIndexItem;
