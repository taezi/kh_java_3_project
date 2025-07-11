<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>롯데시네마 캐러셀 구현</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <style>
    /* 전체 캐러셀 컨테이너 */
    .carousel-container {
      width: 800px; /* 원하는 너비로 조절 */
      margin: 50px auto; /* 페이지 중앙 정렬 */
      position: relative; /* 버튼 및 인디케이터의 기준점 */
      overflow: hidden; /* 컨테이너를 벗어나는 이미지 숨김 */
    }

    /* 이미지들을 감싸고 실제 움직이는 영역 */
    .carousel-inner {
      display: flex;
      /* 자바스크립트에서 동적으로 width를 설정하므로, 여기서는 초기값만 설정합니다. */
      /* width: 400%; <--- 이 줄을 삭제합니다. */
      transition: transform 0.5s ease-in-out; /* 부드러운 슬라이드 효과 */
    }

    /* 개별 이미지 아이템 */
    .carousel-item {
      flex-shrink: 0; /* 아이템 너비가 줄어들지 않도록 함 */
      /* 자바스크립트에서 동적으로 flex-basis를 설정하므로, 여기서는 초기값만 설정합니다. */
      /* flex-basis: 25%; <--- 이 줄을 삭제합니다. */
      width: 100%; /* 부모 너비에 맞춤 (JS에서 flex-basis로 제어하므로 중요도는 낮음) */
      box-sizing: border-box;
    }

    .carousel-item img {
      width: 100%;
      display: block; /* 이미지 하단 여백 제거 */
      height: 450px; /* 이미지 높이 고정 */
      object-fit: cover; /* 이미지가 잘리더라도 비율을 유지하며 꽉 채움 */
    }

    /* 이전/다음 화살표 버튼 */
    .carousel-control {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      background-color: rgba(0, 0, 0, 0.4);
      color: white;
      border: none;
      padding: 15px;
      font-size: 24px;
      cursor: pointer;
      z-index: 10;
      border-radius: 50%;
      width: 50px;
      height: 50px;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .prev {
      left: 20px;
    }

    .next {
      right: 20px;
    }
    
    /* 하단 인디케이터(점) */
    .carousel-indicators {
        position: absolute;
        bottom: 20px;
        left: 50%;
        transform: translateX(-50%);
        z-index: 10;
        display: flex;
        gap: 10px; /* 점 사이의 간격 */
    }

    .indicator {
        width: 12px;
        height: 12px;
        border-radius: 50%;
        background-color: #ccc;
        border: none;
        cursor: pointer;
        padding: 0;
    }

    .indicator.active {
        background-color: #d81e05; /* 롯데시네마 활성 색상 */
    }
  </style>
</head>
<body>

  <jsp:include page="./template/header.jsp"></jsp:include>

  <h2>롯데시네마 캐러셀 예제</h2>

  <div class="carousel-container" id="myCarousel">
    <div class="carousel-inner">
      <div class="carousel-item">
        <img src="https://image.tmdb.org/t/p/w1280/x58Gk2ZGU5AEBp25MQe2nhZhd5z.jpg" alt="하이재킹" />
      </div>
      <div class="carousel-item">
        <img src="https://image.tmdb.org/t/p/w1280/sItIskd5xpiE64bBWYwZintkGf3.jpg" alt="인사이드아웃2" />
      </div>
      <div class="carousel-item">
        <img src="https://image.tmdb.org/t/p/w1280/nKyBbFSooRPTJVqjrDteD1lF733.jpg" alt="핸섬가이즈" />
      </div>
       <div class="carousel-item">
        <img src="https://image.tmdb.org/t/p/w1280/yAqL0makiGke5yYiVWpmBDSKIVP.jpg" alt="리추얼" /> </div>
    </div>

    <button class="carousel-control prev">&lt;</button>
    <button class="carousel-control next">&gt;</button>

    <div class="carousel-indicators"></div>
  </div>
  <div>
  <img src="https://image.tmdb.org/t/p/w1280/yAqL0makiGke5yYiVWpmBDSKIVP.jpg" alt="리추얼"  name="ex1">
  </div>
<script>
document.addEventListener('DOMContentLoaded', function () {
  const carousel = document.getElementById('myCarousel');
  const inner = carousel.querySelector('.carousel-inner');
  const items = carousel.querySelectorAll('.carousel-item');
  const prevBtn = carousel.querySelector('.prev');
  const nextBtn = carousel.querySelector('.next');
  const indicatorsContainer = carousel.querySelector('.carousel-indicators');

  const totalItems = items.length;
  let currentIndex = 0;
  let autoSlideInterval;

  // 1. 초기 설정: CSS 동적 생성
  // 아이템 개수에 맞춰 inner와 item의 너비를 설정합니다.
  // 이렇게 하면 아이템 개수가 바뀌어도 CSS를 수정할 필요가 없습니다.
  inner.style.width = `${totalItems * 100}%`;
  items.forEach(item => {
    item.style.flexBasis = `${100 / totalItems}%`;
  });

  // 2. 인디케이터(점) 생성
  for (let i = 0; i < totalItems; i++) {
    const button = document.createElement('button');
    button.classList.add('indicator');
    button.addEventListener('click', () => {
      goToSlide(i);
      resetAutoSlide(); // 인디케이터 클릭 시 자동 슬라이드 타이머 초기화
    });
    indicatorsContainer.appendChild(button);
  }
  const indicators = indicatorsContainer.querySelectorAll('.indicator');

  // 3. 슬라이드 이동 및 UI 업데이트 함수
  function goToSlide(index) {
    // 순환 로직: 마지막 슬라이드에서 다음으로 가면 첫 슬라이드로
    if (index < 0) {
      index = totalItems - 1;
    } else if (index >= totalItems) {
      index = 0;
    }

    // ⭐ 핵심 로직: 이동 거리 계산
    // 이동할 위치 = -(아이템 너비 % * 이동할 인덱스)
    const newTransform = `translateX(-${index * (100 / totalItems)}%)`;
    inner.style.transform = newTransform;

    // 현재 슬라이드의 인디케이터 활성화
    indicators[currentIndex].classList.remove('active');
    indicators[index].classList.add('active');
    
    // 현재 인덱스 업데이트
    currentIndex = index;
  }

  // 4. 이벤트 리스너 연결
  prevBtn.addEventListener('click', () => {
    goToSlide(currentIndex - 1);
    resetAutoSlide(); // 버튼 클릭 시 자동 슬라이드 타이머 초기화
  });

  nextBtn.addEventListener('click', () => {
    goToSlide(currentIndex + 1);
    resetAutoSlide();
  });
  
  // 5. 자동 슬라이드 기능
  function startAutoSlide() {
      autoSlideInterval = setInterval(() => {
          goToSlide(currentIndex + 1);
      }, 5000); // 5초마다 다음 슬라이드로 이동
  }

  function resetAutoSlide() {
      clearInterval(autoSlideInterval);
      startAutoSlide();
  }

  // 6. 초기화
  goToSlide(0); // 첫 번째 슬라이드부터 시작
  startAutoSlide(); // 페이지 로드 시 자동 슬라이드 시작
});
</script>

</body>
</html>