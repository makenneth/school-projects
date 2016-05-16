var Dispatcher = require('../dispatcher/dispatcher'),
       BenchConstants = require('../constants/bench_constants');


module.exports = {
	receiveAll: function(benches){
		Dispatcher.dispatch({
			actionType:  BenchConstants.BENCH_RECEIVED,
			benches: benches
		});
	},
	receiveOne: function(bench){
		Dispatcher.dispatch({
			actionType: BenchConstants.SELECTED_BENCH_RECEIVED,
			bench: bench
		})
	},
	addBench: function(bench){
		Dispatcher.dispatch({
			actionType: BenchConstants.BENCH_CREATED,
			bench: bench
		})
	}
}