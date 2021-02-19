<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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



<title>Insert title here</title>
</head>
<body>

<m:navbar />

<form method="post" action="${root }/member/myModify" >
  <div class="form-group row">
    <label for="staticId" class="col-sm-2 col-form-label">아이디</label>
    <div class="col-sm-10">
      <input type="text" readonly name="id" class="form-control-plaintext" id="staticId" value="${sessionScope.authUser.id }">
    </div>
  </div>
  <div class="form-group row">
    <label for="staticPw" class="col-sm-2 col-form-label">비밀번호</label>
    <div class="col-sm-10">
      <input type="password" name="password" class="form-control-plaintext" id="staticPw" value="${sessionScope.authUser.password }">
    </div>
  </div>
  <div class="form-group row">
    <label for="staticName" class="col-sm-2 col-form-label">이름</label>
    <div class="col-sm-10">
      <input type="text" readonly name="name" class="form-control-plaintext" id="staticName" value="${sessionScope.authUser.name }">
    </div>
  </div>
  <div class="form-group row">
    <label for="staticNickname" class="col-sm-2 col-form-label">닉네임</label>
    <div class="col-sm-10">
      <input type="text" name="nickname" class="form-control-plaintext" id="staticNickname" value="${sessionScope.authUser.nickname }">
    </div>
  </div>
  
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">이메일</label>
    <div class="col-sm-10">
      <input type="text" name="email" class="form-control-plaintext" id="staticEmail" value="${sessionScope.authUser.email }">
    </div>
  </div>
  
  
  <div class="form-group row">
    <label for="staticLoc" class="col-sm-2 col-form-label">번호</label>
    <div class="col-sm-10">
      <input type="text" name="phone" class="form-control-plaintext" id="staticLoc" value="${authUser.phone }">
    </div>
  </div>
	
	<button type="submit" class="btn btn-primary">수정</button>
</form>

</body>
</html>