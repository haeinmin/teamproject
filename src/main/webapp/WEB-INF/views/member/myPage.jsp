<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="${root }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${root }/resources/assets/css/style.css">
<link rel="stylesheet" href="${root }/resources/assets/css/common.css">
<link rel="stylesheet" href="${root }/resources/assets/css/myPage.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>정보수정</title>
<script>
$(document).ready(function() {
		$("#deleteSubmit").click(function() {
			var userId = "${authUser.id}";
			
			$.ajax("/member/delete?" + $.param({userId: userId}), {
				method: "delete" 
			}).fail(function() {
				window.location = "home";
				console.log("삭제 실패");
			}).done(function() {
				window.location = "home";
				console.log("삭제 완료");
			});
		});
});
</script>
</head>
<body>
	<u:navbar />
	<!--main-->
	<main class="traveler">
		<div class="traveler-container clearfix">
			<div class="traveler-body">
				<main class="member-box box mode-readonly clearfix" id="member">
					<div class="member-container width-edit-btn">
						<a class="btn-new btn--type-outline btn--size-xs btn-modify"
							href="#" id="account-modify">편집</a>
						<div class="content-wrapper">
							<div class="profile-img-container hide-on-tablet">
								<img
									src="//d2yoing0loi5gh.cloudfront.net/assets/default/user_profile_image-414acc60b27f0a258bec14c82b70dc361fc6768da9289f924f887bec1fc33849.png"
									alt="User profile image" class="img profile-img" width="98px;">
								<div class="text">유저 닉네임</div>
							</div>
							<div class="member-wrapper">
								<form action="${root }/member/modify" class="fv-form fv-form-bootstrap"
									data-validation="true" accept-charset="UTF-8" method="POST"
									novalidate="novalidate">
									<input type="hidden" class="form-control text-content" value="${authUser.id}" readonly name="id" id="id" style="height:30px">
									<input type="hidden" class="form-control text-content" value="${authUser.email}" readonly name="email" style="height:30px">
									<%-- <input type="date" class="form-control text-content" value="${authUser.regdate}" readonly name="regdate" style="height:30px">	 --%>
									<button class="fv-hidden-submit"
										style="display: none; width: 0px; height: 0px;"></button>
									<!-- <input type="hidden" name="utf-8" value=""> <input
										type="hidden" name="_method" value="put"> <input
										type="hidden" name="authenticity_token"
										value="pTcdCOFFm5jRK2NGrJdaE8huDIWt4uGAnB9Iz0XOje17KrugLic/gMeAtovye6yysuniwlVQNzWVlILefO2Apw=="> -->
									<div class="form-group form-input-group">
										<div class="title text-middle">닉네임</div>
										<div class="input-wrapper text-middle">
											<div class="row">
												<div class="col-xs-12">
													<input type="text" class="form-control text-content"
														value="${authUser.nickname}" readonly name="nickname" id="nickname" style="height:30px">
												</div>
											</div>
										</div>
									</div>
									<div class="form-group form-input-group">
										<div class="title text-middle">비밀번호</div>
										<div class="input-wrapper text-middle">
											<div class="row">
												<div class="col-xs-12">
													<input type="text" class="form-control text-content"
														value="${authUser.password}" readonly name="password"
														id="password" style="height:30px">
												</div>
											</div>
										</div>
									</div>
									<div class="form-group form-input-group">
										<div class="title text-middle">성명</div>
										<div class="input-wrapper text-middle">
											<div class="row">
												<div class="col-xs-12">
													<input type="text" class="form-control text-content"
														value="${authUser.name}" readonly name="name"
														id="name" style="height:30px">
												</div>
											</div>
										</div>
									</div>
									<div class="form-group form-input-group">
										<div class="title text-middle">전화번호</div>
										<div class="input-wrapper text-middle">
											<div class="row">
												<div class="col-xs-12">
													<input type="text" class="form-control text-content"
														value="${authUser.phone}" readonly name="phone"
														id="phone" style="height:30px">
												</div>
											</div>
										</div>
									</div>
									<div class="form-btn-wrap d-none" id="button-group">
										<div class="form-btn-container clearfix">
											<div class="btn--width-50">
												<button
													class="btn-new btn--type-gray btn--width-100 btn--size-sm"
													onclick="javascript:location.reload();return false;"
													style="border: 0px">취소하기</button>
											</div>
											<div class="btn--width-50">
												<button
													class="btn-new btn--type-primary btn--width-100 btn--size-sm"
													id="account-submit" name="account-edit" type="submit"
													style="border: 0px">저장하기</button>
											</div>
										</div>
									</div>
								</form>
								<div id="modify-hidden">
									<div class="form-group form-input-group">
										<div class="title text-middle">이메일</div>
										<div class="input-wrapper text-middle">
											<div class="row">
												<div class="col-xs-12">
													<input type="text" class="form-control text-content"
														value="${authUser.email}" readonly name="email"
														id="email" style="height:30px">
												</div>
											</div>
										</div>
									</div>
									<%-- <div class="form-group form-input-group">
										<div class="title text-middle">가입일</div>
										<div class="input-wrapper text-middle">
											<div class="row">
												<div class="col-xs-12">
													<input type="text" class="form-control text-content" 
														value= "<fmt:formatDate pattern="yyyy-MM-dd" value="${authUser.regdate}"/>"
													readonly name="regdate" id="regdate" style="height:30px">
												</div>
											</div>
										</div>
									</div> --%>
								<div class="form-group form-input-group">
										<div class="title text-middle">나의 쿠폰</div>
										<div class="input-wrapper text-middle">
											<div class="row">
												<div class="col-xs-12">
													<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
													쿠폰 확인
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</main>
				<div class="account-remove" id="remove">
					<div class="text-clickable-container" data-popup-window>
						<div class="text text-sm">계정 탈퇴하기</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<div id="myModal" class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" style="font-size: 20px;">회원 탈퇴진행</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p style="font-size: 15px;">정말로 탈퇴 하시겠습니까 ?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						style="font-size: 12px;" id="deleteSubmit">삭제하기</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" style="font-size: 12px;">취소</button>
				</div>
			</div>
		</div>
	</div>
		
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">내가 보유한 쿠폰</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<c:forEach var="coupon" items="${list}">
			<p><c:out value="${coupon.couponName}" /></p>
		</c:forEach>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	<script>
		var isModify = false;
		var $accountModify = $('#account-modify');
		var $accountInput = $('#nickname, #password, #name, #phone');
		var $modifyHidden = $('#modify-hidden');
		var $buttonGroup = $('#button-group');
		var $remove = $('#remove');
		$accountModify.off().on('click', function(event) {
			if (isModify) {
				// 수정취소.
				isModify = false;
				$accountInput.attr('readonly', 'readonly');
				$buttonGroup.addClass('d-none');
				$modifyHidden.removeAttr('hidden');
			} else {
				//인풋 수정
				isModify = true;
				$accountInput.removeAttr('readonly');
				$buttonGroup.removeClass('d-none');
				$modifyHidden.attr('hidden', 'hidden')				
			}
			console.log(isModify)
		})
		$remove.off().on('click', function(event) {
			$('#myModal').modal('show')
		})
	</script>
	<u:footer />
</body>
</html>