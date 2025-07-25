<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	font-family: Arial, sans-serif;
}

.container {
	display: flex;
	justify-content: center;
	background-color: #f9f9f9;
	min-height: 100vh;
}

.left_container, .right_container {
	width: 20%;
	background-color: #000;
}

.main_container {
	width: 60%;
	padding: 40px 20px;
	background-color: #fff;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
}

.adminInfo {
	border: 2px solid #db1a1a;
	padding: 30px;
	width: 100%;
	margin: 0 auto;
	background-color: #fff8f8;
}

h1 {
	margin-bottom: 30px;
	color: #db1a1a;
	text-align: center;
}

h2 {
	margin-top: 30px;
	margin-bottom: 10px;
	color: #333;
}

.crimeList, .registerList {
	border: 2px dotted #db1a1a;
	padding: 20px;
	margin-bottom: 30px;
	background-color: #fff;
}

table.registerList {
	width: 100%;
	border-collapse: collapse;
	background-color: #fff;
}

table.registerList th, table.registerList td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}

table.registerList th {
	background-color: #ffe5e5;
	color: #db1a1a;
}

button {
	padding: 5px 10px;
	background-color: #db1a1a;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 4px;
}

button:hover {
	background-color: #b31212;
}
</style>
</head>
<body>
	<jsp:include page="./template/header.jsp"></jsp:include>
	<div class="container">
		<div class="left_container"></div>

		<div class="main_container">
			<div class="adminInfo">
				<h1>관리자페이지</h1>
				<h2>■ 영화 댓글 신고 목록</h2>
				<c:choose>
					<c:when test="${empty reportList}">
						<div class="crimeList">신고 목록이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<table class="registerList">
							<tr>
								<th>작성자</th>
								<th>영화ID</th>
								<th>관리</th>
							</tr>
							<c:forEach var="report" items="${reportList}">
								<c:if test="${report.reports > 0}">
									<tr>
										<td>${report.usersid}</td>
										<td><a href="movieinfo.do?movieid=${report.movieid}"
											style="color: #db1a1a; text-decoration: underline;">
												${report.movieid} </a></td>
										<td>
											<form action="DeleteMovieComment.do" method="post"
												onsubmit="return confirm('정말 삭제하시겠습니까?');">
												<input type="hidden" name="mcno" value="${report.mcno}" />
												<input type="hidden" name="usersid"
													value="${report.usersid}" /> <input type="hidden"
													name="movieid" value="${report.movieid}" />
												<button type="submit">삭제</button>
											</form>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>

				<h2>■ 게시판 신고 목록</h2>
				<c:choose>
					<c:when test="${empty boardReportList}">
						<div class="crimeList">신고 목록이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<table class="registerList">
							<tr>
								<th>작성자</th>
								<th>게시판 번호</th>
								<th>관리</th>
							</tr>
							<c:forEach var="breport" items="${boardReportList}">
								<c:if test="${breport.reports > 0}">
									<tr>
										<td>${breport.usersId}</td>
										<td><a href="BoardView.do?bno=${breport.bno}"
											style="color: #db1a1a; text-decoration: underline;">
												${breport.bno} </a></td>
										<td>
											<form action="AdminBoardDelete.do" method="post"
												onsubmit="return confirm('정말 삭제하시겠습니까?');">
												<input type="hidden" name="bno" value="${breport.bno}" />
												<input type="hidden" name="usersid"
													value="${breport.usersId}" />
												<button type="submit">삭제</button>
											</form>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>

				<h2>■ 회원 목록</h2>
				<c:choose>
					<c:when test="${empty userList}">
						<div class="registerList">회원 목록이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<table class="registerList">
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>닉네임</th>
								<th>관리</th>
							</tr>
							<c:forEach var="user" items="${userList}">
								<tr>
									<td>${user.usersid}</td>
									<td>${user.userName}</td>
									<td>${user.nickName}</td>
									<td>
										<form action="UserDelete.do" method="get"
											onsubmit="return confirm('정말 삭제하시겠습니까?');">
											<input type="hidden" name="usersid" value="${user.usersid}" />
											<button type="submit">삭제</button>
										</form>
									</td>
								</tr>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>


			</div>
		</div>

		<div class="right_container"></div>
		

	</div>
	<jsp:include page="./template/footer.jsp"></jsp:include>

</body>
</html>