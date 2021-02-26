<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="m" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
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
// 모달 출력 조건
	$(document).ready(function(){
		var message = '${message}';
		
		console.log("ffddf");
		
		checkModal(message);
		history.replaceState({}, null, null);
		
		function checkModal(message) {
			if (message && history.state == null) {
				console.log("function 탐");
				$("#myModal").modal("show");
			}
		}
			
		
	});
</script>

<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="${root }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${root }/resources/assets/css/style.css">
<link rel="stylesheet" href="${root }/resources/assets/css/common.css">
<title>my fake trip</title>
</head>
<body>
<u:navbar/>
<form action="${root }/member/login" method="POST">
        <div class="loginform">
            <div class="loginform-text">
                <div class="loginform-input">
                    <div class="sinup-module">
                        <label for="Id" class="sinup-text">
                            <p>아이디 *</p>
                            <div>
                                <input type="text" class="TextField-module__input--kfks8 TextField-module__medium--2zybh" id="Id" name="inputId" placeholder="아이디를 입력해주세요." value="">
                            </div>
                        </label>
                    </div>
                    <div class="sinup-module">
                        <label for="Password" class="sinup-text">
                            <p>비밀번호 *</p>
                            <div>
                                <input type="password" class="TextField-module__input--kfks8 TextField-module__medium--2zybh" id="Password" name="inputPw" placeholder="비밀번호를 입력해주세요" value="">
                            </div>
                        </label>
                    </div>
                    <div class="sinup-module">
                        <div class="find">
                            <a href="#" class="findId">아이디 찾기</a> |
                            <a href="#" class="findPw">비밀번호 찾기</a>
                        </div>
                    </div>
                    <div class="sinup-btn"> 
                    
                        <button type="submit" class="Button-module__button--1H779 Button-module__primary--3KITS Button-module__large--xFJf5 Button-module__block--2gnY_ undefined">로그인</button>
                    </div>
                </div>
                <div class="sinup-link">
                    <span class="sinup-join">아직 회원이 아니신가요?</span>
                    <a href="#" class="sinup-join-link">회원가입</a>
                </div>
            </div>
    </div>
</form>
<u:footer/>

<%--모달창 --%>  
    
 <div id="myModal" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">알림</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>${message }</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



</body>
</html>