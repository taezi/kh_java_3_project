<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./template/header.jsp"></jsp:include>
	
	<div class="board-container">
		<h3 class="board-title">제목 : ${board.titles }</h3>
		<p class="board-meta-info">작성자 : ${board.usersId }, 작성일 : ${board.bdate }</p>
		<p class="board-meta-info">조회수 : ${board.bview}</p>
		<div class="content">${board.bpost }</div>
		
		<button type="button" class="btn_content_like">
			<img src="${pageContext.request.contextPath}/images/heart.png" class="heart" alt="하트피엔지엑박">
			<span>${board.blike }</span>
		</button>
		
		<div class="board-actions">
			<c:if test="${sessionScope.user != null && sessionScope.user.usersid == board.usersId }">
				<a href="" class="button-common button-delete">게시글 삭제</a>
				<a href="" class="button-common button-modify">게시글 수정</a>
			</c:if>	
		</div>
		
		<div class="comments-section">
			<c:if test="${sessionScope.user != null }">
				<form action="./BoardCommentInsert.do" method="post" class="comment-form">
					<textarea name="content" placeholder="댓글 내용을 입력해 주세요"></textarea>
					<button type="submit" class="button-common button-register">등록</button> <%-- 버튼 클래스 적용 --%>
					<input type="hidden" name="bno" value="${board.bno }">
				</form>
			</c:if>
			
		</div>	
</body>
</html>