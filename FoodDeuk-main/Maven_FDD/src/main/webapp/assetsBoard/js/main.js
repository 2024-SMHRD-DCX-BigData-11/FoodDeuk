var user_marker = null;

const searchTypeSelect = document.getElementById('search-type');
const upperSearchTxt = document.getElementById('upperSearch-txt');

// 페이지가 로드될 때 초기 상태 설정
if (searchTypeSelect.value !== 'menu') {
	upperSearchTxt.classList.add('hidden');
}

// search-type 선택 요소에 change 이벤트 리스너 등록
searchTypeSelect.addEventListener('change', (event) => {
	if (event.target.value === 'menu') {
		upperSearchTxt.classList.remove('hidden');
	} else {
		upperSearchTxt.classList.add('hidden');
	}
});

var wishlist = new Set(); // 클릭된 마커를 저장할 Set 생성

let isWishlist = false;
let res_data = null;
const bannerContainer = document.getElementById('banner-container');

var clickListeners = [];

// 체크리스트 버튼 클릭 이벤트
$('#check-button').click(() => {
	isWishlist = !isWishlist;
	markers.forEach(marker => {
		marker.isCheck = false;
		marker.setIcon({
	    	content: '<div class="marker">' +
			'<div class="marker_icon_area' +
			(isWishlist ? ' test">' : '">') +
			'<img src="assetsBoard/image/restaurant.png" width="34" height="34" alt="음식점" class="icon">' +
			'</div>' +
			'<div class="marker_text_area">' +
			'<strong class="marker_title">' +
			marker.res_name +
			'</strong>' +
			'</div>' +
			'</div>'
	    });
	});
	if (isWishlist) { // 체크리스트 ON
		bannerContainer.innerHTML = ''; // 기존 배너 초기화
	    markers.forEach(marker => {
	    	clickListener = naver.maps.Event.addListener(marker, 'click', clickEvent);
	    	clickListeners.push(clickListener);
	    });
    } else { // 체크리스트  OFF
	    if (res_data != null) {
	    	wishlist.clear();
			bannerContainer.innerHTML = ''; // 기존 배너 초기화
		    clickListeners.forEach(clickListener => {
		    	naver.maps.Event.removeListener(clickListener);
		    });
	    	res_data.slice(0, 15).forEach(value => {
	    		test(value);
			});
		}
    }
});

var mapOptions = {
	center: new naver.maps.LatLng(34.9683954, 127.4841841),
	zoom: 15
};

var map = new naver.maps.Map('map', mapOptions);

var latitude = -1, longitude = -1;
navigator.geolocation.getCurrentPosition((position) => {
	console.log(position);
	console.log(position.coords.latitude);
	console.log(position.coords.longitude);
	latitude = position.coords.latitude;
	longitude = position.coords.longitude;
	user_marker = new naver.maps.Marker({
    	position: new naver.maps.LatLng(latitude, longitude),
    	map: map
	});
	map.setCenter(new naver.maps.LatLng(latitude, longitude));
}, null, {
	enableHighAccuracy: true,
	maximumAge: 30000,
	timeout: 27000
});

