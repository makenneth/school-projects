var AppDispatcher = require('../dispatcher/dispatcher.js');
var PokemonConstants = require('../constants/pokemonConstants');

module.exports = {
  receiveAllPokemons: function(pokemons){
    AppDispatcher.dispatch({
      actionType: PokemonConstants.POKEMONS_RECEIVED,
      allPokemon: pokemons
    });
  },
  receiveOnePokemon: function(pokemon){
    AppDispatcher.dispatch({
      actionType: PokemonConstants.POKEMON_RECEIVED,
      onePokemon: pokemon
    });
  }
};
