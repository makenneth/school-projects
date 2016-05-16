var ServerActions = require('../actions/serverActions.js');

module.exports = {
  fetchAllPokemonFromServer: function(){
    $.ajax({
      method: "GET",
      url: "/api/pokemon",
      dataType: 'json',
      success: function(allPokemon){
        ServerActions.receiveAllPokemons(allPokemon);
      }
    });
  },

  fetchSinglePokemonFromServer: function(pokeId){
    $.ajax({
      method: "GET",
      url:  "/api/pokemon/" + pokeId,
      dataType: 'json',
      success: function(onePokemon){
        ServerActions.receiveOnePokemon(onePokemon);
      }
    });
  }
};
