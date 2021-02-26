<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>

<html>
<head>
	<title>my fake trip</title>
</head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="${root }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${root }/resources/assets/css/style.css">
<link rel="stylesheet" href="${root }/resources/assets/css/common.css">
<body>
<u:navbar/>

<main>
      <div class="main-container">
        <!-- banner list -->
        <section class="main-wrapper">
          <!-- main swiper head -->
          <div class="head-title">
            <div class="wrapper grid">
              <h2>어디로 떠나세요?</h2>
              <a class="all-views-country" href="${root }/resources/view/regions.jsp">
                <img src="https://dffoxz5he03rp.cloudfront.net/icons/ic_all_md_blue_500.svg" alt="ic_all_md_blue_500" />
                <span>전체보기</span>
              </a>
            </div>
          </div>
          <!-- main swiper head -->
          <!-- main swiper content -->
          <div class="head-content" style="height: 330px;">
            <div class="wrapper">
              <div class="Carousel">
                <!-- swiperjs -->
                <div class="swiper-container">
                  <div class="swiper-wrapper">
                    <div class="swiper-slide swiper-card-country">
                      <img
                        src="https://d2ur7st6jjikze.cloudfront.net/landscapes/4890_xlarge_square_1558949569.jpg?1558949569"
                        alt=""
                        class="responsive-card"
                      />
                      <div class="gradientBackground"></div>
                      <div class="swiper-card-country-header">
                        <div class="title">
                          <span>푼타 카나</span>
                        </div>
                       <!-- <span class="description">
                   			 <span style="
                              overflow: hidden;
                              text-overflow: ellipsis;
                              -webkit-box-orient: vertical;
                              display: -webkit-box;
                              -webkit-line-clamp: 2;
                            "
                            >10여 개의 여행 상품</span
                          ></span> -->
                      </div>
                     <!--  <a class="city-page-btn" href="/#">둘러보기</a> -->
                    </div>
                    <div class="swiper-slide swiper-card-country">
                      <img
                        src="https://d2ur7st6jjikze.cloudfront.net/landscapes/4744_xlarge_square_1535960572.jpg?1535960572"
                        alt=""
                        class="responsive-card"
                      />
                      <div class="gradientBackground"></div>
                      <div class="swiper-card-country-header">
                        <div class="title">
                          <span>서울</span>
                        </div>
                        <!-- <span class="description"
                          ><span
                            style="
                              overflow: hidden;
                              text-overflow: ellipsis;
                              -webkit-box-orient: vertical;
                              display: -webkit-box;
                              -webkit-line-clamp: 2;
                            "
                            >900여 개의 여행 상품</span
                          ></span
                        > -->
                      </div>
                      <!-- <a class="city-page-btn" href="/#">둘러보기</a> -->
                    </div>
                    <div class="swiper-slide swiper-card-country">
                      <img
                        src="https://d2ur7st6jjikze.cloudfront.net/landscapes/4737_xlarge_square_1535949304.jpg?1535949304"
                        alt=""
                        class="responsive-card"
                      />
                      <div class="gradientBackground"></div>
                      <div class="swiper-card-country-header">
                        <div class="title">
                          <span>제주도</span>
                        </div>
                        <!-- <span class="description"
                          ><span
                            style="
                              overflow: hidden;
                              text-overflow: ellipsis;
                              -webkit-box-orient: vertical;
                              display: -webkit-box;
                              -webkit-line-clamp: 2;
                            "
                            >2,660여 개의 여행 상품</span
                          ></span
                        > -->
                      </div>
                    <!--   <a class="city-page-btn" href="/#">둘러보기</a> -->
                    </div>
                    <div class="swiper-slide swiper-card-country">
                      <img
                        src="https://d2ur7st6jjikze.cloudfront.net/landscapes/832_xlarge_square_1493257137.jpg?1493257137"
                        alt=""
                        class="responsive-card"
                      />
                      <div class="gradientBackground"></div>
                      <div class="swiper-card-country-header">
                        <div class="title">
                          <span>경기도</span>
                        </div>
                        <!-- <span class="description"
                          ><span
                            style="
                              overflow: hidden;
                              text-overflow: ellipsis;
                              -webkit-box-orient: vertical;
                              display: -webkit-box;
                              -webkit-line-clamp: 2;
                            "
                            >2,120여 개의 여행 상품</span
                          ></span
                        > -->
                      </div>
                      <!-- <a class="city-page-btn" href="/#">둘러보기</a> -->
                    </div>
                    <div class="swiper-slide swiper-card-country">
                      <img
                        src="https://d2ur7st6jjikze.cloudfront.net/landscapes/455_xlarge_square_1439866837.jpg?1439866837"
                        alt=""
                        class="responsive-card"
                      />
                      <div class="gradientBackground"></div>
                      <div class="swiper-card-country-header">
                        <div class="title">
                          <span>경상도</span>
                        </div>
                        <!-- <span class="description"
                          ><span
                            style="
                              overflow: hidden;
                              text-overflow: ellipsis;
                              -webkit-box-orient: vertical;
                              display: -webkit-box;
                              -webkit-line-clamp: 2;
                            "
                            >2,420여 개의 여행 상품</span
                          ></span
                        > -->
                      </div>
                      <!-- <a class="city-page-btn" href="/#">둘러보기</a> -->
                    </div>
                    <div class="swiper-slide swiper-card-country">
                      <img
                        src="https://d2ur7st6jjikze.cloudfront.net/landscapes/292_xlarge_square_1430355824.jpg?1430355824"
                        alt=""
                        class="responsive-card"
                      />
                      <div class="gradientBackground"></div>
                      <div class="swiper-card-country-header">
                        <div class="title">
                          <span>경주</span>
                        </div>
                        <!-- <span class="description"
                          ><span
                            style="
                              overflow: hidden;
                              text-overflow: ellipsis;
                              -webkit-box-orient: vertical;
                              display: -webkit-box;
                              -webkit-line-clamp: 2;
                            "
                            >90여 개의 여행 상품</span
                          ></span
                        > -->
                      </div>
                      <!-- <a class="city-page-btn" href="/#">둘러보기</a> -->
                    </div>
                    <div class="swiper-slide swiper-card-country">
                      <img
                        src="https://d2ur7st6jjikze.cloudfront.net/landscapes/84_xlarge_square_1405351339.jpg?1405351339"
                        alt=""
                        class="responsive-card"
                      />
                      <div class="gradientBackground"></div>
                      <div class="swiper-card-country-header">
                        <div class="title">
                          <span>수원</span>
                        </div>
                        <!-- <span class="description"
                          ><span
                            style="
                              overflow: hidden;
                              text-overflow: ellipsis;
                              -webkit-box-orient: vertical;
                              display: -webkit-box;
                              -webkit-line-clamp: 2;
                            "
                            >30여 개의 여행 상품</span
                          ></span
                        > -->
                      </div>
                      <!-- <a class="city-page-btn" href="/#">둘러보기</a> -->
                    </div>
                    <div class="swiper-slide swiper-card-country">
                      <img
                        src="https://d2ur7st6jjikze.cloudfront.net/landscapes/599_xlarge_square_1472227370.jpg?1472227370"
                        alt=""
                        class="responsive-card"
                      />
                      <div class="gradientBackground"></div>
                      <div class="swiper-card-country-header">
                        <div class="title">
                          <span>김포</span>
                        </div>
                        <!-- <span class="description"
                          ><span
                            style="
                              overflow: hidden;
                              text-overflow: ellipsis;
                              -webkit-box-orient: vertical;
                              display: -webkit-box;
                              -webkit-line-clamp: 2;
                            "
                            >10여 개의 여행 상품</span
                          ></span
                        > -->
                      </div>
                      <!-- <a class="city-page-btn" href="/#">둘러보기</a> -->
                    </div>
                  </div>

                  <!-- <div class="swiper-pagination"></div>  -->
                  <div class="carousel-button swiper-button-prev swiper-button-black"></div>
                  <div class="carousel-button swiper-button-next swiper-button-black"></div>
                </div>
                <!-- swiperjs -->
              </div>
            </div>
          </div>
          <!-- main swiper content -->
        </section>
        <!-- banner list -->
      </div>
      
       <!-- 홈 스와이퍼 -->
    <div class="swiper-container newSwiper-container" style="width: 1100px; height: 280px; position: relative;">
      <div class="swiper-wrapper">
        <div class="swiper-slide" style="width: 1060px;">
          <img class="swiper-slide"
            src="https://d2ur7st6jjikze.cloudfront.net/cms/1560_original_1613723748.jpg?1613723748">
        </div>

        <div class="swiper-slide">
          <img class="swiper-slide"
            src="https://d2ur7st6jjikze.cloudfront.net/cms/1389_original_1597911550.png?1597911550">
        </div>
        <div class="swiper-slide">
          <img class="swiper-slide"
            src="https://d2ur7st6jjikze.cloudfront.net/cms/478_original_1577953842.jpg?1577953842"">
              </div>
              <div class=" swiper-slide">
          <img class="swiper-slide"
            src="https://d2ur7st6jjikze.cloudfront.net/cms/642_original_1601029566.jpg?1601029566">
        </div>
        <div class="swiper-pagination"></div>
      </div>
    </div>
    <!-- 홈 스와이퍼 -->
    
      <div class="main-offer-container">
        <div class="main-offer-title-container">
          <div class="offer-title">
            <header>
              <div>
                <h2>전국 핫플 최저가 🎠</h2>
              </div>
            </header>
          </div>
        </div>
        <div class="main-offer-content-container">
          <div class="offer-content">
            <div class="wrapper">
              <div class="trip-card-wrapper">
                <a class="trip-card">
                  <div class="trip-card-thumbnail">
                    <div class="thumbnail-wrapper">
                      <div class="thumbnail">
                        <img
                          alt=""
                          src="https://d2ur7st6jjikze.cloudfront.net/offer_photos/99618/541639_medium_1602487798.jpg?1602487798"
                        />
                      </div>
                    </div>
                  </div>
                  <div class="trip-card-body">
                    <div class="categorys">
                      <div
                        style="
                          text-align: start;
                          overflow: hidden;
                          text-overflow: ellipsis;
                          -webkit-box-orient: vertical;
                          display: -webkit-box;
                          -webkit-line-clamp: 1;
                          line-height: normal;
                        "
                      >
                        가이드 투어 ・ 서울
                      </div>
                    </div>
                    <h3 class="card-title">
                      <div
                        style="
                          text-align: start;
                          overflow: hidden;
                          text-overflow: ellipsis;
                          -webkit-box-orient: vertical;
                          display: -webkit-box;
                          -webkit-line-clamp: 2;
                          line-height: inherit;
                        "
                      >
                        [랜선투어:현지 Live] 권승완+성예은 가이드의 스페인 바르셀로나
                      </div>
                    </h3>
                    <div class="card-info">
                      <div class="price">
                        <span class="origin">
                          35,000
                          <span style="font-size: 11px">원</span>
                        </span>
                        <span class="sale">
                          24,900
                          <span style="font-size: 13px">원</span>
                        </span>
                        <span class="standard">/ 1인</span>
                      </div>
                    </div>
                  </div>
                  <div class="trip-card-footer">
                    <div class="likes">
                      <i class="fas fa-heart"></i>
                      <span>200</span>
                    </div>
                  </div>
                </a>

                <a class="trip-card">
                  <div class="trip-card-thumbnail">
                    <div class="thumbnail-wrapper">
                      <div class="thumbnail">
                        <img
                          alt=""
                          src="https://d2ur7st6jjikze.cloudfront.net/offer_photos/101129/549311_medium_1608545579.jpg?1608545579"
                        />
                      </div>
                    </div>
                  </div>
                  <div class="trip-card-body">
                    <div class="categorys">
                      <div
                        style="
                          text-align: start;
                          overflow: hidden;
                          text-overflow: ellipsis;
                          -webkit-box-orient: vertical;
                          display: -webkit-box;
                          -webkit-line-clamp: 1;
                          line-height: normal;
                        "
                      >
                        가이드 투어 ・ 서울
                      </div>
                    </div>
                    <h3 class="card-title">
                      <div
                        style="
                          text-align: start;
                          overflow: hidden;
                          text-overflow: ellipsis;
                          -webkit-box-orient: vertical;
                          display: -webkit-box;
                          -webkit-line-clamp: 2;
                          line-height: inherit;
                        "
                      >
                        [랜선투어:현지 Live] 장재영+고은경 가이드의 Across 이스탄불(2/9 오후 9시)
                      </div>
                    </h3>
                    <div class="card-info">
                      <div class="price">
                        <span class="origin">
                          35,000
                          <span style="font-size: 11px">원</span>
                        </span>
                        <span class="sale">
                          24,900
                          <span style="font-size: 13px">원</span>
                        </span>
                        <span class="standard">/ 1인</span>
                      </div>
                    </div>
                  </div>
                  <div class="trip-card-footer">
                    <div class="likes">
                      <i class="fas fa-heart"></i>
                      <span>200</span>
                    </div>
                  </div>
                </a>

                <a class="trip-card">
                  <div class="trip-card-thumbnail">
                    <div class="thumbnail-wrapper">
                      <div class="thumbnail">
                        <img
                          alt=""
                          src="https://d2ur7st6jjikze.cloudfront.net/offer_photos/102412/553355_medium_1611821830.jpg?1611821830"
                        />
                      </div>
                    </div>
                  </div>
                  <div class="trip-card-body">
                    <div class="categorys">
                      <div
                        style="
                          text-align: start;
                          overflow: hidden;
                          text-overflow: ellipsis;
                          -webkit-box-orient: vertical;
                          display: -webkit-box;
                          -webkit-line-clamp: 1;
                          line-height: normal;
                        "
                      >
                        가이드 투어 ・ 서울
                      </div>
                    </div>
                    <h3 class="card-title">
                      <div
                        style="
                          text-align: start;
                          overflow: hidden;
                          text-overflow: ellipsis;
                          -webkit-box-orient: vertical;
                          display: -webkit-box;
                          -webkit-line-clamp: 2;
                          line-height: inherit;
                        "
                      >
                        [랜선투어] 정보경 셰프의 나폴리 미식 여행(2/18, 2/25 저녁7시)
                      </div>
                    </h3>
                    <div class="card-info">
                      <div class="price">
                        <span class="origin">
                          35,000
                          <span style="font-size: 11px">원</span>
                        </span>
                        <span class="sale">
                          24,900
                          <span style="font-size: 13px">원</span>
                        </span>
                        <span class="standard">/ 1인</span>
                      </div>
                    </div>
                  </div>
                  <div class="trip-card-footer">
                    <div class="likes">
                      <i class="fas fa-heart"></i>
                      <span>200</span>
                    </div>
                  </div>
                </a>

                <a class="trip-card">
                  <div class="trip-card-thumbnail">
                    <div class="thumbnail-wrapper">
                      <div class="thumbnail">
                        <img
                          alt=""
                          src="https://d2ur7st6jjikze.cloudfront.net/offer_photos/101684/551210_medium_1609922010.jpg?1609922010"
                        />
                      </div>
                    </div>
                  </div>
                  <div class="trip-card-body">
                    <div class="categorys">
                      <div
                        style="
                          text-align: start;
                          overflow: hidden;
                          text-overflow: ellipsis;
                          -webkit-box-orient: vertical;
                          display: -webkit-box;
                          -webkit-line-clamp: 1;
                          line-height: normal;
                        "
                      >
                        가이드 투어 ・ 서울
                      </div>
                    </div>
                    <h3 class="card-title">
                      <div style=" text-align: start; overflow: hidden; text-overflow: ellipsis; -webkit-box-orient: vertical; display: -webkit-box; -webkit-line-clamp: 2; ine-height: inherit;">
                        [랜선투어:현지 Live] 맥스 가이드의 마카오 인사이드 (2/13 오후 6시)
                      </div>
                    </h3>
                    <div class="card-info">
                      <div class="price">
                        <span class="origin">
                          35,000
                          <span style="font-size: 11px">원</span>
                        </span>
                        <span class="sale">
                          24,900
                          <span style="font-size: 13px">원</span>
                        </span>
                        <span class="standard">/ 1인</span>
                      </div>
                    </div>
                  </div>
                  <div class="trip-card-footer">
                    <div class="likes">
                      <i class="fas fa-heart"></i>
                      <span>200</span>
                    </div>
                  </div>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <!-- main --> 
     
<u:footer/>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
      var swiper = new Swiper('.swiper-container', {
        spaceBetween: 20,
        slidesPerView: 4,
        slidesPerGroup: 4,
        loopFillGroupWithBlank: true,
        loop: true,
        pagination: {
          el: '.swiper-pagination',
          clickable: true,
        },
        // Navigation arrows
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        },
      });
      
      var swiper = new Swiper('.newSwiper-container', {
          spaceBetween: 20,
          centeredSides: true,
          autoplay: {
            delay: 2500,
            disableOnInteraction: false,
          },
          slidesPerView: 1,
          slidesPerGroup: 1,
          loopFillGroupWithBlank: true,
          loop: true,
          //pagenation
          pagination: {
            el: '.swiper-pagination',
            clickable: true,
          },
          //Navigation arrows
          navigation: {
            nextEl: '.swiper-button-next',
            preEl: '.swiper-button-prev',
          },
        });
    </script>
</body>
</html>
