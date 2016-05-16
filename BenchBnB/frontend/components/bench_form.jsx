var React = require('react'),
		ClientActions = require('../actions/client_actions'),
		HashHistory = require('react-router').hashHistory;

var BenchForm = React.createClass({
	getInitialState: function() {
		return {
			description: "",
			seats: 0,
			lat: this.props.location.query.lat,
			lng: this.props.location.query.lng
		};
	},
	_changeDescription: function(e) {
		this.setState({description: e.target.value});
	},
	_changeSeats: function(e){
		this.setState({seats: e.target.value});
	},
	_handleSubmit: function(e) {
		e.preventDefault();
		ClientActions.createBench({
			description: this.state.description,
			seating: parseInt(this.state.seats),
			lat: this.state.lat,
			lng: this.state.lng
		});

		HashHistory.push('/');
	},
	render: function() {
		return (
			<form onSubmit={this._handleSubmit}>
				<label>Description</label>
				<textarea value={this.state.description} onChange={this._changeDescription}/>
				<br/>
				<label>Number of seats</label>
				<input type="text" value={this.state.seats} onChange={this._changeSeats} />
				<br/>
				<label>Latitude</label>
				<input type="text" value={this.state.lat} disabled/>
				<br/>
				<label>Longitude</label>
				<input type="text" value={this.state.lng} disabled/>
				<input type="submit"/>
			</form>
		);
	}

});

module.exports = BenchForm;