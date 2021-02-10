//console.log("reply module....");
var replyService = (function() {

	function add(reply, callback, error) {     // form data, function if succeded, function if failed in order
	//	console.log("add1 method");
		console.log(reply);

		$.ajax({
			type: "post",
			url: appRoot +"/qna/replies/new", //context root로 변경 
			data: JSON.stringify(reply),			//form data를 json으로 작성 (client가 보내는 js obj를 json으로 변환하는 함수)
			contentType: "application/json; charset=UTF-8",
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function getList(param, callback, error) {
	
		var qnaNo = param.qnaNo;
		var page = param.page || 1;
		
		$.getJSON(appRoot +"/qna/replies/pages/" + qnaNo + "/" + page,
			function(data) {
				if(callback) {
				callback(data);
				}
			}).fail(function(xhr, status, err){
				if(error) {
					error();
				}
			});
	}
	
	function remove(replyNo, callback, error) {
		$.ajax({
			type: 'delete',
			url: appRoot +'/qna/replies/' + replyNo,
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function update(reply, callback, error) {
		$.ajax({
			type: 'put',
			url: appRoot +'/qna/replies/' + reply.replyNo,
			data: JSON.stringify(reply),
			contentType: "application/json;charset=UTF-8",
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function get(replyNo, callback, error) {
		$.get(appRoot + '/qna/replies/' + replyNo, function(data) {
			if (callback) {
				callback(data);
			}
		}).fail(function() {
			if (error) {
				error();
			}
		});
	}
	
	return {
		add: add,
		getList: getList,
		remove: remove,
		update: update,
		get: get
	};
})();