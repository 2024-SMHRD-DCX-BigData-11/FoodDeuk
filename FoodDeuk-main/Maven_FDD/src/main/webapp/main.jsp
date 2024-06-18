<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>푸드득</title>
<script type="text/javascript"
	src="http://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=0x06a17qwi"></script>
<link rel="stylesheet" href="assetsBoard/css/main.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
body {
  font-family: 'Nanum Gothic', sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f5f5f5;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<header class="p-3 mb-3 border-bottom">
		<div
			class="container d-flex flex-wrap justify-content-between align-items-center">
			<h1 class="mb-0">푸드득</h1>
			<form class="search-box" action="search" method="get">
				<select id="search-type" name="searchType">
					<option value="menu">메뉴 검색</option>
					<option value="category">카테고리 검색</option>
				</select> <input id="search-txt" class="search-txt" type="text" name="query"
					placeholder="검색어를 입력하세요"> <input id="upperSearch-txt"
					class="upperSearch-txt" type="text" name="query"
					placeholder="상한가 지정">
				<button id="search-btn" type="button"><img
					src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" width = 20px height=auto></button>
			</form>
			<%
			Member login_member = (Member) session.getAttribute("login_member");
			%>
			<nav class="nav">
				<a class="nav-link" href="ReviewMain.jsp">게시판</a>
				<%
				if (login_member == null) {
				%>
				<a class="nav-link" href="Login.jsp">로그인</a> <a class="nav-link"
					href="Join.jsp">회원가입</a>
				<%
				} else {
				%>
				<a class="nav-link" href="UpdateMember.jsp">개인정보수정</a> <a
					class="nav-link" href="LogoutCon">로그아웃</a>
				<%
				}
				%>
			</nav>
		</div>
	</header>
	<div class="container">
		<div class="map-container">
			<div class="recommendation-container">
				<div id="flip_menu"></div>
				<button id="recommendation-button" class="recommendation-button">음식추천</button>
				<button class="low-price-button">최저가</button>
			</div>
			<div id="map"></div>
		</div>
		<div class="banner-container" id="banner-container"></div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	var latitude = -1, longitude = -1;
	navigator.geolocation.getCurrentPosition((position) => {
		console.log(position);
		console.log(position.coords.latitude);
		console.log(position.coords.longitude);
		latitude = position.coords.latitude;
		longitude = position.coords.longitude;
	});
    var mapOptions = {
      center: new naver.maps.LatLng(34.9683954, 127.4841841),
      zoom: 17
    };
  	var map = new naver.maps.Map('map', mapOptions);

    var markers = []
    
    $('#search-btn').click(() => {
		$.ajax({
			// 요청경로
			url: 'SearchCon',
			data: {
				search: $('#search-txt').val(),
				upperSearch: $('#upperSearch-txt').val(),
				searchType: $('#search-type').val(),
				lat: latitude,
				lng: longitude
			},
			type: 'GET',
			success: function (data) {
				console.log(data);
				markers.forEach(marker => {
					marker.setMap(null);
				})
				const bannerContainer = document.getElementById('banner-container');
				bannerContainer.innerHTML = ''; // 기존 배너 초기화

				data.slice(0, 10).forEach(value => {
					var marker = new naver.maps.Marker({
						position: new naver.maps.LatLng(value.lat, value.lng),
						map: map
					});
					markers.push(marker);

					const bannerDiv = document.createElement('div');
					bannerDiv.classList.add('banner');
					let temp = '';

					temp += `<div class='banner-container-side'><div style="width: 150px;"><img src="${value.res_image}" alt="Banner"></div>`;
					temp += `<div><h3>${value.res_name}</h3></div></div>`;
					
					const menus = Object.values(value.menus);
					menus.slice(0, 3).forEach(value_ => {
						temp += `<div class="product-container"><div><p>${value_.menu_name}</p></div>`;
						temp += `<div><p>${value_.menu_price}원</p></div></div>`;
					});
					
					bannerDiv.innerHTML = temp;

					// 메뉴 더보기 버튼 추가
					const moreButton = document.createElement('button');
					moreButton.textContent = '더보기';
					moreButton.classList.add('more-button');
					moreButton.addEventListener('click', () => {
						if (bannerDiv.classList.contains('expanded')) {
							bannerDiv.classList.remove('expanded');
							moreButton.textContent = '더보기';
							bannerDiv.querySelectorAll('.product-container').forEach((el, index) => {
								if (index >= 3) el.remove();
							});
						} else {
							bannerDiv.classList.add('expanded');
							moreButton.textContent = '접기';
							menus.slice(3).forEach(value_ => {
								const productContainer = document.createElement('div');
								productContainer.classList.add('product-container');
								productContainer.innerHTML = `<div><p>${value_.menu_name}</p></div><div><p>${value_.menu_price}원</p></div>`;
								bannerDiv.insertBefore(productContainer, moreButton);
							});
						}
					});
					bannerDiv.appendChild(moreButton);

					// 리뷰 작성 버튼 추가
					const reviewButton = document.createElement('button');
					reviewButton.textContent = '리뷰작성';
					reviewButton.classList.add('review-button');
					reviewButton.addEventListener('click', () => {
						window.location.href = `ReviewWrite.jsp?res_no=${value.res_no}`;
						window.location.href = `ReviewWrite.jsp?res_name=${value.res_name}`;
					});
					bannerDiv.appendChild(reviewButton);
					// 리뷰 보기 버튼 추가
					const reviewMainButton = document.createElement('button');
					reviewMainButton.textContent = '리뷰보기';
					reviewMainButton.classList.add('review-main-button');
					reviewMainButton.addEventListener('click', () => {
						window.location.href = `ReviewMain.jsp?res_no=${value.res_no}`;
					});
					bannerDiv.appendChild(reviewMainButton);

					bannerContainer.appendChild(bannerDiv);
				})
			},
			error: function () {
				alert('error');
			}
		})
	});
	
	var flip_menu = document.getElementById('flip_menu');
    
    listCategory = [];
    
    function recommendMenu() {
	    $.ajax({
			// 요청경로
			url : 'CategoryCon',
			type : 'GET',
			success : function(data) {
				data.forEach(value => {
					listCategory.push(value);
				})
				flip_menu.innerText = listCategory.pop();
				flip_menu.classList.add('flip-horizontal-bottom');
			},
			error : function() {
				alert('error');
			}
		})
    }
    recommendMenu();
    $('#recommendation-button').click(() => {
    	flip_menu.classList.remove('flip-horizontal-bottom');
    	void flip_menu.offsetWidth; // 리플로우 트리거
    	recommendMenu();
    })
    
    flip_menu.addEventListener('animationiteration', () => {
    	flip_menu.innerText = listCategory.pop();
    })
 // 메뉴 부분 선택
  </script>
</body>
</html>
