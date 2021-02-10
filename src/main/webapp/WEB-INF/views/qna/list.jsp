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
	});


</script>
<link rel="stylesheet" href="${root }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${root }/resources/assets/css/style.css">
<link rel="stylesheet" href="${root }/resources/assets/css/common.css">
<style>
li.page-item {
	font-size: 1rem;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<u:navbar></u:navbar>
	<div class="container-sm">
		<div class="row">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>#번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="qna">
						<tr>
							<td>${qna.qnaNo}</td>
							<td><c:url value="/qna/get" var="qnaLink">
									<c:param value="${qna.qnaNo }" name="qnaNo" />
									<c:param value="${pageMaker.cri.pageNum }" name="pageNum" />
									<c:param value="${pageMaker.cri.amount }" name="amount" />
								</c:url> <a href="${qnaLink }"><c:out value="${qna.qnaTitle}" />
										<c:if test="${qna.replyCnt gt 0 }">
											<span class="badge badge-info">${qna.replyCnt }</span>
										</c:if>
									</a></td>
							<td><c:out value="${qna.nickname}"></c:out></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${qna.qnaDate}"></fmt:formatDate></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="modal" tabindex="-1" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">알림</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>처리가 완료되었습니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container-sm mt-3">
		<div class="row justify-content-center">
			<nav aria-label="Page navigation example">
				<ul class="pagination">

					<c:if test="${pageMaker.prev }">
						<c:url value="/qna/list" var="prevLink">
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
						<c:url value="/qna/list" var="pageLink">
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
						<c:url value="/qna/list" var="nextLink">
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
		<form id="actionForm" action="${root }/qna/list">
			<input name="pageNum" value="${pageMaker.cri.pageNum }" /> <input
				name="amount" value="${pageMaker.cri.amount }" />
				<input name="type" value="${pageMaker.cri.type }" />
				<input name="keyword" value="${pageMaker.cri.keyword }" /> <input
				type="submit" />
		</form>
	</div>
	<u:footer />
</body>
</html>
