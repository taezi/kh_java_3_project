<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box; 
		font-family: 'Noto Sans KR', sans-serif; /* 페이지 전체에 Noto Sans KR 적용 */
		
	}
	.top-container{
	background-color:  black;
	}
	
	.container {
		width: 100%; 
		
		font-size: 0px;
		
		display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: flex-start;
	}
	.left-container, .main-container, .right-container {
		box-sizing: border-box;
		height: 1200px; 
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
      font-size: 16px;
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
		
	}
	



.board {
    margin-top: 30px;
    width: 85%; 
    border: 1px solid #444; 
    box-sizing: border-box;
    padding: 20px; 
    background-color: #333; 
    color: #eee; 
    border-radius: 8px; 
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); 
}

.board a {
    color: #ffc107; 
    text-decoration: none; 
    transition: color 0.3s ease;
}

.board a:hover {
    color: #ffd700; 
    text-decoration: underline; 
}

/* KH MVIE 이야기 + 링크 스타일 */
.board > a:first-of-type { /
    display: block;
    font-size: 24px; 
    font-weight: bold;
    margin-bottom: 15px; 
    text-align: left; 
    color: #ffc107; 
}

/* 게시판 테이블 스타일 */
.board table {
    width: 100%; 
    border-collapse: collapse; 
    margin-top: 20px; 
    font-size: 16px; 
    table-layout: fixed; 
}

.board th, .board td {
    border: 1px solid #555;
    padding: 12px; 
    text-align: center; 
    white-space: nowrap; 
    overflow: hidden; 
    text-overflow: ellipsis; 
}

.board thead th {
    background-color: #444; 
    color: #fff; 
    font-weight: bold;
    padding: 15px 12px; 
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
    color: #eee; 
    font-weight: normal;
    text-decoration: none;
}

.board tbody td a:hover {
    color: #ffc107; 
    text-decoration: underline;
}

/* 메인 캐러쉘 이벤트 */
.main-carousel-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* 어두워짐 효과 */
    color: white;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    opacity: 0;
    transition: opacity 0.3s ease;
    pointer-events: none;
    text-align: center;
}

.carousel-item:hover .main-carousel-overlay {
    opacity: 1;
}

.main-carousel-overlay h2 {
    font-size: 80px;
    margin-bottom: 10px;
}

.main-carousel-overlay p {
    font-size: 16px;
    background-color: rgba(255, 255, 255, 0.1);
    padding: 8px 16px;
    border-radius: 5px;
    color: #ffc107;
}


	
</style>

</head>


<body>
	<jsp:include page="./template/header.jsp"></jsp:include>
	<%
  	  String okPwMsg = (String) session.getAttribute("okPwMsg");
  	  if (okPwMsg != null) {
	%>
	    <script>
	        alert("<%= okPwMsg %>");
	    </script>
	<%
	        session.removeAttribute("okPwMsg"); // 한 번만 보여주고 제거
	    }
	%>
	<div class="top-container">
		<div class="carousel-container" id="main-carousel">
		  <div class="carousel-inner">
		    
	        <c:forEach var="movie" items="${mlist}" begin="0" end="3" >
	        
		        <div class="carousel-item" data-movie-id="${movie.movieId}">
					    <img src="https://image.tmdb.org/t/p/w1280/${movie.hposter}" alt="${movie.movieName}" />
					    <div class="main-carousel-overlay">
					        <h2>${movie.movieName}</h2>
					        <p>예고편 보러가기</p>
					    </div>		
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
		
		</div>
	
		<div class="main-container">
			  <div class="sub-carousel-container" id="sub-carousel">
				    <div class="sub-carousel-inner">
				
						<c:forEach var="movie" items="${mlist}" varStatus="status">
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
					KH MOVIE 이야기 +
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
			
		</div>
	
	</div>
	<jsp:include page="./template/footer.jsp"></jsp:include>
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
  
 //메인 캐러셀 누르면 예고편 보여주는 함수 start
  document.querySelectorAll('.carousel-item').forEach(item => {
      item.addEventListener('click', function() {
          const movieId = this.dataset.movieId; 

          if (movieId) {
              
              fetch(`./MovieUrl.do?movieId=\${movieId}`) 
                  .then(response => {
                      if (!response.ok) {
                          throw new Error(`HTTP error! status: ${response.status}`);
                      }
                      return response.json();
                  })
                  .then(data => {
                      if (data.success && data.trailerUrl) {
                          // 새 창으로 예고편 주소 띄우기
                          window.open(data.trailerUrl, '_blank');
                      } else {
                          alert(data.message || '예고편을 가져오는 데 실패했습니다.');
                      }
                  })
                  .catch(error => {
                      console.error('Error fetching trailer:', error);
                      alert('예고편을 가져오는 중 오류가 발생했습니다. 다시 시도해주세요.');
                  });
          } else {
              alert('영화 ID를 찾을 수 없습니다.');
          }
      });
  });
  //메인 캐러셀 누르면 예고편 보여주는 함수 end
  
  
  
  
}; // window.onload 함수의 닫는 중괄호

    
    
    
    
    
</script>
</body>

</html>