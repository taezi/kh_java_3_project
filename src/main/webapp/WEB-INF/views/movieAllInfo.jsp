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

    body {
      font-family: Arial, sans-serif;
      background-color: #f8f8f8;
    }

    .container {
      display: flex;
      justify-content: center;
      padding: 40px 0;
    }

    .left_container,
    .right_container {
      width: 20%;
      background-color: #1e1e1e;
      height: auto;
    }

    .main_container {
      width: 60%;
      background-color: #fff;
      padding: 20px;
      border: 1px solid #ccc;
      border-top: none;
    }

    .main_container h1 {
      text-align: center;
      margin-bottom: 30px;
      font-size: 32px;
      color: #333;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      font-size: 14px;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 10px;
      text-align: center;
      vertical-align: middle;
    }

    thead {
      background-color: #f0f0f0;
    }

    tbody tr:hover {
      background-color: #f9f9f9;
    }

    img {
      max-width: 100px;
      height: auto;
      border-radius: 5px;
    }

    td:nth-child(5) {  /* 설명 줄이기 */
      max-width: 300px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
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