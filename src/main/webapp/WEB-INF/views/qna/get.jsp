<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<script>
	var appRoot = '${root}';
	var qnaNo = ${qna.qnaNo};
</script>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="${root }/resources/js/reply.js"></script>
<script>
	$(document).ready(function() {
		//날짜 형식
		function dateString(date) {
			var d = new Date(date);
			return d.toISOString().split("T")[0];
		}

		function showList() {			
			replyService.getList({qnaNo: qnaNo}, function(list) {
				var replyUL = $("#reply-ul");
				for (var i =0; i<list.length; i++) {
					var replyLI = '<li class="media" data-rno="' 
						+ list[i].replyNo + '" ><div class="media-body"><h5>'
						+ list[i].reply + '<small class="float-right">' 
						+ dateString(list[i].replyDate) + "</small></h5>"
						+ list[i].replier + "<hr></div></li>";		
					replyUL.append(replyLI);
				}
			});
		}
		// 새 댓글 버튼 클릭 이벤트 처리 
		$("#new-reply-button").click(function() {
			console.log("new reply...");
			$("#new-reply-modal").modal("show");
		});
		
		// 새 댓글 등록 버튼 클릭 이벤트 처리 
		$("#reply-submit-button").click(function() {
			// input에서 value 가져와서 변수에 저장 
			var reply = $("#reply-input").val();
			var replier = $("#replier-input").val();
			
			// ajax 요청을 위한 데이터 만들기 
			var data = {qnaNo:qnaNo, reply:reply , replier:replier};
			
			replyService.add(data,
					function() {
						//성공 시 새로고침 
						location.reload();
						alert("댓글이 등록되었습니다.");
					}, 
					function() {
						alert("댓글 등록에 실패하였습니다.")
					});
			//모달창 닫기
			$("#new-reply-modal").modal("hide");
			
			//모달창 내의 input element 비우기
			$("#new-reply-modal").val("");
			
		});
		
		//reply-ul 클릭 이벤트 처리
		$("#reply-ul").on("click", "li", function() {
			console.log($(this).attr("data-rno"));
			
			//해당 댓글 읽어오기
			var replyNo = $(this).attr("data-rno");
			replyService.get(replyNo, function(data) {
				$("#rno-input2").val(replyNo);
				$("#reply-input2").val(data.reply);
				$("#replier-input2").val(data.replier);
				$("#modify-reply-modal").modal('show');
			});
			
		});
		
		//수정 버튼 이벤트 처리
		$("#reply-modify-button").click(function() {
			var replyNo = $("#rno-input2").val();
			var reply = $("#reply-input2").val();
			var data = {replyNo:replyNo , reply:reply };
			
			replyService.update(data, function() {
				alert("댓글을 수정하였습니다.");
				location.reload();
			}); 
		});
		
		$("#reply-delete-button").click(function() {
			var replyNo = $("#rno-input2").val();
			
			replyService.remove(replyNo, function() {
				alert("댓글이 삭제되었습니다.");
				location.reload();
			}); 
		});
		
		
		
		// 댓글 목록 가져오기 
		showList();


	});
</script>
<link rel="stylesheet" href="${root }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${root }/resources/assets/css/style.css">
<link rel="stylesheet" href="${root }/resources/assets/css/common.css">
<link rel="stylesheet" href="${root }/resources/assets/css/qna.css">
<style>
#input1, #input2, #input3{
	height: 3em;
	padding: 10px;
	font-size: 13px;
}

#textarea1 {
	height: 20em;
	padding: 10px;
	font-size: 13px;
}

#modify-button {
margin-top: 1.3em;
margin-bottom: 1em;
font-size: 14px;
padding-right: 13px;
padding-left: 13px;}

.card {
	height: 20em;
	font-size: 13px;
	margin-bottom: 6em;
}

#new-reply-button {
font-size: 13px;
padding-right: 13px;
padding-left: 13px;}
}

.ml-auto {
  margin-left:auto;
}


</style>
<title>My fake trip</title>

</head>
<body>
	<u:navbar></u:navbar>
	<div class="container-sm mb-3">
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<!-- responsive web design according to the size of the window -->
				<h2 class="intro-title">문의 내용</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<div class="form-group">
					<label for="input3">번호</label> <input class="form-control"
						type="text" id="input3" readonly value="${qna.qnaNo }" />
				</div>
				<div class="form-group">
					<label for="input1">제목</label> <input readonly
						value='<c:out value="${qna.qnaTitle }" />' type="text"
						class="form-control" id="input1">
				</div>

				<div class="form-group">
					<label for="textarea1">내용</label>
					<textarea readonly class="form-control" id="textarea1" rows="3"><c:out
							value="${qna.qnaContent }" /></textarea>
				</div>

				<div class="form-group">
					<label for="input2">작성자</label> <input readonly
						value='<c:out value="${qna.nickname }" />' type="text"
						class="form-control" id="input2">
				</div>
				<c:url value="/qna/modify" var="modifyLink">
					<c:param name="qnaNo" value="${qna.qnaNo }"></c:param>
					<c:param name="pageNum" value="${cri.pageNum }"></c:param>
					<c:param name="amount" value="${cri.amount }"></c:param>
				</c:url>
				<p align="right">
				<u:isWriter writer="${qna.nickname }">
				<a href="${modifyLink }" class="btn btn-secondary ml-auto" id="modify-button"> 수정 </a>
				</u:isWriter>	
				</p>
			</div>
		</div>
	</div>
	<div class="container-sm mt-3">
		<div class="row">
			<div class="col-12 col-sm-6 offset-sm-3">
				<div class="card">
					<div class="card-header d-flex justify-content-between">
						<span class="reply-list">  </span>

						<button class="btn btn-info" id="new-reply-button">댓글 쓰기</button>
					</div>
					<div class="card-body">
						<ul class="list-unstyled" id="reply-ul">
							<!-- <li class="media">
								<div class="media-body">
									<h5>
										user00<small>2021/01/29</small>
									</h5>
									댓글 본문...........
									<hr>
								</div>
							</li> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- modal 새 댓글 form --%>
	<div class="modal fade" id="new-reply-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">새 댓글</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="reply-input" class="col-form-label"> 댓글 </label> <input
							type="text" class="form-control" id="reply-input">
					</div>
					<div class="form-group">
						<label for="replier-input" class="col-form-label"> 작성자 </label> <input
							type="text" class="form-control" id="replier-input">
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button id="reply-submit-button" type="button"
						class="btn btn-primary">등록</button>
				</div>
			</div>
		</div>
	</div>

	<%-- modal 댓글 수정 form --%>
	<div class="modal fade" id="modify-reply-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">수정 / 삭제</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input id="rno-input2" type="hidden" />
					<div class="form-group">
						<label for="reply-input2" class="col-form-label"> 댓글 </label> <input
							type="text" class="form-control" id="reply-input2">
					</div>
					<div class="form-group">
						<label for="replier-input2" class="col-form-label"> 작성자 </label> <input
							type="text" readonly class="form-control" id="replier-input2">
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button id="reply-modify-button" type="button"
						class="btn btn-primary">수정</button>
					<button id="reply-delete-button" type="button"
						class="btn btn-danger">삭제</button>
				</div>
			</div>
		</div>
	</div>
</body>
<u:footer></u:footer>
</html>