<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	width: 100%;
	height: 100%;
	box-sizing: border-box;
	
	margin: 0;
	paddint: 0;
}
.mid_container {
	width: 100%;
	box-sizing: border-box;
	
	display: 100%;
	flex-flow: row nowrap;
}
.margin_left, .margin_right {
	width: 30%;
	box-sizing: border-box;
}
.margin_right {
	display: flex;
	flex-flow: column nowrap;
}
table {
	width: 70%;
	box-sizing: border-box;
	margin: 0 auto;
	
	border-collapse: collapse;
	border: 1px solid black;
	border-bottom: none;
}
tr {
	border-bottom: 1px solid black;
	text
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="./template/header.jsp"></jsp:include>
		<div class="mid_container">
			<div class="margin_left">
			<a href=""><img src="${pageContext.request.contextPath}/images/add1.jpg" alt="왼쪽엑박"></a>
			</div>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>아이디</th>
						<th>작성일</th>
						<th>조회수</th>
					<%--<th>좋아요</th>--%>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${list}">
						<tr>
							<td>${board.bno}</td>
							<td>${board.titles}</td>
							<td>${board.usersId}</td>
							<td>${board.bdate}</td>
							<td>${board.bview}</td>
						<%--<td>${board.blike}</td>--%> <!-- DTO에 blike 없어서 주석처리해뒀습니다 -->	
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="margin_right">
				<a href="./BoardWriteView.do" class="btn">글쓰기</a>
				<a href=""><img src="${pageContext.request.contextPath}/images/add2.jpg" alt="오른쪽엑박"></a>
			</div>
		</div>
		<jsp:include page="./template/footer.jsp"></jsp:include>
	</div>
</body>
</html>