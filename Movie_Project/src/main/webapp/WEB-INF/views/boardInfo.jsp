<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<style>
table {
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
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>게시판 번호</th>
				<th>유저 아이디</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${list}">
				<tr>
					<td>${board.bno}</td>
					<td>${board.usersId}</td>
					<td>${board.titles}</td>
					<td>${board.bpost}</td>
					<td>${board.bdate}</td>
					<td>${board.bview}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>