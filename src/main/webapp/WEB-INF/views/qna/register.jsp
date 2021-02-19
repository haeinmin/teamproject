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
<link rel="stylesheet" href="${root }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${root }/resources/assets/css/style.css">
<link rel="stylesheet" href="${root }/resources/assets/css/common.css">
<link rel="stylesheet" href="${root }/resources/assets/css/qna.css">
<style>
#input1, #input2{
	height: 4em;
	padding: 10px;
	font-size: 13px;
}

#textarea1 {
	height: 20em;
	padding: 10px;
	font-size: 13px;
}

#write-button {
margin-top: 1.3em;
margin-bottom: 7em;
font-size: 14px;
padding-right: 13px;
padding-left: 13px;}


</style>
<title>My fake trip</title>
</head>
<body>
	<u:navbar></u:navbar>
	<div class="container-sm mb-3">
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<!-- responsive web design according to the size of the window -->
				<h2 class="intro-title">문의 작성</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<!--  <form action="${pageContext.request.contextPath }/board/register">  경로가 같은 경우 action생략해도 됨  -->
				<form method="post">
					
					<!-- 관리자일 시@@@@@@@@@@@@@@@ -->
					<div class="wrap">
						<input id="agree" type="checkbox" name="pin"> <label
							for="agree"> <span>공지사항으로 등록하기</span>
						</label>
					</div>

					<div class="form-group mt-3 mb-3">
						<label for="input1">제목</label> <input type="text" name="qnaTitle"
							class="form-control" id="input1" placeholder="제목을 입력하세요">
					</div>

					<div class="form-group mt-3 mb-3">
						<label for="textarea1">내용</label>
						<textarea class="form-control" id="textarea1" rows="3"
							name="qnaContent"></textarea>
					</div>

					<!-- 로그인 시 아이디로 가져올 것@@@@@@@@@@@@@@@이클립스 참고   -->
					<div class="form-group mt-3 mb-3">
						<label for="input2">작성자</label> <input name="writer" type="text"
							value="${authUser.nickname }" readonly class="form-control" id="input2" placeholder="이름을 입력하세요">
					</div>
					<p align="right">
					<button type="submit" class="btn btn-primary mr-0" id="write-button">등록하기</button></p>


				</form>

			</div>
		</div>
	</div>
	<u:footer />
</body>
</html>