naver.maps.Event.addListener(map, 'click', function(e) {
    user_marker.setPosition(e.coord);
    latitude = user_marker.position._lat;
    longitude = user_marker.position._lng;
    console.log(user_marker);
});

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
			isWishlist = false;
			res_data = data;
			console.log(data);
			markers.forEach(marker => {
				marker.setMap(null);
			})
			bannerContainer.innerHTML = ''; // 기존 배너 초기화

			data.slice(0, 15).forEach(value => {
				var marker = new naver.maps.Marker({
					position: new naver.maps.LatLng(value.lat, value.lng),
					map: map,
					icon: {
						content: '<div class="marker">' +
							'<div class="marker_icon_area">' +
							'<img src="assetsBoard/image/restaurant.png" width="34" height="34" alt="음식점" class="icon">' +
							'</div>' +
							'<div class="marker_text_area">' +
							'<strong class="marker_title">' +
							value.res_name +
							'</strong>' +
							'</div>' +
							'</div>'
					}
				});
				marker.data = value;
				marker.res_name = value.res_name;
	        	marker.isCheck = false;
				markers.push(marker);

				test(value);
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
		url: 'CategoryCon',
		type: 'GET',
		success: function (data) {
			data.forEach(value => {
				listCategory.push(value);
			})
			flip_menu.innerText = listCategory.pop();
			flip_menu.classList.add('flip-horizontal-bottom');
		},
		error: function () {
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
// HTML에서 search-btn 버튼과 입력 필드 선택
const searchBtn = document.getElementById('search-btn');
const searchInput = document.querySelector('input[type="text"]');

// 입력 필드에서 keyup 이벤트 리스너 등록
searchInput.addEventListener('keyup', (event) => {
	// 엔터키(keyCode 13)가 눌렸을 때
	if (event.keyCode === 13) {
		// search-btn 버튼 클릭 트리거
		searchBtn.click();
	}
});
function clickEvent(e) {
	var marker = e.overlay;
	    if (wishlist.has(marker)) {
	    	wishlist.delete(marker);
	    } else {
	    	wishlist.add(marker);
	    }
		bannerContainer.innerHTML = ''; // 기존 배너 초기화
		wishlist.forEach(marker_ => {
			test(marker_.data);
		});
	    marker.isCheck = !marker.isCheck;
		marker.setIcon({
	    	content: '<div class="marker">' +
					'<div class="marker_icon_area' +
					(!marker.isCheck ? ' test">' : '">') +
					'<img src="assetsBoard/image/restaurant.png" width="34" height="34" alt="음식점" class="icon">' +
					'</div>' +
					'<div class="marker_text_area">' +
					'<strong class="marker_title">' +
					marker.res_name +
					'</strong>' +
					'</div>' +
					'</div>'
		});
}
function test(value) {
	const bannerDiv = document.createElement('div');
	bannerDiv.classList.add('banner');
	let temp = '';

	temp += `<div class='banner-container-side'>`;
	temp += `<div style="width: 100px;">`
	if (value.res_image != null) {
		temp += `<img src="${value.res_image}" alt="Banner">`
	}
	temp += `</div>`;
	temp += `<div id="res_name" width=500px><h3>${value.res_name}</h3></div></div>`;

	const menus = Object.values(value.menus);

	menus.slice(0, 3).forEach(value_ => {
		temp += `<div class="product-container"><div><p>${value_.menu_name}</p></div>`;
		temp += `<div><p>${value_.menu_price}원</p></div></div>`;
	});

	bannerDiv.innerHTML = temp;

	// 메뉴 더보기 버튼 추가
	// 메뉴가 3개 이상인 가게만 더보기 버튼 추가
	if (menus.length >= 3) {
		const moreButton = document.createElement('button');
		moreButton.textContent = '더보기';
		moreButton.classList.add('more-button');
		moreButton.addEventListener('click', () => {
			if (bannerDiv.classList.contains('expanded')) {
				bannerDiv.classList.remove('expanded');
				moreButton.textContent = '더보기';
				bannerDiv.querySelectorAll('.product-container').forEach((el, index) => {
					if (index >= 3) {
						el.remove();
					}
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
	}

	// 리뷰 작성 버튼 추가
	const reviewButton = document.createElement('button');
	reviewButton.textContent = '리뷰작성';
	reviewButton.classList.add('review-button');
	reviewButton.addEventListener('click', () => {
		window.location.href = `ReviewWrite.jsp?res_no=${value.res_no}&res_name=${value.res_name}`;
	});
	bannerDiv.appendChild(reviewButton);
	// 리뷰 보기 버튼 추가
	const reviewMainButton = document.createElement('button');
	reviewMainButton.textContent = '리뷰보기';
	reviewMainButton.classList.add('review-main-button');
	reviewMainButton.addEventListener('click', () => {
		window.location.href = `ReviewMain.jsp?res_no=${value.res_no}&res_name=${value.res_name}`;
	});
	bannerDiv.appendChild(reviewMainButton);

	bannerContainer.appendChild(bannerDiv);
}