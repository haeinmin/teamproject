<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet" href="${root }/resources/assets/css/airline.css">
<title>fake my trim</title>
</head>
<body>
<u:navbar/>
    <!-- ticket page -->
    <!-- search -->
    <div class="ticket_search_container">
      <div class="airline-ticket-search-container">
        <div class="title">
          <span>왕복</span>
        </div>
        <div class="ticket-search-container">
          <div class="travel">
            <div class="departure">
              <span></span>
            </div>
            <div class="change">
              <button type="button">
                <i class="fas fa-exchange-alt"></i>
              </button>
            </div>
            <div class="arrival">
              <span></span>
            </div>
          </div>
          <div class="date-container">
            <i class="far fa-calendar"></i>
            <input type="text" name="dates" class="form-control" />
          </div>
          <div class="passenger">
            <i class="far fa-user"></i>
            <span> 승객 1명, 전체</span>
            <i class="fas fa-angle-down"></i>
          </div>
          <button class="search-button">
            <span>검색</span>
          </button>
        </div>
      </div>
    </div>
    <!-- search -->
    <div class="ticket_list_container">
      <div class="ticket_list_information">
        <!-- aside -->
        <div class="ariline-ticket-aside-container">
          <div class="aside-content">
            <h3 class="title">
              <span>항공사</span>
              <i class="fas fa-angle-up"></i>
            </h3>
            <div class="list">
              <!-- select -->
              <ul class="mrt_select_all">
                <li>
                  <button type="button" title="모두선택" class="active">모두 선택</button>
                </li>
                <li>
                  <button type="button" title="모두해제">모두 해제</button>
                </li>
              </ul>
              <!-- select -->
              <ul id="checkAirList">
                <li>
                  <div class="mrt_check_wrap">
                    <input type="checkbox" id="airCd0" name="airCd0" class="k1_input_check" value=".aircdKE" /><label
                      for="airCd0"
                      ><span class="ico_checkbox"></span>대한항공</label
                    >
                  </div>
                </li>
                <li>
                  <div class="mrt_check_wrap">
                    <input type="checkbox" id="airCd75" name="airCd75" class="k1_input_check" value=".aircdOZ" /><label
                      for="airCd75"
                      ><span class="ico_checkbox"></span>아시아나항공</label
                    >
                  </div>
                </li>
                <li>
                  <div class="mrt_check_wrap">
                    <input
                      type="checkbox"
                      id="airCd124"
                      name="airCd124"
                      class="k1_input_check"
                      value=".aircdLJ"
                    /><label for="airCd124"><span class="ico_checkbox"></span>진에어</label>
                  </div>
                </li>
                <li>
                  <div class="mrt_check_wrap">
                    <input
                      type="checkbox"
                      id="airCd151"
                      name="airCd151"
                      class="k1_input_check"
                      value=".aircdBX"
                    /><label for="airCd151"><span class="ico_checkbox"></span>에어부산</label>
                  </div>
                </li>
                <li>
                  <div class="mrt_check_wrap">
                    <input
                      type="checkbox"
                      id="airCd163"
                      name="airCd163"
                      class="k1_input_check"
                      value=".aircdTW"
                    /><label for="airCd163"><span class="ico_checkbox"></span>티웨이항공</label>
                  </div>
                </li>
                <li>
                  <div class="mrt_check_wrap">
                    <input
                      type="checkbox"
                      id="airCd195"
                      name="airCd195"
                      class="k1_input_check"
                      value=".aircd7C"
                    /><label for="airCd195"><span class="ico_checkbox"></span>제주항공</label>
                  </div>
                </li>
                <li>
                  <div class="mrt_check_wrap">
                    <input
                      type="checkbox"
                      id="airCd236"
                      name="airCd236"
                      class="k1_input_check"
                      value=".aircdRS"
                    /><label for="airCd236"><span class="ico_checkbox"></span>에어서울</label>
                  </div>
                </li>
              </ul>
              <!-- select -->
            </div>
          </div>
          <div class="aside-content">
            <h3 class="title">
              <span>출발시간</span>
              <i class="fas fa-angle-up"></i>
            </h3>
            <div class="list">
              <ul>
                <li>
                  <div class="mrt_check_wrap">
                    <input type="checkbox" class="k1_input_check" value=".aircdKE" /><label for="airCd0"
                      ><span class="ico_checkbox"></span>새벽 00:00~06:00</label
                    >
                  </div>
                </li>
                <li>
                  <div class="mrt_check_wrap">
                    <input type="checkbox" class="k1_input_check" value=".aircdOZ" /><label for="airCd75"
                      ><span class="ico_checkbox"></span>오전 06:00~12:00</label
                    >
                  </div>
                </li>
                <li>
                  <div class="mrt_check_wrap">
                    <input type="checkbox" class="k1_input_check" value=".aircdLJ" /><label for="airCd124"
                      ><span class="ico_checkbox"></span>오후 12:00~18:00</label
                    >
                  </div>
                </li>
                <li>
                  <div class="mrt_check_wrap">
                    <input type="checkbox" class="k1_input_check" value=".aircdLJ" /><label for="airCd124"
                      ><span class="ico_checkbox"></span>야간 18:00~24:00</label
                    >
                  </div>
                </li>
              </ul>
              <!-- select -->
            </div>
          </div>
          <div class="aside-content">
            <h3 class="title">
              <span>좌석종류</span>
              <i class="fas fa-angle-up"></i>
            </h3>
            <div class="list">
              <ul>
                <li>
                  <div class="mrt_check_wrap">
                    <input type="checkbox" class="k1_input_check" value=".aircdKE" /><label for="airCd0"
                      ><span class="ico_checkbox"></span>비즈니스석</label
                    >
                  </div>
                </li>
                <li>
                  <div class="mrt_check_wrap">
                    <input type="checkbox" class="k1_input_check" value=".aircdOZ" /><label for="airCd75"
                      ><span class="ico_checkbox"></span>특가석</label
                    >
                  </div>
                </li>
                <li>
                  <div class="mrt_check_wrap">
                    <input type="checkbox" class="k1_input_check" value=".aircdLJ" /><label for="airCd124"
                      ><span class="ico_checkbox"></span>할인석</label
                    >
                  </div>
                </li>
                <li>
                  <div class="mrt_check_wrap">
                    <input type="checkbox" class="k1_input_check" value=".aircdLJ" /><label for="airCd124"
                      ><span class="ico_checkbox"></span>일반석</label
                    >
                  </div>
                </li>
              </ul>
              <!-- select -->
            </div>
          </div>
          <div class="aside-content">
            <h3 class="title">
              <span>가격대</span>
              <i class="fas fa-angle-up"></i>
            </h3>
            <div class="list">
              <label for="customRange1" class="form-label" style="font-size: 17px">182,100원 미만</label>
              <input type="range" class="form-range" id="customRange1" style="width: 100%" />
            </div>
          </div>
        </div>
        <!-- aside -->
        <div class="airline-ticket-main-container">
          <!-- search result N select filter -->
          <div class="header-result-filter-container">
            <div class="result-information">
              <h3>비행기 협찬 받습니다.</h3>
              <!-- <p>성인 1인 기준 편도 요금입니다. (세금 및 수수료 포함)</p> -->
            </div>
            <!-- <div class="result-filter">
              <select class="form-control">
                <option value="1">가격 낮은 순</option>
                <option value="2">가격 높은 순</option>
                <option value="3">출발 시간 빠른 순</option>
              </select>
            </div> -->
          </div>
          <!-- search result N select filter -->
          <div>
            <!-- result line -->
            <div class="sorted-informaton-container">
              <div class="information-container">
                <!-- <span class="tag-area sorted-margin">가는편</span> -->
                <div class="departure-and-arrival sorted-margin">
                  <strong>저희 회사는 돈이 없어 비행기 협찬 받습니다.</strong>
                 <!--  <i class="fas fa-long-arrow-alt-right"></i> -->
                  <strong></strong>
                </div>
                <span class="airline-date"></span>
              </div>
            </div>
            <!-- result line -->
            
          <!--   <div class="result-element-container">
              <div class="ticket-flex-item">
                <div class="airline-ticket-left-info">
                  <img src="https://flights.myrealtrip.com/air/wfw/imgs/mbl/logo/air/LJ.png" alt="logo" />
                  <div class="airline">
                    <em>진에어</em>
                    <em class="num">LJ321</em>
                  </div>
                </div>
                <div class="airline-ticket-timeline-center-info">
                  <div class="departure">
                    <span>18:15</span>
                    <span>GMP</span>
                  </div>
                  <div class="time">
                    <i class="fas fa-long-arrow-alt-right"></i>
                    <span>1시간 15분</span>
                  </div>
                  <div class="arrival">
                    <span>19:30</span>
                    <span>CJU</span>
                  </div>
                </div>
                <div class="airline-ticket-seat">
                  <span class="seat-class">특가석</span>
                  <span class="seat-num">9석</span>
                </div>
                <div class="airline-ticket-price">
                  <span class="total">23,000원</span>
                </div>
                <button type="button">선택</button>
              </div>
            </div> -->
          </div>
        </div>
      </div>
    </div>
    <u:footer/>
    <!-- ticket page -->
    <script type="text/javascript">
      $('input[name="dates"]').daterangepicker();
    </script>

</body>
</html>