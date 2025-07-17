<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	transform: scale(1);
	transform-origin: top left;
	zoom: 100%;
}

.container {
	width: 100%;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	box-sizing: border-box;
}

.container > .mid_container {
	flex: 1;
}

.mid_container {
	width: 100%;
	display: flex;
	box-sizing: border-box;
}

.margin_left,
.margin_right {
	width: 20%;
	background-color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	box-sizing: border-box;
}

.img_left {
	width: 200px;
	height: 200px;
}
.img_right {
	width: 150px;
	height: 600px;
}

.main_container {
	width: 60%;
	display: flex;
	flex-direction: column;
	align-items: center;
	box-sizing: border-box;
	padding: 20px 0;
}

/* ✅ 검색폼 전체 우측 정렬 */
.board-search-form {
	width: 100%;
	display: flex;
	justify-content: flex-end;
	box-sizing: border-box;
	margin-bottom: 10px;
}

/* ✅ header와 동일한 검색창 */
.board-search-box {
	position: relative;
	width: 300px;
	height: 45px;
	display: flex;
	align-items: center;
	background-color: white;
	border-radius: 25px;
	border: 1px solid #ccc;
	box-sizing: border-box;
	padding: 0 15px;
}

/* ✅ 검색창 input */
.board-search-input {
	flex-grow: 1;
	border: none;
	outline: none;
	font-size: 14px;
	padding: 0 5px;
	background-color: transparent;
	color: #333;
	height: 100%;
}

/* ✅ 검색 버튼 이미지 (안에 들어감) */
.board-search-button {
	background: none;
	border: none;
	padding: 0;
	cursor: pointer;
}

.board-search-button img {
	width: 24px;
	height: 24px;
}

/* 글쓰기 버튼 */
.button {
	margin-left: 10px;
}
.btn_write {
	height: 45px;
	line-height: 45px;
	padding: 0 20px;
	border: none;
	border-radius: 22px;
	background-color: #DB1A1A;
	font-size: 14px;
	font-weight: 700;
	color: white;
	text-decoration: none;
	cursor: pointer;
	transition: opacity 0.3s ease;
	display: inline-block;
	vertical-align: middle;
}
.btn_write:hover {
	opacity: 0.85;
}

table {
	width: 100%;
	border: 1px solid black;
	border-radius: 20px;
	border-collapse: separate;
	border-spacing: 0;
	overflow: hidden;
	font-size: 12px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
}

thead th {
	padding: 8px;
	border-bottom: 1px solid black;
	background-color: transparent;
}
tbody td {
	padding: 8px;
	border-bottom: 1px solid #ccc;
}
tfoot td {
	text-align: center;
	padding: 10px;
}

td:nth-child(1),
td:nth-child(3),
td:nth-child(4),
td:nth-child(5),
td:nth-child(6) {
	text-align: center;
}

td:nth-child(2) {
	padding-left: 30px;
	text-align: left;
}
td:nth-child(2) a {
	text-decoration: none;
	color: inherit;
}

.pagging_bar a {
	margin: 0 5px;
	text-decoration: none;
	color: #333;
	font-size: 12px;
}
.pagging_bar a.active {
	font-weight: bold;
	color: #DB1A1A;
}

.margin_left a img,
.margin_right a img {
	transition: opacity 0.3s ease;
}
.margin_left a img:hover,
.margin_right a img:hover {
	opacity: 0.8;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="./template/header.jsp"></jsp:include>
		
		<div class="mid_container">
			<div class="margin_left">
				<a href="${pageContext.request.contextPath}/add_left.jsp">
					<img src="${pageContext.request.contextPath}/images/add2.jpg" class="img_left" alt="왼쪽엑박">
				</a>
			</div>
			
			<div class="main_container">
				<!-- ✅ header와 똑같이 생긴 검색창 + 글쓰기 버튼 -->
				<form action="./AllBoard.do" method="get" class="board-search-form">
					<div style="display: flex; align-items: center;">
						<div class="board-search-box">
							<input type="text" name="query" class="board-search-input" placeholder="글제목으로 검색하세요" value="${param.query}">
							<button type="submit" class="board-search-button">
								<img src="${pageContext.request.contextPath}/images/search_icon.png" alt="Search">
							</button>
						</div>
						<div class="button">
							<a href="./BoardWriteView.do" class="btn_write">글쓰기</a>
						</div>
					</div>
				</form>

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
						<c:forEach var="board" items="${list}">
							<tr>
								<td>${board.bno}</td>
								<td><a href="./BoardView.do?bno=${board.bno }">${board.titles}</a></td>
								<td>${board.nickname}</td>
								<td>${board.bdate}</td>
								<td>${board.bview}</td>
								<td>${board.blike}</td>
							</tr>								 				
						</c:forEach>
					</tbody>
					<tfoot>
            			<tr>
            				<td colspan="7" class="pagging_bar">
            					<c:if test="${pagging.priviousPageGroup }">
            						<a href="./AllBoard.do?page=${pagging.startPageOfPageGroup - 1 }">◀</a>
            					</c:if>
					  			<c:forEach var="i" begin="${pagging.startPageOfPageGroup }" end="${pagging.endPageOfPageGroup }">
					  				<c:choose>
						  				<c:when test="${i == pagging.currentPage }">
						  					<a href="./AllBoard.do?page=${i }" class="active">${i }</a>
						  				</c:when>
						  				<c:otherwise>
	            							<a href="./AllBoard.do?page=${i }">${i }</a>
	            						</c:otherwise>
					  				</c:choose>
					  			</c:forEach>
						 		<c:if test="${pagging.nextPageGroup }">
						 			<a href="./AllBoard.do?page=${pagging.endPageOfPageGroup + 1 }">▶</a>      
						 		</c:if>
            				</td>
            			</tr>
            		</tfoot>
				</table>
			</div>
			
			<div class="margin_right">
				<a href="${pageContext.request.contextPath}/add_right.jsp">
					<img src="${pageContext.request.contextPath}/images/add1.jpg" class="img_right" alt="오른쪽엑박">
				</a>
			</div>
		</div>
		<jsp:include page="./template/footer.jsp"></jsp:include>
	</div>
</body>
</html>
