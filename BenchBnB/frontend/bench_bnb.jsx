var React = require('react'),
       ReactDOM = require('react-dom'),
       Search = require('./components/search'),
       BenchForm = require('./components/bench_form'),
       ReactRouter = require('react-router'),
       Router = ReactRouter.Router,
       Route = ReactRouter.Route,
       HashHistory = ReactRouter.hashHistory,
       IndexRoute = ReactRouter.IndexRoute;

var App = React.createClass({
	render: function() {
		return (
			<div>
				<header><h1>Bench BnB</h1></header>
				{this.props.children}
			</div>
		);
	}
});

var Routes = (
	<Route path="/" component={App}>
		<IndexRoute component={Search} />
		<Route path="benches/new" component={BenchForm} />
	</Route>
);

document.addEventListener("DOMContentLoaded", function(){
	ReactDOM.render(<Router history={HashHistory}>
										{Routes}
									</Router>, document.getElementById("root")
									); 
});