<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>롯데시네마 서브 캐러셀</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style>
	body {
      margin: 0;
      padding: 0;
      font-family: "Segoe UI", sans-serif;
      background-color: #111;
      color: #fff;
      display: flex;
      flex-direction: column;
      align-items: center;
      min-height: 100vh;
      justify-content: center;
    }

    .sub-carousel-container {
      width: 1000px;
      margin: 0 auto;
      position: relative;
      overflow: hidden;
      background-color: #222;
      padding: 20px 0;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
    }

    .sub-carousel-inner {
      display: flex;
    }

    .sub-item-container {
      flex-shrink: 0;
      width: 200px;
      margin: 0 10px;
      text-align: center;
      padding: 15px;
      background-color: #333;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: flex-start;
    }

    .sub-item-container img {
      width: 100%;
      height: 300px;
      object-fit: cover;
      border-radius: 5px;
      margin-bottom: 10px;
    }

    .sub-item-container a {
      color: #eee;
      font-size: 15px;
      text-decoration: none;
      line-height: 1.0;
    }
    .sub-item-container a:last-of-type {
        font-size: 14px;
        color: #ffc107;
    }

    .sub-carousel-control {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      background: rgba(0, 0, 0, 0.6);
      border: none;
      border-radius: 50%;
      width: 45px;
      height: 45px;
      cursor: pointer;
      z-index: 10;
      display: flex;
      justify-content: center;
      align-items: center;
      transition: background 0.3s ease;
    }

    .sub-carousel-control:hover {
      background: rgba(0, 0, 0, 0.9);
    }

    .sub-carousel-control img.arrow-icon {
      width: 20px;
      height: 20px;
    }

    .sub-carousel-control.prev {
      left: 0px;
    }

    .sub-carousel-control.next {
      right: 0px;
    }
</style>
</head>
<body>
<jsp:include page="./template/header.jsp"></jsp:include>
  <h2 style="text-align:center;">롯데시네마 서브 캐러셀 작동 테스트</h2>

  <div class="sub-carousel-container" id="sub-carousel">
    <div class="sub-carousel-inner">

		<c:forEach var="movie" items="${list}" varStatus="status">
			<div class="sub-item-container">
				<img src="https://image.tmdb.org/t/p/w500/${movie.wposter}" alt="${movie.movieName}" />
				<a>${status.count} : ${movie.movieName}</a><br>
				<a>${movie.gradeNm}</a><br>
				<a>🔥 인기 지수: ${movie.popularity}</a>
			</div>
		</c:forEach>

    </div>

    <button class="sub-carousel-control prev">
    	<img src="${pageContext.request.contextPath}/images/left_arrow.png" alt="왼쪽 화살표" class="arrow-icon">
	</button>
    <button class="sub-carousel-control next">
    	<img src="${pageContext.request.contextPath}/images/right_arrow.png" alt="오른쪽 화살표" class="arrow-icon">
    </button>
  </div>
  
<script>
    window.onload = () => {
        const subCarouselInner = document.querySelector(".sub-carousel-inner");
        const subItems = document.querySelectorAll(".sub-item-container");
        const subPrevBtn = document.querySelector(".sub-carousel-control.prev");
        const subNextBtn = document.querySelector(".sub-carousel-control.next");
        const subCarouselContainer = document.querySelector(".sub-carousel-container");

        if (subItems.length === 0) {
            console.warn("No sub-carousel items found. Carousel will not operate.");
            if (subPrevBtn) subPrevBtn.style.display = 'none';
            if (subNextBtn) subNextBtn.style.display = 'none';
            return;
        }
        
        const animationOptions = {
            duration : 500,
            fill : 'forwards',
            iterations : 1,
            easing : 'ease-in-out'
        };

        const itemsPerView = 4;
        const itemsToScroll = 1;

        let isAnimating = false;

        const firstItem = subItems?.[0];
        let itemTotalWidth = 0;
        if (firstItem) {
            const itemComputedStyle = getComputedStyle(firstItem);
            itemTotalWidth = firstItem.offsetWidth + 
                               parseFloat(itemComputedStyle.marginLeft) + 
                               parseFloat(itemComputedStyle.marginRight);
        }

        subCarouselInner.style.width = `${itemTotalWidth * subItems.length}px`;
        subCarouselInner.style.marginLeft = `0px`;

        if(subPrevBtn) {
            subPrevBtn.addEventListener('click', () => {
                if (isAnimating) return;
                isAnimating = true;
                for (let i = 0; i < itemsToScroll; i++) {
                    subCarouselInner.prepend(subCarouselInner.lastElementChild);
                }
                subCarouselInner.style.marginLeft = `-${itemTotalWidth * itemsToScroll}px`;
                subCarouselInner.animate({marginLeft : `0px`}, animationOptions).onfinish = () => {
                    subCarouselInner.style.marginLeft = '0px'; 
                    isAnimating = false;
                };
            });
        }

        if(subNextBtn) {
            subNextBtn.addEventListener('click', () => {
                if (isAnimating) return;
                isAnimating = true;
                subCarouselInner.animate({marginLeft : `-${itemTotalWidth * itemsToScroll}px`}, animationOptions).onfinish = () => {
                    for (let i = 0; i < itemsToScroll; i++) {
                        subCarouselInner.appendChild(subCarouselInner.firstElementChild);
                    }
                    subCarouselInner.style.marginLeft = '0px';
                    isAnimating = false;
                };
            });
        }
    };
</script>
</body>
</html>