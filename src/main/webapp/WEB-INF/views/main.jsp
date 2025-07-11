<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	.main-img {
		width: 100%;
		height: 530px;
		font-size: 0px;
		border: 1px solid black;
		text-align: center;
		background: black;
	}

	.main-img-1 {
		height: 530px;
		max-width: 100%;
		object-fit: cover;
	}

	.sub-carousel {
		width: 100%; 
		height: 350px; 
		border: 1px solid black;
		background: black;
		overflow: hidden; 
        position: relative; 
        font-size: 0px; 
        line-height: 0;
	}

	.item_container {
    list-style-type: none;
    display: flex;
    flex-flow: row nowrap;
    padding: 0;
    margin: 0;
    transition: transform 0.5s ease-in-out;

    
	}
	
	.item_container > li {
	    flex-shrink: 0;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    font-size: 16px;
	    color: white;
	    text-align: center;
	    padding-bottom: 10px;
	    gap: 5px;

	    margin-right: 30px;
	}

    
    .item_container > li:last-child {
        margin-right: 0;
    }
    
    

	.item_container > li > img {
		height: 240px; 
		width: auto;
		object-fit: cover; 
		display: block; /
		
	}
	.item_container > li > a { 
        color: white;
        text-decoration: none;
        font-size: 1rem;
        margin-top: 15px;
        text-align: center;

    }
    .item_container > li > a:hover {
        text-decoration: underline;
    }

	.board {
		margin-top: 30px;
		width: 80%;
		font-size: 20px;
		border: 1px solid black;
        box-sizing: border-box;
	}

	.left_container, .main_container, .right_container {
		box-sizing: border-box;
		height: 2000px; 
	}

	.left_container, .right_container {
		width: 20%;
		font-size: 40px;
		padding: 10px;
	}

	.main_container {
		width: 60%;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: flex-start;
		border: 1px solid black;
	}

	.left_arrow, .right_arrow {
		width: 50px;
        height: 50px;
		position: absolute;
        top: 50%;
        background-color: transparent;
       
        border: none;
       
        
       
	}
    .left_arrow img, .right_arrow img {
        width: 30px;
        height: 30px;
       
    }

	.left_arrow {
		left: 10px;
	}
	.right_arrow {
		right: 10px;
	}
	
	
    .carousel {
	  position: relative;
	  overflow: hidden; 
	  width: 100%; 
	  max-width: 1000px; 
	  margin: auto;
	  
	  height: 530px;
	}
	
    .carousel-track {
	  display: flex;
	  transition: transform 0.5s ease-in-out;

	  width: 300%;
	  height: 100%; 
	}

   
	.carousel-slide {
	  flex-basis: 33.3333%;
	  flex-shrink: 0; 
	  box-sizing: border-box;
	  height: 100%; 
	}


	.carousel-slide img {
	  width: 100%; 
	  height: 100%; 
	  object-fit: cover; 
	  display: block;
	}

    .carousel-btn {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      background: rgba(0, 0, 0, 0.5);
      color: white;
      border: none;
      font-size: 2rem;
      padding: 10px;
      cursor: pointer;
      z-index: 2;
    }

    .carousel-btn.prev {
      left: 20px;
    }

    .carousel-btn.next {
      right: 20px;
    }

    .carousel-dots {
      position: absolute;
      bottom: 20px;
      left: 50%;
      transform: translateX(-50%);
      display: flex;
      gap: 10px;
      z-index: 3;
    }

    .carousel-dots button {
      width: 12px;
      height: 12px;
      border-radius: 50%;
      border: none;
      background-color: rgba(255, 255, 255, 0.5);
      cursor: pointer;
    }

    .carousel-dots button.active {
      background-color: white;
    }
</style>
<script>

</script>
</head>


<body>
	<jsp:include page="./template/header.jsp"></jsp:include>
	
   	<div class="carousel">
	    <div class="carousel-track">
	        <c:forEach var="movie" items="${list}" begin="0" end="2">
				<div class="carousel-slide">
					<img src="https:/image.tmdb.org/t/p/w1280/${movie.hposter}" alt="${movie.movieName}" />
				</div> 
			</c:forEach>
	      </div>
	    </div>
	    <button class="carousel-btn prev">&#10094;</button>
	    <button class="carousel-btn next">&#10095;</button>
	    <div class="carousel-dots"></div>
    </div>
		

	
	
	<div class="container">
		<div class="left_container">
			<a href="AllMovie.do">영화 정보 보기</a>
		</div>

		<div class="main_container">
			<div class="sub-carousel">
		        <ul class="item_container">
        	    	<c:forEach var="movie" items="${list}">
				    	
				    		<li>
					    		<img src="https://image.tmdb.org/t/p/w500/${movie.wposter}" alt="${movie.movieName}" />
					    		<a>${movie.movieName}</a><br>
					    		<a>${movie.popularity}</a>
				    		</li>
				        
					</c:forEach>

		        </ul>
		        <button type="button" class="left_arrow">
		        	<img src="${pageContext.request.contextPath}/images/left_arrow.png" alt="왼쪽 화살표" class="arrow-icon">
		        </button>
	       		<button type="button" class="right_arrow">
	       			<img src="${pageContext.request.contextPath}/images/right_arrow.png" alt="오른쪽 화살표" class="arrow-icon">
	       		</button>
	      	</div>
			
			<div class="board">
				<h1>게시판</h1>
				<a href="AllMovie.do">영화 정보 보기</a>
				<hr />
				<a href="AllBoard.do">게시판 정보 보기</a>
				
				
			</div>
		</div>
		
		<div class="right_container">
			<a href="AllBoard.do">게시판 정보 보기</a>
			<a href="Cas.do">캐러셀 보기</a>
		</div>

	</div>
	<script>
	    //로그아웃//
	    const urlParams = new URLSearchParams(window.location.search);
	    const logout= urlParams.get('logout');
	    
	   
	    if (logout === 'success') {
	        alert("로그아웃하셨습니다.");
	        
	    }
	    //-로그아웃//
	    window.onload = () => {
	        const track = document.querySelector('.carousel-track');
	        const slides = Array.from(track.children);
	        const prevBtn = document.querySelector('.carousel-btn.prev');
	        const nextBtn = document.querySelector('.carousel-btn.next');
	        const dotsContainer = document.querySelector('.carousel-dots');

	        let currentIndex = 0;

	        
	        const slideWidth = slides[0].offsetWidth; 

	       
	        slides.forEach((_, i) => {
	            const dot = document.createElement('button');
	            if (i === 0) dot.classList.add('active');
	            dotsContainer.appendChild(dot);
	        });

	        const dots = Array.from(dotsContainer.children);

	    
	        const updateSlide = (index) => {
	           
	            track.style.transform = `translateX(-${index * slideWidth}px)`;
	            
	            
	            dots.forEach(dot => dot.classList.remove('active'));
	            dots[index].classList.add('active');
	            
	            currentIndex = index;
	        };

	      
	        updateSlide(currentIndex); 

	        nextBtn.onclick = () => {
	            const newIndex = (currentIndex + 1) % slides.length;
	            updateSlide(newIndex);
	        };

	        prevBtn.onclick = () => {
	            const newIndex = (currentIndex - 1 + slides.length) % slides.length;
	            updateSlide(newIndex);
	        };

	        dots.forEach((dot, i) => {
	            dot.onclick = () => updateSlide(i);
	        });

	     
	        let autoSlideInterval = setInterval(() => {
	            const newIndex = (currentIndex + 1) % slides.length;
	            updateSlide(newIndex);
	        }, 3000);
	    };
	    
	    
	    
	    
	</script>
</body>

</html>