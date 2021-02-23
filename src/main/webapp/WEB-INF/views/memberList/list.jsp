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
		var result = '${result}';
		var message = '${message}';

		checkModal2(message);

		history.replaceState({}, null, null);

		function checkModal2(message) {
			if (message && history.state == null) {
				$("#myModal .modal-body p").html(message);
				$("#myModal").modal("show");
			}
		}

		var actionForm = $("#actionForm");
		$(".pagination a").click(function(e) {
			e.preventDefault();
			actionForm.find("[name='pageNum']").val($(this).attr('href'));
			actionForm.submit();
		});
		
		var myForm = $("#my-form");
	      $("#delete-member").click(function() {
	        var checkedInput = $(".check-td > input[type='checkbox']:checked");
          	myForm.empty();
	        checkedInput.each(function(idx, elem) {
	          var memberId = $(elem).closest("tr").find(".memberId");

	          var newInput = $("<input />");
	          newInput.attr("name", "id");
	          newInput.attr("value", memberId.text());
	          myForm.append(newInput);
	        });
	        //console.log(myForm.serialize());
	        
	        $.ajax('${root}/memberList/delete', {
	        	method: 'post',
	        	data: myForm.serialize()
	        }).done(function() {
	        	$("#compl-modal").modal("show");
	        }).fail(function() {
	        	// ...
	        	console.log("fail");
	        });
	        
	        //myForm.submit();
	        //$("#compl-modal").modal("show");
	      });
	});
</script>
<link rel="stylesheet" href="${root }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${root }/resources/assets/css/style.css">
<link rel="stylesheet" href="${root }/resources/assets/css/common.css">
<link rel="stylesheet" href="${root }/resources/assets/css/qna.css">

<style>
li.page-item {
	font-size: 1.2rem;
	margin-bottom: 7em;
}

#delete-member {
font-size: 13px;
}
</style>

<title>My fake trip</title>
</head>
<body>
	<u:navbar></u:navbar>
	<div class="container-sm">
		<div class="row">
		
			<h2 class="intro-title">전체 회원 목록</h2>
			<table class="table table-hover">
				<thead class="thead-dark">
					<tr>
						<th></th>
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>휴대폰 번호</th>
						<th>이메일</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="member">
						<tr>
							<td class="check-td"><input type="checkbox"><span class="checkmark"></span></td>
							<td class="memberId"><c:out value="${member.id}" /></td>
							<td><c:out value="${member.name}" /></td>
							<td><c:out value="${member.nickname}"></c:out></td>
							<td><c:out value="${member.phone}"></c:out></td>
							<td><c:out value="${member.email}"></c:out></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${member.regDate}"></fmt:formatDate></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="container-sm mb-3">
		<p align="right">
			<button class="btn btn-danger" id="delete-member">선택한 회원 삭제</button>
		</p>
	</div>
	<form action="${root}/memberList/delete" method="post" hidden id="my-form">
	
	</form>
	<div class="container-sm mt-3">
		<div class="row justify-content-center">

			<nav aria-label="Page navigation example">
				<ul class="pagination">

					<c:if test="${pageMaker.prev }">
						<c:url value="/memberList/list" var="prevLink">
							<c:param value="${pageMaker.startPage -1 }" name="pageNum" />
							<c:param value="${pageMaker.cri.amount }" name="amount" />
						</c:url>
						<li class="page-item">
							<!-- <a class="page-link" href="${prevLink }">Previous</a> --> <a
							class="page-link" href="${pageMaker.startPage-1 }">Previous</a>
						</li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<c:url value="/memberList/list" var="pageLink">
							<c:param name="pageNum" value="${num }" />
							<c:param value="${pageMaker.cri.amount }" name="amount" />

						</c:url>
						<li
							class="page-item ${pageMaker.cri.pageNum eq num ? 'active' : '' }">
							<!-- <a class="page-link" href="${pageLink }">${num }</a> --> <a
							class="page-link" href="${num }">${num }</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next }">
						<c:url value="/memberList/list" var="nextLink">
							<c:param value="${pageMaker.endPage+1 }" name="pageNum" />
							<c:param value="${pageMaker.cri.amount }" name="amount" />
						</c:url>
						<li class="page-item">
							<!-- <a class="page-link" href="${nextLink}">Next</a> --> <a
							class="page-link" href="${pageMaker.endPage+1 }">Next</a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	<div class="d-none">
		<form id="actionForm" action="${root }/memberList/list">
			<input name="pageNum" value="${pageMaker.cri.pageNum }" /> <input
				name="amount" value="${pageMaker.cri.amount }" /> <input
				name="type" value="${pageMaker.cri.type }" /> <input name="keyword"
				value="${pageMaker.cri.keyword }" /> <input type="submit" />
		</form>
	</div>
	<div class="modal fade" id="compl-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">회원 삭제 완료</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p> 삭제가 완료되었습니다. </p>
				</div>

				<div class="modal-footer">
				<!-- 	<!-- <button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button> -->
						<a href="">닫기</a>
				</div>
			</div>
		</div>
	</div>
	<u:footer />
</body>
</html>
