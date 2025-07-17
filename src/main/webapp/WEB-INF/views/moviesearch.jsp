<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<style>
    .search-page-wrapper {
        width: 100%;
        padding: 40px 20px; 
        box-sizing: border-box; 
    }

    .search-title {
        text-align: center;
        font-size: 1.8em;
        margin-bottom: 40px; 
    }

    .movie-container {
        text-align: center;
    }

    .movie-card {
        display: inline-block;
        width: 200px; 
        margin: 15px; 
        vertical-align: top;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        text-align: center;
        overflow: hidden;
        cursor: pointer;
    }

    .movie-card img {
        width: 100%;
    }

    .movie-card .movie-name {
        padding: 15px 10px;
        font-weight: bold;
    }

</style>
</head>
<body>
	<jsp:include page="./template/header.jsp" />
	<div class="search-page-wrapper">
		<h1 class="search-title">"${param.query}"에 대한 검색 결과</h1>
		<div class="movie-container">
			<c:forEach var="movie" items="${mlist}">
				<div class="movie-card">
				<a href="movieinfo.do?movieid=${movie.movieId}">
					<img src="https://image.tmdb.org/t/p/w300${movie.wposter}" alt="${movie.movieName}">
					<div class="movie-name">${movie.movieName}</div>
					</a>
				</div>
			</c:forEach>
		</div>
		<jsp:include page="./template/footer.jsp"></jsp:include>
	</div>

</body>
</html>