var PokemonStore = require('../../stores/pokemon'),
    ClientActions = require('../../actions/clientActions'),
    PokemonIndexItem = require('./PokemonIndexItem');

var React = require('react');
var PropTypes = React.PropTypes;

var PokemonsIndex = React.createClass({
  getInitialState: function() {
    return {
      pokemons: []
    };
  },

  _onChange: function(){
    this.setState({pokemons: PokemonStore.all()});
  },

  componentDidMount: function() {
    this.pokemonListener = PokemonStore.addListener(this._onChange);
    ClientActions.fetchAllPokemon();
  },

  componentWillUnmount: function() {
    this.pokemonListener.remove();
  },

  render: function() {
    return (
      <div>
        {this.state.pokemons.map(function(pokemon){
          return <PokemonIndexItem key={pokemon.id} pokemon={pokemon}/>;
        })}
      </div>
    );
  }

});

module.exports = PokemonsIndex;
