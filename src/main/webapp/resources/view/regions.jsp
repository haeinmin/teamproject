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
<link rel="stylesheet" href="${root }/resources/assets/css/regions.css">
<title>fake my trim</title>
</head>
<body>
<u:navbar/>
<main class="region-container">
        <div class="destination-header">
            <div class="region-header">
                <div class="bg-img"
                    style="background-image: url('https://d2yoing0loi5gh.cloudfront.net/assets/kitty/destination/cover-e6f2ea210d9e1bd24ae142d1d1b27f697e5db25177e0817184edbae77f8398ef.jpg')">
                </div>
                <div class="dark-cover"></div>
                <div class="region-content">
                    <div class="region-text">전체 여행지</div>
                </div>
            </div>
        </div>
        <div class="destination-container">
            <div class="content-center">
                <div class="region-name">유럽</div>
                <ul class="region-list clearfix">
                    <li class="region-container" data-region-index="0">
                        <div class="subregion-name">서유럽</div>
                        <ul class="region-inner-container">
                            <li class="gtm-region-country">
                                <div class="inner-item">영국</div>
                            </li>
                            <li class="gtm-region-country">
                                <div class="inner-item">프랑스</div>
                            </li>
                        </ul>
                    </li>
                    <li class="region-container" data-region-index="1">
                        <div class="subregion-name">남유럽/ 지중해 / 터키</div>
                        <ul class="region-inner-container">
                            <li class="gtm-region-country">
                                <div class="inner-item">스페인</div>
                                <div class="popular-label">인기</div>
                            </li>
                        </ul>
                    </li>
                </ul>
                <div class="region-name">아시아</div>
                <ul class="region-list clearfix">
                    <li class="region-container" data-region-index="0">
                        <div class="subregion-name">국내</div>
                        <ul class="region-inner-container">
                            <li class="gtm-region-country">
                                <div class="inner-item">대한민국</div>
                                <div class="popular-label">인기</div>
                            </li>
                        </ul>
                    </li>
                    <li class="region-container" data-region-index="1">
                        <div class="subregion-name">동남아</div>
                        <ul class="region-inner-container">
                            <li class="gtm-region-country">
                                <div class="inner-item">베트남</div>
                            </li>
                            <li class="gtm-region-country">
                                <div class="inner-item">태국</div>
                            </li>
                        </ul>
                    </li>
                </ul>
                <div class="region-name">아메리카</div>
                <ul class="region-list clearfix">
                    <li class="region-container" data-region-index="0">
                        <div class="subregion-name">미국 / 캐나다</div>
                        <ul class="region-inner-container">
                            <li class="gtm-region-country">
                                <div class="inner-item">미국</div>
                                <div class="popular-label">인기</div>
                            </li>
                        </ul>
                    </li>
            </div>
        </div>
    </main>
<u:footer/>
</body>
</html>