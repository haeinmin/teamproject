var promotionsService = (function() {

	function add2(formData, callback, error) {
		$.ajax({
	        url: appRoot + '/write/register2',
	        type: 'POST',
	        data: formData,
	        async: false,
	        cache: false,
	        contentType: false,
	        enctype: 'multipart/form-data',
	        processData: false,
	        success: function (response) {
	          alert(response);
	        }
	    });
	
	}

	function add(promotions, callback, error) {
		console.log(promotions);
		$.ajax({
			type: "post",
			url: "http://localhost:8080/controller" +"/write/register",  // context root로 변경
			data: JSON.stringify(promotions),     // form data를 json 타입으로 변경.
			contentType: "application/json; charset=utf-8",
			success: function(result, stauts, xhr) {
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
		//var bno = param.bno;
		//var page = param.page || 1;
		// javascript 
		// boolean false : 0, "", null, undefined
		
		$.getJSON(appRoot + "/write/pages/" + id + "/" + page, function(data) {
			if (callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
		function remove(id, callback, error) {
		$.ajax({
			type: 'delete',
			url: appRoot +'/write/' + id,
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
	function update(reply, callback, error){
		$.ajax({
			type: 'put',
			url: appRoot + '/write/' + promotions.id,
			data: JSON.stringify(reply),
			contentType: 'application/json; charset=utf-8',
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
	function get(rno, callback, error){
		$.get(appRoot + '/write/' + id, function(data){
			if(callback){
				callback(data);
			}
		}).fail(function() { 
			if(error){
				error();
			}
		});
	}
	return {
		add: add,
		getList: getList,
		remove: remove,
		update : update,
		get : get,
		add2: add2
	};
})();