<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box; 
		
	}
	.top-container{
	background-color:  black;
	}
	
	.container {
		width: 100%; 
		height: 2000px; 
		font-size: 0px;
		border: 1px solid black;
		display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: flex-start;
	}
	.left-container, .main-container, .right-container {
		box-sizing: border-box;
		height: 2000px; 
	}

	.left-container, .right-container {
		width: 20%;
		font-size: 40px;
		padding: 10px;
	}
/* 메인 캐러셀 start */
    .carousel-container {
      width: 1000px;
      margin: 0px auto;
      position: relative;
      overflow: hidden;
      background-color : black;
      box-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
    }

    .carousel-inner {
      display: flex;
      transition: margin-left 1s linear;
    }

    .carousel-item {
      flex-shrink: 0;
      width: 1000px;
    }

    .carousel-item img {
      width: 100%;
      height: 600px;
      object-fit: cover;
      display: block;
    }

    .carousel-control {
      position: absolute;
      top: 45%;
      transform: translateY(-50%);
      color: white;
      background: rgba(0,0,0,0.4);
      border: none;
      padding: 10px;
      cursor: pointer;
      z-index: 10;
    }

    .carousel-control.prev { left: 10px; }
    .carousel-control.next { right: 10px; }

    .carousel-indicators {
      display: flex;
      justify-content: center;
      margin-top: 15px;
      list-style: none;
      height : 30px;
    }

    .carousel-indicators li {
      width: 12px;
      height: 12px;
      border-radius: 50%;
      background: gray;
      margin: 0 5px;
      cursor: pointer;
      list-style: none;
    }

    .carousel-indicators .active {
      background: white;
    }
/* 메인 캐러셀 end  */

