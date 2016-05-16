var React = require('react'),
    ReactDOM = require('react-dom'),
    PokemonsIndex = require('./components/pokemons/pokemonsIndex'),
    PokemonDetail = require('./components/pokemons/pokemonDetail'),
    Router = require('react-router').Router,
    Route = require('react-router').Route,
    HashHistory = require('react-router').hashHistory;
    // ApiUtil = require('./util/apiUtil.js'),
    // ClientActions = require('./actions/clientActions'),
    // PokemonStore = require('./stores/pokemon');



    var App = React.createClass({
      render : function () {
        return (
          <div>
            <h2>Pokemon</h2>
            <div id="pokedex">
              <div className="pokemon-index-pane"><PokemonsIndex /></div>
              <div>{this.props.children}</div>
            </div>
          </div>
        );
      }
    });

    var routes = (
      <Route path="/" component={App}>
        <Route path="pokemon/:pokemonId" component={PokemonDetail}>
          // <Route path="toys/:toyId" component={ToysDetail}></Route>
        </Route>
      </Route>
    );


document.addEventListener("DOMContentLoaded", function(){

  ReactDOM.render(<Router history={HashHistory}>
    {routes}
  </Router>, document.getElementById("root"));

});
