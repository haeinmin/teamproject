<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
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
<script>
	$(document).ready(function() {
		$("#remove-btn").click(function(e) {
			e.preventDefault();
			//change action attribute value of #modify-form
			$("#modify-form").attr("action", "${root}/qna/delete");
			$("#modify-form").submit();
		});
	});
</script>
<link rel="stylesheet" href="${root }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${root }/resources/assets/css/style.css">
<link rel="stylesheet" href="${root }/resources/assets/css/common.css">
<link rel="stylesheet" href="${root }/resources/assets/css/qna.css">
<style>
#input1, #input2, #input3 {
	height: 3em;
	padding: 10px;
	font-size: 13px;
}

#textarea1 {
	height: 20em;
	padding: 10px;
	font-size: 13px;
}

#modify-button, #remove-btn {
	margin-top: 1.3em;
	margin-bottom: 1em;
	font-size: 14px;
	padding-right: 13px;
	padding-left: 13px;
	margin-bottom: 8em;
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
				<h2 class="intro-title">문의 수정</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<!--  <form action="${pageContext.request.contextPath }/board/register">  경로가 같은 경우 action생략해도 됨  -->
				<form id="modify-form" method="post" action="${root}/qna/modify">
					<div class="form-group">
						<label for="input3">번호</label> <input class="form-control"
							name="qnaNo" type="text" readonly value="${qna.qnaNo }"
							id="input3" />
					</div>
					<div class="form-group">
						<label for="input1">제목</label> <input type="text" name="qnaTitle"
							class="form-control" id="input1"
							value='<c:out value="${qna.qnaTitle }"/>'>
					</div>

					<div class="form-group">
						<label for="textarea1">내용</label>
						<textarea class="form-control" id="textarea1" rows="3"
							name="qnaContent"><c:out value="${qna.qnaContent }"></c:out></textarea>
					</div>

					<div class="form-group">
						<label for="input2">작성자</label> <input readonly name="id"
							type="text" class="form-control" id="input2"
							value='<c:out value="${qna.id }" />'>
					</div>
					<input hidden value="${cri.pageNum }" name="pageNum" /> <input
						hidden value="${cri.amount }" name="amount" />
					<p align="right">
						<button id="modify-button" type="submit" class="btn btn-primary">수정</button>
						<button id="remove-btn" type="submit" class="btn btn-danger">삭제</button>
					</p>
				</form>

			</div>
		</div>
	</div>
	<u:footer />
</body>
</html>