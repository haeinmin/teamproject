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
		var noAuthUser = $("#noAuthUser-modal")

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
		
		$("#write-button").click(function() {
			if ("${authUser.id}"=='') {
				noAuthUser.modal('show');
				e.preventDefault();
			}
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
}
#inlineFormCustomSelectPref {
	padding: 0 55px !important;
    height: 48px;
    border: none !important;
    border-radius: 4px;
    transition: all 0.3s ease;
    box-shadow: 0 1px 4px 0 rgba(52, 58, 64, 0.15), 0 0 1px 0 rgba(52, 58, 64, 0.2);
    font-size: 13px !important;
    font-weight: inherit;
    width: 30%;
}

#write-button {
font-size: 13px;}

.btn-outline-success {
width: 10%;
height:35px;
margin-left:3px;}
</style>
<title>My fake trip</title>
</head>
<body>
	<u:navbar></u:navbar>
	<div class="container-sm">
		<div class="row">
			<section id="main-content" class="section hero">
				<div class="hero-inner">
					<h2 class="intro-title">무엇을 도와드릴까요?</h2>
					<%-- <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
						focusable="false" viewBox="0 0 12 12" class="search-icon"
						aria-hidden="true">
            <circle cx="4.5" cy="4.5" r="4" fill="none"
							stroke="currentColor"></circle>
            <path stroke="currentColor" stroke-linecap="round"
							d="M11 11L7.5 7.5"></path>
          </svg> --%>
					<form role="search" class="search search-full d-flex align-items-center flex-nowrap" data-search=""
						data-instant="true" autocomplete="off" action="${root }/qna/list" id=""
						accept-charset="UTF-8" method="get">
						<!-- <input name="utf8" type="hidden" value="✓"> <input
							type="search" name="query" id="query"
							placeholder="여기에 검색어를 입력해주세요..." autocomplete="off"
							aria-label="여기에 검색어를 입력해주세요..."> -->
							<select name="type" class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
							   <option value="T" ${pageMaker.cri.type eq 'T' ? 'selected' : '' }>제목</option>
	    <option value="C" ${pageMaker.cri.type eq 'C' ? 'selected' : '' }>내용</option>
	    <option value="W" ${pageMaker.cri.type eq 'W' ? 'selected' : '' }>작성자</option>
	    <%-- <option value="TC" ${pageMaker.cri.type eq 'TC' ? 'selected' : '' }>제목 or 내용</option>
	    <option value="TW" ${pageMaker.cri.type eq 'TW' ? 'selected' : '' }>제목 or 작성자</option>
	    <option value="TWC" ${pageMaker.cri.type eq 'TWC' ? 'selected' : '' }>제목 or 내용 or 작성자</option> --%>
	  </select>
      <input name="keyword" required value="${pageMaker.cri.keyword }" class="form-control mr-sm-2" type="search" placeholder="여기에 검색어를 넣으세요..." aria-label="여기에 검색어를 넣으세요...">
      <input type="hidden" name="pageNum" value="1" />
      <input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
					</form>
				</div>
			</section>
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
					<c:forEach items="${pinList}" var="pin">
						<tr class="table-warning">
							<td>[공지]</td>
							<td><c:url value="/qna/get" var="qnaLink">
									<c:param value="${pin.qnaNo }" name="qnaNo" />
									<c:param value="${pageMaker.cri.pageNum }" name="pageNum" />
									<c:param value="${pageMaker.cri.amount }" name="amount" />
								</c:url> <a href="${qnaLink }"><c:out value="${pin.qnaTitle}" />  </a></td>
							<td><c:out value="${pin.nickname}"></c:out></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${pin.qnaDate}"></fmt:formatDate></td>
						</tr>
					</c:forEach>
					<c:forEach items="${list}" var="qna">
						<tr>
							<td>${qna.qnaNo}</td>
							<td><c:url value="/qna/get" var="qnaLink">
									<c:param value="${qna.qnaNo }" name="qnaNo" />
									<c:param value="${pageMaker.cri.pageNum }" name="pageNum" />
									<c:param value="${pageMaker.cri.amount }" name="amount" />
								</c:url> <a href="${qnaLink }"><c:out value="${qna.qnaTitle}" /> <c:if
										test="${qna.replyCnt gt 0 }">
										<span class="badge badge-info">${qna.replyCnt }</span>
									</c:if> </a></td>
							<td><c:out value="${qna.nickname}"></c:out></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${qna.qnaDate}"></fmt:formatDate></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<button id="write-button" type="button"
				class="btn btn-primary ml-auto mt-4" <u:isLogin>
				onclick="location.href =  '${root }/qna/register';"</u:isLogin>>문의 작성하기</button>


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
				name="amount" value="${pageMaker.cri.amount }" /> <input
				name="type" value="${pageMaker.cri.type }" /> <input name="keyword"
				value="${pageMaker.cri.keyword }" /> <input type="submit" />
		</form>
	</div>
	
	<div id="noAuthUser-modal" class="modal" tabindex="-1">
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
					<p>로그인 시 작성 가능합니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<br>
	<br>
	<u:footer />
</body>
</html>
