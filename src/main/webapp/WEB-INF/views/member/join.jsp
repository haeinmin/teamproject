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
		
		console.log("fdg");
		
		checkModal(message);
		history.replaceState({}, null, null);
		
		function checkModal(message) {
			if (message && history.state == null) {
				console.log("function 탐");
				$("#myModal").modal("show");
			}
		}
		
		var result = '${result}';
		if(result != null && result != ''){
			alert(result);
		}
		
	});
</script>

<head>
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
<div class="signup">
        <form action="${root }/member/join" method="post">
            <input type="hidden" name="" value="">
            <div class="signup-info">
                <div class="sinup-module">
                    <label for="userName" class="sinup-text">
                        <p>이름 *</p>
                        <div>
                            <input type="text" class="TextField-module__input--kfks8 TextField-module__medium--2zybh" id="userName" name="name" placeholder="이름을 입력해주세요." value=""  required>
                        </div>
                    </label>
                </div>
                <div class="sinup-module">
                    <label for="userNickname" class="sinup-text">
                        <p>닉네임 *</p>
                        <div>
                            <input type="text" class="TextField-module__input--kfks8 TextField-module__medium--2zybh" id="userNickname" name="nickname" placeholder="닉네임을 입력해주세요." value="" required>
                        </div>
                    </label>
                </div>
                <div class="sinup-module">
                    <label for="userId" class="sinup-text">
                        <p>아이디 *</p>
                        <div>
                            <input type="text" class="TextField-module__input--kfks8 TextField-module__medium--2zybh" id="userId" name="id" placeholder="아이디를 입력해주세요." value="" required>
                        </div>
                    </label>
                </div>
                <div class="sinup-module">
                    <label for="userPassword" class="sinup-text">
                        <p>비밀번호 *</p>
                        <div>
                            <input type="password" class="TextField-module__input--kfks8 TextField-module__medium--2zybh" id="userPassword" name="password" placeholder="영문, 숫자, 특수문자 2가지 조합 6~15자" value="" required>
                        </div>
                    </label>
                </div>
                
                <div class="sinup-module">
                    <label for="userPassword1" class="sinup-text">
                        <p>비밀번호 확인 *</p>
                        <div>
                            <input type="password" class="TextField-module__input--kfks8 TextField-module__medium--2zybh" id="userPassword1" name="pwConfirm" placeholder="비밀번호를 한번더 입력해주세요." value="" required>
                        </div>
                    </label>
                </div>
                
                <div class="sinup-module">
                    <label for="userEmail" class="sinup-text">
                        <p>이메일 *</p>
                        <div>
                            <input type="email" class="TextField-module__input--kfks8 TextField-module__medium--2zybh" id="userEmail" name="email" placeholder="q@example.com" value="" required>
                        </div>
                    </label>
                </div>
                <div class="sinup-module">
                    <label for="userPone" class="sinup-text">
                        <p>전화번호 *</p>
                        <div>
                            <input type="text" class="TextField-module__input--kfks8 TextField-module__medium--2zybh" id="userPone" name="phone" placeholder="010-1234-5678" value="" required>
                        </div>
                    </label>
                </div> 
                <button type="submit" class="Button-module__button--1H779 Button-module__primary--3KITS Button-module__large--xFJf5 Button-module__block--2gnY_ undefined">회원가입</button>
            </div>
        </form>
    </div>
    <u:footer/>
    
    <%--모달창 --%>  
    
 <div id="myModal" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">회원가입에 실패하였습니다.</h5>
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