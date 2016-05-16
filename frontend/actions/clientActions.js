var AppDispatcher = require('../dispatcher/dispatcher'),
    ApiUtil = require('../util/apiUtil');

module.exports = {
  fetchAllPokemon: function() {
    ApiUtil.fetchAllPokemonFromServer();
  },
  fetchSinglePokemon: function(id) {
    ApiUtil.fetchSinglePokemonFromServer(id);
  }
};
