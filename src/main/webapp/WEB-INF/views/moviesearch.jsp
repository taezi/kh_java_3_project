<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<style>
body {
    margin: 0;
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #f5f5f5;
    color: #333;
}

.search-page-wrapper {
    max-width: 1200px;
    min-height: 720px;
    margin: 0 auto;
    padding: 40px 20px;
    box-sizing: border-box;
    
}

.search-title {
    text-align: center;
    font-size: 20px;
    margin-bottom: 50px;
    font-weight: 600;
    color: #222;
}

.movie-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
}

.movie-card {
    width: 200px;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
    transition: transform 0.2s ease, box-shadow 0.3s ease;
    overflow: hidden;
    text-align: center;
}

.movie-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

.movie-card img {
    width: 100%;
    height: 300px;
    object-fit: cover;
    display: block;
}

.movie-name {
    padding: 15px 10px;
    font-weight: bold;
    font-size: 16px;
    color: #444;
}

.movie-card a {
    text-decoration: none;
    color: inherit;
    display: block;
    height: 100%;
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
	</div>
	<jsp:include page="./template/footer.jsp" />
</body>
</html>