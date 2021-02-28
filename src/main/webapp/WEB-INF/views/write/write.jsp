<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${root }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${root }/resources/assets/css/style.css">
<link rel="stylesheet" href="${root }/resources/assets/css/write.css">
<link rel="stylesheet" href="${root }/resources/assets/css/common.css">
<title>my fake trip</title>
<body>
<u:navbar/>
<div class="container-sm">
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<h1>게시물 작성</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">

				<form method="post" enctype="multipart/form-data" action="${root }/write/register">
					<div class="form-group">
						<label for="input1">제목</label> <input name="title" type="text" class="form-control" id="input1" placeholder="제목을 입력하세요.">
					</div>

					<div class="form-group">
						<label for="textarea1">내용</label>
						<textarea name="body" class="form-control" id="textarea1" rows="3"></textarea>
					</div>
					<select class="custom-select" name="categoriesid" size="3" id="cartegoriesId">
  			<option selected >카테고리</option>
  			<c:forEach items="${list1 }" var ="cartegories">
  			<option value="${cartegories.id }">${cartegories.name }</option>
  			</c:forEach>
		</select>
		<select class="custom-select" size="3" name="countryid" id="largecountryId">
  			<option selected>나라</option>
  			<c:forEach items="${list2 }" var ="country">
  			<option value="${country.id }">${country.largeCountry} - ${country.smallCountry}</option>
  			</c:forEach>
		</select>
		
        <h3 class="mt-5">가격</h3>
        <div>
          <div class="option-input-wrapper">
            <input type="number" min="1" step="any" name="price-input" id="price-id" class="option-input"  placeholder="가격">
            원
          </div>
        </div>
					<div class="form-group">
						<label for="input3">파일</label>
						<input name="file" type="file" accept="image/*" class="form-control" id="input3">
					</div>
					
					<button type="submit" class="btn btn-primary">글 등록</button>
				</form>
			</div>
		</div>
	</div>
<u:footer/>
</body>
</html>