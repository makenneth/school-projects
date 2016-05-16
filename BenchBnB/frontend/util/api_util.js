var ServerActions = require('../actions/server_actions');
module.exports = {
	fetchBenches: function(bound){
		$.ajax({
			method: "GET",
			url: "/api/benches",
			data: {bounds: bound},
			success: function(benches){
				ServerActions.receiveAll(benches);
			}
		});
	},
	fetchSingleBench: function(id){
		$.ajax({
			method: "GET",
			url: "/api/benches/" + id,  //not sure if we should hit the server again,
			success: function(bench){
				ServerActions.receiveOne(bench);
			}
		})
	},
	createBench: function(bench){
		$.ajax({
			method: "POST",
			url: "/api/benches",
			data: {bench: bench},
			dataType: "json",
			success: function(bench){
				ServerActions.addBench(bench);
			}
		})
	}
}

