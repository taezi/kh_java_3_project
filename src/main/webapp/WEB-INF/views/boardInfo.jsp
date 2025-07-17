<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
/* 아 <style> 다시고쳐야함 ㅡㅡ, <style>만 다시 고치면됨 ㅡㅡ
.container
	header
	mid_container
		margin_left
			img_left
		main_container
			button
				btn_write
			table
				thead
				tbody
				tfoot
		margin_right
			img_right
	footer
*/
.container {
	margin: 0px;
	padding: 0px;
	
	width: 100%;
	height: 100%;
	box-sizing: border-box;
}

.mid_container {
	width: 100%;
	box-sizing: border-box;
	
	display: flex;
	flex-flow: row nowrap;
}
.margin_left {
	width: 15%;
	box-sizing: border-box;
	
	display: flex;
	justify-content: center;
	align-items: center;
}
.margin_right {
	width: 15%;
	box-sizing: border-box;
	
	display: flex;
	flex-flow: column nowrap;
	
	justify-content: center;
	align-items: center;
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
	width: 70%;
	box-sizing: border-box;
	
	display: flex;
	flex-flow: column nowrap; 
}
.button {
    width: 100%; /* 테이블과 동일한 너비로 설정 */
    box-sizing: border-box;

    display: flex; /* flex 컨테이너로 설정 */
    justify-content: flex-end; /* 내용을 오른쪽 끝으로 정렬 */
    margin-bottom: 10px; /* 버튼과 표 사이에 약간의 간격 */
}
.btn_write {
		width: 110px;
		height: 50px;
		
		border-style: none;
		border-radius: 20px;
		background-color: #DB1A1A;
		
		font-size: 18px;
		font-weight: bold;
		color: white;
	}
table {
	margin: 0 auto;
	
	width: 100%;
	box-sizing: border-box;
	
	border-collapse: collapse;
	border: 1px solid black;
	border-bottom: none;
}
tr {
	border-bottom: 1px solid black;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="./template/header.jsp"></jsp:include>
		
		<!-- 0717 게시글 검색 추가(시작)-->
		<form action="./AllBoard.do" method="get" class="board-search-form">
			<div class="board-search-container">
				<input type="text" name="query" class="board-search-input" placeholder="글제목으로 검색하세요" value="${param.query}">
				<button type="submit">글제목검색 버튼</button>
			</div>
		</form> <!-- 0717 게시글 검색 추가(끝)-->
	    
		<div class="mid_container">
			<div class="margin_left">
				<a href="${pageContext.request.contextPath}/add_left.jsp"><img src="${pageContext.request.contextPath}/images/add2.jpg" class="img_left" alt="왼쪽엑박"></a>
			</div>
			
			<div class="main_container">
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