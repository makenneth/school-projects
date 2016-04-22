> initialize
getInitialState


componentWillMount
> mount
render
componentDidMount


shouldComponentUpdate
> state changes
render
componentDidUpdate


componentWillReceiveProps
shouldComponentUpdate
> props change
render
componentDidUpdate


componentWillUnmount
> unmount

______________________

render: function () {
  return <MyComp prop1="two" />;
}

pokemonDetail
props: {
  pokemonId: 6
}
