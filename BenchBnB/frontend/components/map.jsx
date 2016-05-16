var React = require('react'),
       BenchStore = require('../stores/bench'),
       ClientActions = require('../actions/client_actions'),
       SelectedBenchStore = require('../stores/selected_bench'),
       HashHistory = require('react-router').hashHistory;

var Map = React.createClass({
	getInitialState: function() {
		return {
			markersArray: [],
			selectedBench: null
		};
	},
	componentDidMount: function() {
		BenchStore.addListener(this.createMarker);
		// SelectedBenchStore.addListener(this.highlightMarker);
		var mapDOMNode = this.refs.map;
		var mapOptions = {
			center: {lat: 37.7758, lng: -122.435},
			zoom: 13
		};
		this.map = new google.maps.Map(mapDOMNode, mapOptions);
		this.map.addListener("idle", this.fetchBound);
		google.maps.event.addListener(this.map, "click", function(event){
			var coords = {lat: event.latLng.lat(), lng: event.latLng.lng()};
			this._handleClick(coords);
		}.bind(this));
	},
	_handleClick: function(coords) {
		HashHistory.push({
			pathname: "benches/new",
			query: coords
		});
	},
	fetchBound: function(){
		var boundObj = this.map.getBounds();
		var northEast = boundObj.getNorthEast();
		var southWest = boundObj.getSouthWest();
		this.bound = {
			northEast: {
				lat: northEast.lat(),
				lng: northEast.lng()
			},
			southWest: {
				lat: southWest.lat(),
				lng: southWest.lng()
			}
		};
		ClientActions.fetchBenches(this.bound);
	},
	createMarker: function() {
		this.benches = BenchStore.all();
		this.clearMarker();
		Object.keys(this.benches).forEach(function(index){
			this.setMarker(this.benches[index]);
		}.bind(this));
	},
	setMarker: function(bench){
		var newLatLng= new google.maps.LatLng(bench.lat, bench.lng);
		var newMarker = new google.maps.Marker({
			position: newLatLng,
			title: "Hello World!"
		});
		if (this.state.markersArray.indexOf(newMarker) === -1){
			this.state.markersArray.push(newMarker);
		}

		newMarker.setMap(this.map);
	},
	clearMarker: function(){
		var indicesToDelete = [];
		this.state.markersArray.forEach(function(marker, i){
			if (this.outOfBound(marker)){
				marker.setMap(null);
				indicesToDelete.push(i);
			}
		}.bind(this));
		indicesToDelete.reverse().forEach(function(i){
			this.state.markersArray.splice(i, 1);
		}.bind(this));
	},
	outOfBound: function(marker){
		return marker.position.lat() > this.bound.northEast.lat ||
			marker.position.lat() < this.bound.southWest.lat ||
			marker.position.lng() > this.bound.northEast.lng ||
			marker.position.lng() < this.bound.southWest.lng;
	},
	render: function() {
		return (
			<div className="map" ref="map">

			</div>
		);
	}

});

module.exports = Map;