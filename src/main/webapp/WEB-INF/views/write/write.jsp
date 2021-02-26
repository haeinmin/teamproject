<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<script>
var appRoot = '${root}';
</script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
 	<link rel="stylesheet" href="${root }/resources/assets/css/write.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/froala-editor@3.1.0/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/froala-editor@3.1.0/js/froala_editor.pkgd.min.js"></script>
    <script src="${root }/resources/js/promotions.js"></script>
  </head>
  <body>
    <div class="write-page-header">
      <div class="header-container">
        <div class="header">
          <i id="btn-back" class="fas fa-arrow-left" style="cursor: pointer"></i>
        </div>
      </div>
    </div>
    <div class="container w-100">
      <div class="px-4 w-100" style="padding-top: 6rem">
        <div class="d-flex flex-row justify-content-between">
          <div class="d-flex flex-row">
            <label class="label-cover-photo button-transparent" id="btn-cover-image">
              <i class="far fa-image"></i>
              <span>사진등록</span>
            </label>
             <label class="label-cover-photo button-transparent dropdown-category" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="btn-category">
              <i class="fas fa-tag"></i>
              <span>태그</span>
             <!--  <div class="dropdown-menu" aria-labelledby="btn-category">
                <div class="dropdown-item">Action</div>
                <div class="dropdown-item">Another action</div>
                <div class="dropdown-item">Something else here</div>
              </div> -->
            </label>
            <label class="label-cover-photo button-transparent dropdown-country" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="btn-country">
              <i class="fas fa-globe-asia"></i>
              <span>도시-국가</span>
            <!--   <div class="dropdown-menu" aria-labelledby="btn-country">
                <div class="dropdown-item">Action</div>
                <div class="dropdown-item">Another action</div>
                <div class="dropdown-item">Something else here</div>
              </div> -->
            </label>
          </div>
          <div>
            <button class="btn btn-dark" id="register-btn" type="button">등록하기</button>
            <button class="btn btn-dark" type="button">수정하기</button>
            <button class="btn btn-light" type="button" date-id="delete-btn">삭제하기</button>
          </div>
        </div>
        <div id="prevew-area"></div>
        <div class="mt-5">
          <textarea maxlength="150" placeholder="Title…" id="textarea-title" class="textarea-title" spellcheck="false"></textarea>
        </div>
        <div id="editor"></div>
        
       <select class="custom-select" size="3" id="cartegoriesId">
  			<option selected >카테고리</option>
  			<c:forEach items="${list1 }" var ="cartegories">
  			<option value="${cartegories.id }">${cartegories.name }</option>
  			</c:forEach>
		</select>
		<select class="custom-select" size="3" id="largecountryId">
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
       
    </div>
    <script src="${root }/resources/js/promotions.js"></script>
    <script>
    	var inputFile = '';
    	$("#cartegoriesId option:selected").attr('${cartegories.id}');
    	$("#countryId option:selected").attr('${largecountryId }');
    	$("#countryId option:selected").attr('${country.id }');
      var previewImage = function (file) {
        var blobURL = window.URL.createObjectURL(file);
        return (
          '<div class="mb-5">' +
          '  <div class="post-cover"' +
          '   style="background-image: url(' +
          blobURL +
          ');">' +
          '    <div class="post-cover-inner">' +
          '      <button type="button" id="btn-remove-preview"><i class="fas fa-times"></i></button>' +
          '    </div>' +
          '  </div>' +
          '</div>'
        );
      };
      var editor = new FroalaEditor('#editor', {
        placeholderText: '내용을 작성해주세요.',
        iconsTemplate: 'font_awesome_5',
        toolbarButtons: {
          moreText: {
            buttons: [
              'bold',
              'italic',
              'underline',
              'fontFamily',
              'fontSize',
              'textColor',
              'backgroundColor',
              'inlineClass',
              'inlineStyle',
            ],
            buttonsVisible: 3,
          },
          moreParagraph: {
            buttons: ['alignLeft', 'alignCenter', 'alignRight'],
            buttonsVisible: 3,
          },
          moreRich: {
            buttons: ['insertLink', 'insertTable'],
            buttonsVisible: 3,
          },
          moreMisc: {
            buttons: ['undo', 'redo', 'html'],
            align: 'right',
            buttonsVisible: 3,
          },
        },
      });
      var $previewArea = $('#prevew-area');
      var $coverImage = $('#btn-cover-image');
      var $removeTextInput = $('[name=remove-text-input]');
      var $country = $('[name=country-input]');
      var $category = $('[name=category-input]');
      var $price = $('[name=price-input]');
      var $btnBack = $('#btn-back');
      $coverImage.off().on('click', function (event) {
        var input = document.createElement('input');
        input.type = 'file';
        input.onchange = function () {
          $coverImage.addClass('d-none');
          $previewArea.addClass('mb-5').addClass('mt-5');
          $previewArea.html(previewImage(input.files[0]));
          inputFile = input.files[0];
          $('#btn-remove-preview')
            .off()
            .on('click', function () {
              $coverImage.removeClass('d-none');
              $previewArea.removeClass('mb-5').removeClass('mt-5');
              $previewArea.empty();
            });
        };
        input.click();
      });
      function onKeyup(event) {
        if (event.currentTarget.value && event.currentTarget.value.length) {
          event.currentTarget.nextElementSibling.classList.remove('d-none');
          return;
        }
        event.currentTarget.nextElementSibling.classList.add('d-none');
      }
      function onClick(event) {
        event.currentTarget.previousElementSibling.value = '';
        event.currentTarget.classList.add('d-none');
      }
      $btnBack.off().on('click', function () {
        history.back();
      });
      $removeTextInput.off().on('click', onClick);
      $category.off().on('keyup', onKeyup);
      $country.off().on('keyup', onKeyup);
      $('#register-btn')
        .off()
        .on('click', function () {
          var body = {
            title: $('#textarea-title').val(),
            body: editor.html.get(),
            price: $price.val().toLocaleLowerCase(),
            category: $('#cartegoriesId').val(),
            continent: $('#continent-id').val(),
            large_country: $('#largecountryId').val(),
            small_country: $('#countryId').val(),
          };
          
          var formData = new FormData();
          formData.set('title', $('#textarea-title').val());
          formData.set('body', editor.html.get());
          formData.set('countryid', $('#largecountryId').val());
          formData.set('categoriesid', $('#cartegoriesId').val());
          formData.set('price', $price.val().toLocaleLowerCase());
          formData.set('file', inputFile);
          promotionsService.add2(formData);
		/*
          promotionsService.add(body, function(result) {
        	  console.log(result)
          }, function(error) {
        	  console.error(error)
          });
          */
          console.log(formData.get('title'));
          console.log(formData.get('body'));
          console.log(formData.get('countryid'));
          console.log(formData.get('categoriesid'));
          console.log(formData.get('price'));
          console.log(formData.get('file'));
          console.log(body);
        });
    </script>
  </body>
</html>