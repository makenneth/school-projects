var React = require('react'),
	Map = require('./map'),
	BenchIndex = require("./bench_index");

var Search = React.createClass({

	render: function() {
		return (
			<div>
				<Map />
				<BenchIndex />
			</div>
		);
	}

});

module.exports = Search;