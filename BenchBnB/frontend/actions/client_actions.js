var Dispatcher = require('../dispatcher/dispatcher'),
       ApiUtil = require('../util/api_util');

module.exports = {
	fetchBenches: function(bound){
		ApiUtil.fetchBenches(bound);
	},
	fetchSingleBench: function(id){
		ApiUtil.fetchSingleBench(id);
	},
	createBench: function(bench){
		ApiUtil.createBench(bench);
	}
}