<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

.left_container, .main_container, .right_container {
	box-sizing: border-box;
	height: 2000px;
}

.main_container {
	width: 60%;
	border: 1px solid black;
	font-size: 30px;
	border-top: none;
}

.left_container, .right_container {
	width: 20%;
	background-color: black;
}

style>table {
	margin: 20px auto;
	border-collapse: collapse;
	width: 90%;
}

th, td {
	border: 1px solid #aaa;
	padding: 8px;
	text-align: center;
}

thead {
	background-color: #f0f0f0;
}
</style>
</head>
<body>
	<jsp:include page="./template/header.jsp"></jsp:include>

	<div class="container">
		<div class="left_container"></div>

		<div class="main_container">
			<h1>테스트 입니다.</h1>
			<table>
				<thead>
					<tr>
						<th>영화번호</th>
						<th>포스터</th>
						<th>배경 포스터</th>
						<th>영화명</th>
						<th>설명</th>
						<th>개봉일</th>
						<th>장르</th>
						<th>관람등급</th>
						<th>인기도</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="movie" items="${list}">
						<tr>
							<td>${movie.movieId}</td>
							<td><img
								src="https://image.tmdb.org/t/p/w500${movie.wposter}"
								width="100" /></td>
							<td><img
								src="https://image.tmdb.org/t/p/w500${movie.hposter}"
								width="100" /></td>

							<td>${movie.movieName}</td>
							<td>${movie.descriptions}</td>
							<td>${movie.openDt}</td>
							<td>${movie.repGenreNm}</td>
							<td>${movie.gradeNm}</td>
							<td>${movie.popularity}</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>

		<div class="right_container"></div>

	</div>












</body>
</html>