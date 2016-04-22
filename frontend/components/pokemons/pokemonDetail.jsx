var React = require('react'),
    PokemonStore = require('../../stores/pokemon'),
    ClientActions = require('../../actions/clientActions');

var PropTypes = React.PropTypes;

var PokemonDetail = React.createClass({
  getInitialState: function() {
    return {
      pokemon: this.getStateFromStore()
    };
  },

  _farFetched: function(){
    this.setState({pokemon: this.getStateFromStore()});
  },

  componentDidMount: function() {
    this.pokemonListener = PokemonStore.addListener(this._farFetched);
  },

  getStateFromStore: function(){
    return PokemonStore.find(parseInt(this.props.params.pokemonId));
  },
  componentWillReceiveProps: function(nextProps) {
    ClientActions.fetchSinglePokemon(nextProps.params.pokemonId);
  },
  render: function() {
    var poke = this.state.pokemon;
    var details = <div></div>;
    if (poke){
      details = <div className="detail">
                  <img src={poke.image_url} />
                  <p>Name: {poke.name}</p>
                  <p>Attack: {poke.attack}</p>
                  <p>Defense: {poke.defense}</p>
                  <p>Type: {poke.poke_type}</p>
                  <p>Moves: {poke.moves}</p>
                </div>;
   }
    return (
      <div>
        <div className="pokemon-detail-pane">
          {details}
        </div>
      </div>
    );
  }

});

module.exports = PokemonDetail;
