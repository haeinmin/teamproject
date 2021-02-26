<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="${root }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${root }/resources/assets/css/style.css">
<link rel="stylesheet" href="${root }/resources/assets/css/common.css">
<link rel="stylesheet" href="${root }/resources/assets/css/hotel.css">
<title>fake my trim</title>
</head>
<body>
<u:navbar/>
<div class="hotel-list-search-container">
      <div class="hotel-search-container">
        <div class="hotel-list-wrapper">
          <div class="map-container">
            <i class="fas fa-map-marker-alt"></i>
            <span></span>
          </div>
          <div class="date-container">
            <i class="far fa-calendar"></i>
            <input type="text" name="dates" class="form-control" />
          </div>
          <div class="passenger-container">
            <i class="far fa-user"></i>
            <span> 총 0명</span>
            <i class="fas fa-angle-down"></i>
          </div>
          <button class="search-button">
            <span>검색</span>
          </button>
        </div>
      </div>
    </div>
    <!-- search -->
    <div class="hotel-list-container">
      <div class="hotel-left-list-container">
        <!-- map -->
        <div class="hotel-left-map">
          <button class="hotel-left-map-button" type="button">
            <span>
              <i class="fas fa-map-marker-alt"></i>
              지도로 보기
            </span>
          </button>
        </div>
        <!-- map -->
        <!-- theme -->
        <main class="hotel-left-theme">
          <header class="title"><h3>테마</h3></header>
          <section class="hotel-list-theme">
            <ul class="theme-wrapper">
              <li>
                <button type="button" class="theme-btn">
                  <i class="fas fa-th-large"></i>
                  <span>전체</span>
                </button>
              </li>
              <li>
                <button type="button" class="theme-btn"><i class="fas fa-hashtag"></i><span>갓성비 호텔</span></button>
              </li>
              <li>
                <button type="button" class="theme-btn"><i class="fas fa-hashtag"></i><span>오션뷰 호텔</span></button>
              </li>
              <li>
                <button type="button" class="theme-btn"><i class="fas fa-hashtag"></i><span>수영장 호텔</span></button>
              </li>
              <li>
                <button type="button" class="theme-btn">
                  <i class="fas fa-hashtag"></i><span>럭셔리 호캉스</span>
                </button>
              </li>
            </ul>
            <hr />
          </section>
        </main>
        <!-- theme -->
        <!-- filter -->
        <main class="hotel-left-list-filter">
          <header class="list-filter-title">
            <h3>필터</h3>
            <button type="button">전체 초기화</button>
          </header>
          <section class="section-filter">
            <!-- 평균 -->
            <header class="hotel-review-score-filter">
              <h3 class="title">평점</h3>
              <p class="description">0점 - 10점</p>
            </header>
            <input type="range" class="form-range" style="width: 100%" />
            <hr />
            <!-- 평균 -->
            <!-- 총 숙박 요금 -->
            <header class="hotel-review-score-filter">
              <h3 class="title">총 숙박 요금</h3>
              <p class="description">19,000원 ~ 458,000원</p>
            </header>
            <input type="range" class="form-range" style="width: 100%" />
            <hr />
            <!-- 총 숙박 요금 -->
            <!-- 총 숙박 요금 -->
            <header class="hotel-review-score-filter">
              <h3 class="title">호텔등급</h3>
              <p class="description">전체등급</p>
            </header>
            <input type="range" class="form-range" style="width: 100%" />
            <hr />
            <!-- 총 숙박 요금 -->
          </section>
        </main>
        <!-- filter -->
        <!-- 편의시설 -->
        <main class="hotel-left-theme">
          <header class="title"><h3>편의시설</h3></header>
          <section class="hotel-list-theme">
            <ul class="theme-wrapper">
              <li>
                <button type="button" class="theme-btn">
                  <i class="fas fa-hashtag"></i>
                  <span>와이파이</span>
                </button>
              </li>
              <li>
                <button type="button" class="theme-btn"><i class="fas fa-hashtag"></i><span>조식</span></button>
              </li>
              <li>
                <button type="button" class="theme-btn"><i class="fas fa-hashtag"></i><span>공항셔틀</span></button>
              </li>
              <li>
                <button type="button" class="theme-btn"><i class="fas fa-hashtag"></i><span>수영장</span></button>
              </li>
              <li>
                <button type="button" class="theme-btn"><i class="fas fa-hashtag"></i><span>레스토랑</span></button>
              </li>
              <li>
                <button type="button" class="theme-btn"><i class="fas fa-hashtag"></i><span>수하물보관함</span></button>
              </li>
              <li>
                <button type="button" class="theme-btn"><i class="fas fa-hashtag"></i><span>피트니스</span></button>
              </li>
              <li>
                <button type="button" class="theme-btn"><i class="fas fa-hashtag"></i><span>소파</span></button>
              </li>
              <li>
                <button type="button" class="theme-btn"><i class="fas fa-hashtag"></i><span>비즈니스시설</span></button>
              </li>
              <li>
                <button type="button" class="theme-btn"><i class="fas fa-hashtag"></i><span>주차</span></button>
              </li>
              <li>
                <button type="button" class="theme-btn"><i class="fas fa-hashtag"></i><span>세탁</span></button>
              </li>
            </ul>
            <hr />
          </section>
        </main>
        <!-- 편의시설 -->
      </div>
      <!-- 숙소 리스트 -->
      <article class="hotel-right-list-container">
        <div class="hotel-right-filter-bar">
          <div>숙소도 협찬 받습니다.</div>
        </div>
        <section>
    <!--       <div class="hotel-item-card">
            <div>
              <img src="https://images.trvl-media.com/hotels/8000000/7510000/7510000/7509936/3db925eb.jpg" alt="" />
            </div>
            <div class="card-description">
              <div class="hotel-info">
                <span>롯데시티호텔 제주</span>
                <span>도심에서 30.4m • 5성급</span>
              </div>
              <div class="hotel-review">
                <div>8.9</div>
                <div>
                  <span>우수함</span>
                  <span>1,779개의 이용 후기</span>
                </div>
              </div>
            </div>
            <div class="card-price">
              <div>
                <span>최저가</span>
                <del>22,000원</del>
                <p>추가할인 22,000원</p>
              </div>
              <div>
                <p>세금포함</p>
                <span>
                  1박 총
                  <span>11,000</span>
                  원
                </span>
              </div>
            </div>
          </div> -->
        </section>
      </article>
      <!-- 숙소 리스트 -->
    </div>
    <u:footer/>
    <script type="text/javascript">
      $('input[name="dates"]').daterangepicker();
    </script>

</body>
</html>