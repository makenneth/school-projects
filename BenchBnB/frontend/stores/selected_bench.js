var Dispatcher = require('../dispatcher/dispatcher'),
       Store = require('flux/utils').Store,
       BenchConstants = require('../constants/bench_constants');

var SelectedBenchStore = new Store(Dispatcher);
var _selectedBench = null;

var resetSelected = function(bench){
	_selectedBench = bench;
	SelectedBenchStore.__emitChange();
};
SelectedBenchStore.show = function(){
	return _selectedBench;
};
SelectedBenchStore.__onDispatch = function(payload){
	switch (payload.actionType){
		case BenchConstants.SELECTED_BENCH_RECEIVED:
			resetSelected(payload.bench);
			break;
	}
}
module.exports = SelectedBenchStore;