<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>

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

<title>이벤트 페이지 home1</title>
<script>
$(document).ready(function() {
	var successModal = $("#success-modal");
	var duplicatedModal = $("#duplicated-modal");
	var unloginedModal = $("#unlogined-modal");
	$("#upsideBtn1").click(function() {
		console.log("btn1");
		
		if("${authUser.id}" == '') {
			unloginedModal.modal('show');
		} else {
		
			$.ajax({ 
				method: "POST", 
				url: "/coupon/new",
				data: '{"memberId": "${authUser.id}","couponName":"전국 할인쿠폰 7000원"}',
				contentType: "application/json"
			}).done(function() {
				successModal.modal('show');
			}).fail(function() {
				duplicatedModal.modal('show');
			});
		}
	});
	$("#upsideBtn2").click(function() {
		console.log("btn1");
		
		if("${authUser.id}" == '') {
			unloginedModal.modal('show');
		} else {
		
			$.ajax({ 
				method: "POST", 
				url: "/coupon/new",
				data: '{"memberId": "${authUser.id}","couponName":"전국 할인쿠폰 14000원"}',
				contentType: "application/json"
			}).done(function() {
				successModal.modal('show');
			}).fail(function() {
				duplicatedModal.modal('show');
			});
		}
	});
	$("#downsideBtn1").click(function() {
		console.log("btn1");
		
		if("${authUser.id}" == '') {
			unloginedModal.modal('show');
		} else {
		
			$.ajax({ 
				method: "POST", 
				url: "/coupon/new",
				data: '{"memberId": "${authUser.id}","couponName":"제주도 할인쿠폰 5000원"}',
				contentType: "application/json"
			}).done(function() {
				successModal.modal('show');
			}).fail(function() {
				duplicatedModal.modal('show');
			});
		}
	});
	$("#downsideBtn2").click(function() {
		console.log("btn1");
		
		if("${authUser.id}" == '') {
			unloginedModal.modal('show');
		} else {
		
			$.ajax({ 
				method: "POST", 
				url: "/coupon/new",
				data: '{"memberId": "${authUser.id}","couponName":"제주도 할인쿠폰 10000원"}',
				contentType: "application/json"
			}).done(function() {
				successModal.modal('show');
			}).fail(function() {
				duplicatedModal.modal('show');
			});
		}
	});
});
</script>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet" href="${root }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${root }/resources/assets/css/style.css">
<link rel="stylesheet" href="${root }/resources/assets/css/common.css">
<style>
.event-container {
	position: relative;
	margin-top: 100px;
	margin-bottom: 100px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.event-container img {
	width: 60%;
	height: auto;
}

.event-container #upsideBtn1 {
	position: absolute;
	top: 23%;
	left: 28%;
}

.event-container #upsideBtn2 {
	position: absolute;
	top: 23%;
	right: 28%;
}

.event-container #downsideBtn1 {
	position: absolute;
	top: 66%;
	left: 28%;
}

.event-container #downsideBtn2 {
	position: absolute;
	top: 66%;
	right: 28%;
}

/* .event-container .btn:hover {
  background-color: blue;
}
 */
</style>
</head>
<body>
	<u:navbar />

	<div class="event-container">
		<img src="/resources/event/eventPic.png" id="eventPic" alt="Snow">

		<!-- <button class="btn">Button</button> -->
		<input type="image" id="upsideBtn1" src="/resources/event/upsideBtn1.png" />
		<input type="image" id="upsideBtn2" src="/resources/event/upsideBtn2.png" />
		<input type="image" id="downsideBtn1" src="/resources/event/downsideBtn1.png" />
		<input type="image" id="downsideBtn2" src="/resources/event/downsideBtn2.png" />
	</div>

	<div id="success-modal" class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">쿠폰을 받았습니다.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>마이페이지에서 확인해주세요.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<div id="duplicated-modal" class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">이미 받은 쿠폰입니다.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>더 이상 받을 수 없습니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<div id="unlogined-modal" class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">로그인 시 이용 가능한 기능입니다.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>로그인 후 쿠폰을 받아가세요.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<u:footer />
	<script>
</script>
</body>
</html>