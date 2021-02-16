<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="${root }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${root }/resources/assets/css/style.css">
<link rel="stylesheet" href="${root }/resources/assets/css/search.css">
<link rel="stylesheet" href="${root }/resources/assets/css/common.css">
<title>my fake trip</title>
</head>
<body>
<u:navbar/>
<div class="component">
      <div class="grid-container1">
        <div class="grid-container2">
          <div class="grid-container3">
            <h1 class="search-title">검색결과</h1>
          </div>
          <div class="contents">
            <aside class="filterBar">
              <h2 class="filter-title">카테고리</h2>
              <div class="filter-content">
                <button class="filter-btn1">
                  <img
                    class="filter-icon"
                    src="https://dffoxz5he03rp.cloudfront.net/icons/ic_category_all_md_colored.svg"
                    alt="아이콘"
                  />
                  전체
                </button>
                <button class="filter-btn2">
                  <img
                    class="filter-icon"
                    src="https://dffoxz5he03rp.cloudfront.net/icons/ic_category_guide_tour_md_colored.svg"
                    alt="아이콘"
                  />
                  가이드 투어
                </button>
                <button class="filter-btn2">
                  <img
                    class="filter-icon"
                    src="https://dffoxz5he03rp.cloudfront.net/icons/ic_category_ticket_md_colored.svg"
                    alt="아이콘"
                  />
                  티켓/패스
                </button>
                <button class="filter-btn2">
                  <img
                    class="filter-icon"
                    src="https://dffoxz5he03rp.cloudfront.net/icons/ic_category_activity_md_colored.svg"
                    alt="비티"
                  />
                  액티비티
                </button>
                <button class="filter-btn2">
                  <img
                    class="filter-icon"
                    src="https://dffoxz5he03rp.cloudfront.net/icons/ic_category_utility_md_colored.svg"
                    alt="아이콘"
                  />
                  여행편의
                </button>
                <button class="filter-btn2">
                  <img
                    class="filter-icon"
                    src="https://dffoxz5he03rp.cloudfront.net/icons/ic_category_snap_md_colored.svg"
                    alt="아이콘"
                  />
                  스냅촬영
                </button>
                <button class="filter-btn2">
                  <img
                    class="filter-icon"
                    src="https://dffoxz5he03rp.cloudfront.net/icons/ic_category_entertainment_sm_colored.svg"
                    alt="아이콘"
                  />
                  즐길거리
                </button>
                <button class="filter-btn2">
                  <img
                    class="filter-icon"
                    src="https://dffoxz5he03rp.cloudfront.net/icons/ic_category_restaurant_md_colored.svg"
                    alt="아이콘"
                  />
                  레스토랑
                </button>
              </div>
            </aside>
            <main class="main-list">
              <div class="main-header">
                <span class="main-count">총 1,234개</span>
                <ul class="main-ul">
                  <li class="main-li">
                    <span>추천순</span>
                  </li>
                  <li class="main-li">
                    <span>판매량순</span>
                  </li>
                  <li class="main-li">
                    <span>낮은가격순</span>
                  </li>
                  <li class="main-li">
                    <span>높은가격순</span>
                  </li>
                  <li class="main-li">
                    <span>평점 높은 순</span>
                  </li>
                  <li class="main-li">
                    <span>신상품순</span>
                  </li>
                </ul>
              </div>
              <div>
                <div>
                  <div>
                    <div>
                      <div class="trip-card-wrapper">
                        <a class="trip-card">
                          <div class="trip-card-thumbnail">
                            <div class="thumbnail-wrapper">
                              <div class="thumbnail">
                                <img
                                  alt=""
                                  data-src="https://d2ur7st6jjikze.cloudfront.net/offer_photos/82720/541777_medium_1602579597.jpg?1602579597"
                                  src="https://d2ur7st6jjikze.cloudfront.net/offer_photos/82720/541777_medium_1602579597.jpg?1602579597"
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
                                [입장티켓포함] 신기환 가이드의 덕수궁 야경투어
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
          </div>
        </div>
      </div>
    </div>
    <u:footer/>
</body>
</html>