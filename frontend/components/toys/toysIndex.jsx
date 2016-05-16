var PokemonStore = require('../../stores/pokemon');

var React = require('react');

var ToysIndex = React.createClass({
  getInitialState: function() {
    return {
      toys: []
    };
  },

  componentDidMount: function() {
    var pokemon = PokemonStore.find(this.props.params.pokemonId);
    this.setState({toys: pokemon.toys});
  },
  render: function() {
    return (
      <div>
        { this.state.toys.map(function(toy){
            return <ToyIndexItem key={toy.id} toy={toy}/>;
          })
        }
      </div>
    );
  }

});

module.exports = ToysIndex;
