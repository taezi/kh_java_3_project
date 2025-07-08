<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<
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
	<h1>테스트 입니다.</h1>
	<table>
		<thead>
			<tr>
				<th>영화번호</th>
				<th>영화명</th>
				<th>설명</th>
				<th>개봉일</th>
				<th>영화장르</th>
				<th>감독</th>
				<th>제작사</th>
				<th>심의정보</th>
				<th>관람등급</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="movie" items="${list}">
				<tr>
					<td>${movie.movieId }</td>
					<td>${movie.movieName }</td>
					<td>${movie.descriptions }</td>
					<td>${movie.openDt}</td>
					<td>${movie.repGenreNm}</td>
					<td>${movie.directors}</td>
					<td>${movie.companys}</td>
					<td>${movie.audits}</td>
					<td>${movie.gradeNm}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>