/* 서브 캐러셀 start */
	
    .sub-carousel-container {
      width: 1100px;
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

 
    .movie-image-link { 
        position: relative; 
        display: block;
        width: 100%; 
        height: 300px; 
        overflow: hidden; 
        border-radius: 5px; 
        margin-bottom: 10px; 
    }

    .movie-image-link img { 
      width: 100%;
      height: 100%; 
      object-fit: cover;
      display: block;
      transition: transform 0.3s ease; 
      border-radius: 5px; 
    }

    .movie-description-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.7); /* 어두운 반투명 배경 */
        color: white;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 15px;
        opacity: 0; 
        transition: opacity 0.3s ease; 
        text-align: center;
        font-size: 9px; 
        line-height: 1.5;
        overflow: hidden; 
    }

    .movie-description-overlay p {
        margin: 0;
        padding: 0;
    }

    .movie-description-overlay .click-info {
        font-size: 12px;
        margin-top: 10px;
        color: #ffc107; 
    }

    
    .movie-image-link:hover .movie-description-overlay {
        opacity: 1; 
    }

    .movie-image-link:hover img {
        transform: scale(1.05); 
    }


 

    .sub-item-container a {
      color: #eee;
      font-size: 15px;
      text-decoration: none;
      line-height: 1.4;
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
	
	
/* 서브 캐러셀 end */

	.main-container {
		width: 60%;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: flex-start;
		border: 1px solid black;
	}
	



.board {
    margin-top: 30px;
    width: 85%; /* 메인 컨테이너 너비의 85% */
    /* font-size: 20px; // 전체 board 영역의 기본 폰트 사이즈는 필요에 따라 조절하세요. */
    border: 1px solid #444; /* 테두리 색상 조정 */
    box-sizing: border-box;
    padding: 20px; /* 내부 여백 추가 */
    background-color: #333; /* 게시판 배경색 */
    color: #eee; /* 기본 글자색 */
    border-radius: 8px; /* 둥근 모서리 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* 그림자 효과 */
}

.board a {
    color: #ffc107; /* 링크 색상 */
    text-decoration: none; /* 밑줄 제거 */
    transition: color 0.3s ease;
}

.board a:hover {
    color: #ffd700; /* 호버 시 색상 변경 */
    text-decoration: underline; /* 호버 시 밑줄 추가 */
}

/* KH MVIE 이야기 + 링크 스타일 */
.board > a:first-of-type { /* 게시판 제목 아래 첫 번째 링크 */
    display: block; /* 블록 요소로 만들어 줄바꿈 */
    font-size: 24px; /* 제목 스타일 */
    font-weight: bold;
    margin-bottom: 15px; /* 아래 테이블과의 간격 */
    text-align: left; /* 왼쪽 정렬 */
    color: #ffc107; /* 메인 색상 */
}

/* 게시판 테이블 스타일 */
.board table {
    width: 100%; /* 부모 .board에 꽉 채우기 */
    border-collapse: collapse; /* 셀 경계선 병합 */
    margin-top: 20px; /* 상단 여백 */
    font-size: 16px; /* 테이블 내부 폰트 크기 */
    table-layout: fixed; /* 고정 너비 레이아웃 */
}

.board th, .board td {
    border: 1px solid #555; /* 셀 경계선 */
    padding: 12px; /* 셀 내부 여백 */
    text-align: center; /* 텍스트 중앙 정렬 */
    white-space: nowrap; /* 내용이 넘쳐도 줄바꿈 안 함 (필요시 조절) */
    overflow: hidden; /* 내용이 넘치면 숨김 */
    text-overflow: ellipsis; /* 내용이 넘치면 ... 표시 */
}

.board thead th {
    background-color: #444; /* 헤더 배경색 */
    color: #fff; /* 헤더 글자색 */
    font-weight: bold;
    padding: 15px 12px; /* 헤더 패딩 */
}

.board tbody tr:nth-child(even) { /* 짝수 행 배경색 */
    background-color: #3a3a3a;
}

.board tbody tr:hover { /* 행 호버 효과 */
    background-color: #4a4a4a;
    cursor: pointer;
}

/* 각 컬럼 너비 조정 (선택 사항, 필요시 주석 해제하여 사용) */
.board th:nth-child(1), .board td:nth-child(1) { width: 10%; } /* 번호 */
.board th:nth-child(2), .board td:nth-child(2) { width: 40%; text-align: left; padding-left: 20px; } /* 제목 - 왼쪽 정렬 */
.board th:nth-child(3), .board td:nth-child(3) { width: 15%; } /* 아이디 */
.board th:nth-child(4), .board td:nth-child(4) { width: 15%; } /* 작성일 */
.board th:nth-child(5), .board td:nth-child(5) { width: 10%; } /* 조회수 */
.board th:nth-child(6), .board td:nth-child(6) { width: 10%; } /* 좋아요 */

/* 테이블 내부 제목 링크 스타일 (BoardView.do) */
.board tbody td a {
    color: #eee; /* 제목 링크 색상 (테이블 기본 글자색과 유사하게) */
    font-weight: normal;
    text-decoration: none;
}

.board tbody td a:hover {
    color: #ffc107; /* 호버 시 강조 색상 */
    text-decoration: underline;
}



	
</style>

</head>


<body>
	<jsp:include page="./template/header.jsp"></jsp:include>
	<div class="top-container">
		<div class="carousel-container" id="main-carousel">
		  <div class="carousel-inner">
		    
	        <c:forEach var="movie" items="${list}" begin="0" end="3" >
		        <div class="carousel-item">
					<img src="https:/image.tmdb.org/t/p/w1280/${movie.hposter}" alt="${movie.movieName}" />
				</div>
			</c:forEach>
		 
		  </div>
	</div>
	  <button class="carousel-control prev">
	  	<img src="${pageContext.request.contextPath}/images/left_arrow.png" alt="왼쪽 화살표" class="arrow-icon">
	  </button>
	   <button class="carousel-control next">
	   	<img src="${pageContext.request.contextPath}/images/right_arrow.png" alt="오른쪽 화살표" class="arrow-icon">
	  </button>
	
	  <ul class="carousel-indicators">
	    <li class="active"></li>
	    <li></li>
	    <li></li>
	    <li></li>
	  </ul>
	</div>		
	
	
	
	<div class="container">
		<div class="left-container">
			<a href="AllMovie.do">영화 정보 보기</a>
		</div>
	
		<div class="main-container">
			  <div class="sub-carousel-container" id="sub-carousel">
				    <div class="sub-carousel-inner">
				
						<c:forEach var="movie" items="${list}" varStatus="status">
							<div class="sub-item-container">
								<a href="movieinfo.do?movieid=${movie.movieId}" class="movie-image-link">
									<img src="https://image.tmdb.org/t/p/w500/${movie.wposter}" alt="${movie.movieName}" />
									<div class="movie-description-overlay">
										<p>${movie.descriptions}</p> <%-- 여기! movie.descriptions 로 수정되었습니다 --%>
										<p class="click-info">클릭하여 상세 정보 보기</p>
									</div>
								</a>
								<a href="movieinfo.do?movieid=${movie.movieId}">${status.count} : ${movie.movieName}</a><br>
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
			
			<div class="board">
				<a href="AllBoard.do">
					KH MVIE 이야기 +
				</a>
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>닉네임</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>좋아요</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${blist}">
							<tr>
								<td>${board.bno}</td>
								<td><a href="./BoardView.do?bno=${board.bno }">${board.titles}</td>
								<td>${board.nickname}</td>
								<td>${board.bdate}</td>
								<td>${board.bview}</td>
								<td>${board.blike}</td>
							</tr>								
						</c:forEach>
					</tbody>
				</table>
				
				
				
			</div>
		</div>
		
		<div class="right-container">
			<a href="AllBoard.do">게시판 정보 보기
		</div>
	
	</div>
<script>
	//로그아웃 start//
	const urlParams = new URLSearchParams(window.location.search);
	const logout= urlParams.get('logout');
	
	
	if (logout === 'success') {
	    alert("로그아웃하셨습니다.");
	    
	}
	//로그아웃 end//
	
// 메인 캐러셀 START
function setMainIndicator(idx) {
  document.querySelectorAll('.carousel-indicators li').forEach((item, index) => {
    item.classList.toggle('active', idx === index);
  });
}

window.onload = () => {
  // 메인 캐러셀 요소
  const mainAnimationOptions = {
    duration : 500,
    fill : 'forwards',
    iterations : 1,
    easing : 'ease-in-out'
  };

  const mainItemContainer = document.querySelector('.carousel-inner');
  const mainCarouselContainer = document.querySelector('.carousel-container');
  let mainAnimating = false;
  let mainIdx = 0;
  const mainTotal = document.querySelectorAll('.carousel-item').length;

  setMainIndicator(mainIdx);

  document.querySelector('.carousel-control.prev').onclick = () => {
    if(mainAnimating) return;
    mainAnimating = true;

    mainIdx = (mainIdx - 1 + mainTotal) % mainTotal;
    setMainIndicator(mainIdx);

    mainItemContainer.prepend(mainItemContainer.lastElementChild);
    let containerWidth = mainCarouselContainer.clientWidth;
    mainItemContainer.style.marginLeft = `-${containerWidth}px`;

    mainItemContainer.animate({marginLeft : `0px`}, mainAnimationOptions).onfinish = () => {
      mainItemContainer.style.marginLeft = '0px';
      mainAnimating = false;
    };
  }

  document.querySelector('.carousel-control.next').onclick = () => {
    if(mainAnimating) return;
    mainAnimating = true;

    mainIdx = (mainIdx + 1) % mainTotal;
    setMainIndicator(mainIdx);

    let containerWidth = mainCarouselContainer.clientWidth;
    mainItemContainer.animate({marginLeft : `-${containerWidth}px`}, mainAnimationOptions).onfinish = () => {
      mainItemContainer.appendChild(mainItemContainer.firstElementChild);
      mainItemContainer.style.marginLeft = '0px';
      mainAnimating = false;
    };
  }

  // 자동 슬라이드
  let autoSlideInterval;
  function startAutoSlide() {
    stopAutoSlide();
    autoSlideInterval = setInterval(() => {
      document.querySelector('.carousel-control.next').click();
    }, 4000);
  }
  function stopAutoSlide() {
    clearInterval(autoSlideInterval);
  }

  mainCarouselContainer.addEventListener('mouseenter', stopAutoSlide);
  mainCarouselContainer.addEventListener('mouseleave', startAutoSlide);
  startAutoSlide();

  // 인디케이터 클릭 시 이동
  document.querySelectorAll('.carousel-indicators li').forEach((indicator, index) => {
    indicator.addEventListener('click', () => {
      goToMainSlide(index);
      startAutoSlide();
    });
  });

  function goToMainSlide(targetIdx) {
    if (mainAnimating || mainIdx === targetIdx) return;

    mainAnimating = true;
    let containerWidth = mainCarouselContainer.clientWidth;
    let diff = targetIdx - mainIdx;

    if (diff > 0) {
      for (let i = 0; i < diff; i++) {
        mainItemContainer.appendChild(mainItemContainer.firstElementChild);
      }
    } else {
      for (let i = 0; i < Math.abs(diff); i++) {
        mainItemContainer.prepend(mainItemContainer.lastElementChild);
      }
    }

    mainItemContainer.style.marginLeft = '0px';
    mainIdx = targetIdx;
    setMainIndicator(mainIdx);
    mainAnimating = false;
  }

  // 서브 캐러셀 START
  const subCarouselInner = document.querySelector(".sub-carousel-inner");
  const subItems = document.querySelectorAll(".sub-item-container");
  const subPrevBtn = document.querySelector(".sub-carousel-control.prev");
  const subNextBtn = document.querySelector(".sub-carousel-control.next");
  const subCarouselContainer = document.querySelector(".sub-carousel-container");

  if (subItems.length === 0) {
    console.warn("No sub-carousel items found. Carousel will not operate.");
    // 버튼 숨기기
    if (subPrevBtn) subPrevBtn.style.display = 'none';
    if (subNextBtn) subNextBtn.style.display = 'none';
    return;
  }

  const subAnimationOptions = {
    duration : 500,
    fill : 'forwards',
    iterations : 1,
    easing : 'ease-in-out'
  };

  const subItemsPerView = 4;
  const subItemsToScroll = 1;
  let subAnimating = false;

  const firstSubItem = subItems?.[0];
  let subItemTotalWidth = 0;
  if (firstSubItem) {
    const itemComputedStyle = getComputedStyle(firstSubItem);
    subItemTotalWidth = firstSubItem.offsetWidth + 
                        parseFloat(itemComputedStyle.marginLeft) + 
                        parseFloat(itemComputedStyle.marginRight);
  }

  subCarouselInner.style.width = `${subItemTotalWidth * subItems.length}px`;
  subCarouselInner.style.marginLeft = `0px`;

  if(subPrevBtn) {
    subPrevBtn.addEventListener('click', () => {
      if (subAnimating) return;
      subAnimating = true;
      for (let i = 0; i < subItemsToScroll; i++) {
        subCarouselInner.prepend(subCarouselInner.lastElementChild);
      }
      subCarouselInner.style.marginLeft = `-${subItemTotalWidth * subItemsToScroll}px`;
      subCarouselInner.animate({marginLeft : `0px`}, subAnimationOptions).onfinish = () => {
        subCarouselInner.style.marginLeft = '0px'; 
        subAnimating = false;
      };
    });
  }

  if(subNextBtn) {
    subNextBtn.addEventListener('click', () => {
      if (subAnimating) return;
      subAnimating = true;
      subCarouselInner.animate({marginLeft : `-${subItemTotalWidth * subItemsToScroll}px`}, subAnimationOptions).onfinish = () => {
        for (let i = 0; i < subItemsToScroll; i++) {
          subCarouselInner.appendChild(subCarouselInner.firstElementChild);
        }
        subCarouselInner.style.marginLeft = '0px';
        subAnimating = false;
      };
    });
  }
  // 서브 캐러셀 END
};

    
    
    
    
    
</script>
</body>

</html>