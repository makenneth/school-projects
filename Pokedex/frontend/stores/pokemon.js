var AppDispatcher = require('../dispatcher/dispatcher');
var Store = require('flux/utils').Store;
var PokemonConstants = require('../constants/pokemonConstants');
var PokemonStore = new Store(AppDispatcher);

var _pokemons = {};


var resetPokemons = function(pokemonsArray){
  _pokemons = {};
  pokemonsArray.forEach(function(pokemon){
    _pokemons[pokemon.id] = pokemon;
  });
  PokemonStore.__emitChange();
};

PokemonStore.find = function(id){
  return _pokemons[id];
};

PokemonStore.all = function(){
  var result = [];
  for (var id in _pokemons){
    if (_pokemons.hasOwnProperty(id)){
      result.push(_pokemons[id]);
    }
  }
  return result;
};

var resetOnePokemon = function (pokemon) {
  _pokemons[pokemon.id] = pokemon;
  PokemonStore.__emitChange();
};

PokemonStore.__onDispatch = function(payload){
  switch(payload.actionType){
    case PokemonConstants.POKEMONS_RECEIVED:
      resetPokemons(payload.allPokemon);
      break;
    case PokemonConstants.POKEMON_RECEIVED:
      resetOnePokemon(payload.onePokemon);
      break;
  }
};

module.exports = PokemonStore;
