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
}

.container {
	width: 100%;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	box-sizing: border-box;
}

/* ✅ 푸터 높이 고정 + 항상 아래로 */
.container > .mid_container {
	flex: 1;
}

/* 중앙 영역 구성 */
.mid_container {
	width: 100%;
	display: flex;
	box-sizing: border-box;
}

/* 좌우 여백 */
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

/* 본문 영역 */
.main_container {
	width: 60%;
	display: flex;
	flex-direction: column;
	align-items: center;
	box-sizing: border-box;
	padding: 20px 0;
}

/* 검색창 + 글쓰기 버튼 정렬 */
.board-search-container {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 100%;
	margin-bottom: 10px;
	gap: 10px;
}

/* 검색창 input */
.board-search-input {
	height: 40px;
	width: 200px;
	padding: 0 10px;
	font-size: 12px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 8px;
}

/* 검색 버튼 */
.board-search-container button {
	height: 40px;
	padding: 0 15px;
	font-size: 12px;
	border: none;
	border-radius: 8px;
	background-color: #eee;
	cursor: pointer;
}

/* 글쓰기 버튼 */
.button {
	margin: 0;
}
.btn_write {
	height: 40px;
	padding: 0 20px;
	border: none;
	border-radius: 20px;
	background-color: #DB1A1A;
	font-size: 12px;
	font-weight: bold;
	color: white;
	text-decoration: none;
	cursor: pointer;
	transition: opacity 0.3s ease;
}
.btn_write:hover {
	opacity: 0.85;
}

/* ✅ 표 설정: 둥근 검정 테두리 + 작은 글씨 */
table {
	width: 100%;
	border: 1px solid black;         /* 전체 검정 테두리 */
	border-radius: 20px;
	border-collapse: separate;
	border-spacing: 0;
	overflow: hidden;
	font-size: 12px;                  /* ✅ 폰트 작게 */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
}

/* ✅ 더블라인 방지: 아래 선만 유지 */
thead th {
	padding: 8px;
	border-bottom: 1px solid black;
	background-color: transparent;
}

/* ✅ 본문행에서 위쪽 선 제거 */
tbody td {
	padding: 8px;
	border-bottom: 1px solid #ccc;  /* 연한 회색선 */
}

/* ✅ 중간 굵은 가로선 제거 위해 이 설정 없음 */
tr {
	/* no extra border here */
}

tfoot td {
	text-align: center;
	padding: 10px;
}

/* 가운데 정렬 열 */
td:nth-child(1),
td:nth-child(3),
td:nth-child(4),
td:nth-child(5),
td:nth-child(6) {
	text-align: center;
}

/* 제목 열은 살짝 왼쪽 */
td:nth-child(2) {
	padding-left: 30px;
	text-align: left;
}

/* 제목 밑줄 제거 */
td:nth-child(2) a {
	text-decoration: none;
	color: inherit;
}

/* 페이징 */
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

/* 배너 hover 최소화 */
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
				<a href="${pageContext.request.contextPath}/add_left.jsp"><img src="${pageContext.request.contextPath}/images/add2.jpg" class="img_left" alt="왼쪽엑박"></a>
			</div>
			
			<div class="main_container">
				<!-- 0717 게시글 검색 추가(시작)-->
				<form action="./AllBoard.do" method="get" class="board-search-form">
					<div class="board-search-container">
						<input type="text" name="query" class="board-search-input" placeholder="글제목으로 검색하세요" value="${param.query}">
						<button type="submit">글제목검색 버튼</button>
					</div>
				</form> <!-- 0717 게시글 검색 추가(끝)-->
				<div class="button">
                	<a href="./BoardWriteView.do" class="btn_write">글쓰기</a>
            	</div>
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>아이디</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>좋아요</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${list}">
							<tr>
								<td>${board.bno}</td>
								<td><a href="./BoardView.do?bno=${board.bno }">${board.titles}</td>
								<td>${board.usersId}</td>
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
				<a href="${pageContext.request.contextPath}/add_right.jsp"><img src="${pageContext.request.contextPath}/images/add1.jpg" class="img_right" alt="오른쪽엑박"></a>
			</div>
		</div>
		<jsp:include page="./template/footer.jsp"></jsp:include>
	</div>
</body>
</html>