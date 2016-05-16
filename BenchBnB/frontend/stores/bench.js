var Store = require('flux/utils').Store,
       Dispatcher = require('../dispatcher/dispatcher');
var BenchStore = new Store(Dispatcher),
       BenchConstants = require('../constants/bench_constants');


var _benches = {};

var _resetBenches = function(benches){
	_benches = benches;
}
var _addBench = function(bench){
	var maxId = Math.max.apply(null, Object.keys(_benches));
	_benches[maxId] = bench;
}
BenchStore.all = function() {
	return Object.assign({}, _benches)
};

BenchStore.__onDispatch = function(payload){
	switch (payload.actionType){
		case BenchConstants.BENCH_RECEIVED:
			_resetBenches(payload.benches);
			BenchStore.__emitChange();
			break;
		case BenchConstants.BENCH_CREATED:
			_addBench(payload.bench);
			BenchStore.__emitChange();
			break;

	}
};

module.exports = BenchStore;