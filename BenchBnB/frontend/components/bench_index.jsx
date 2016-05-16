var React = require('react'),
	BenchStore = require("../stores/bench.js"),
	ClientActions = require('../actions/client_actions'),
	HashHistory = require('react-router').hashHistory;

var BenchIndex = React.createClass({
	getInitialState: function() {
		return {
			benches: null
		};
	},
	setBenches: function(){
		this.setState({benches: BenchStore.all()});
	},
	newBench: function(){
		HashHistory.push('benches/new');
	},
	componentDidMount: function() {
		BenchStore.addListener(this.setBenches);
	},
	render: function() {
		var benchesRender, that = this;
		if (this.state.benches) {
			benchesRender = Object.keys(this.state.benches).map(function(index){
				var newBench = that.state.benches[index];
				return <li key={newBench.id}>
							{newBench.description}
						</li>;
			});
		} else {
			benchesRender = "Not yet Loaded";
		}
		return (
			<div id="content">
				{benchesRender}
				<button onClick={this.newBench}>New Bench</button>
			</div>
		);
	}

});

module.exports = BenchIndex;