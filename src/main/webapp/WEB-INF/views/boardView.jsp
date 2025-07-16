<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
.comment_heart, .board_heart { 
	width: 100px;
	height: 100px;
}
textarea {
	width: 400px;
	height: 400px;
}
</style>

</head>
<body>
	<jsp:include page="./template/header.jsp"></jsp:include>
	
	<div class="board-container">
		<h3 class="board-title">제목 : ${board.titles }</h3>
		<p class="board-meta-info">작성자 : ${board.usersId }, 작성일 : ${board.bdate }</p>
		<p class="board-meta-info">조회수 : ${board.bview }</p>
		<div class="content">${board.bpost }</div>
		
		<button type="button" class="btn_content_like">
			<img src="${pageContext.request.contextPath}/images/heart.png" class="board_heart" alt="하트엑박">
			<span>좋아요 개수 : ${board.blike }</span>
		</button>
		
		<div class="board-actions">
			<c:if test="${sessionScope.user != null && sessionScope.user.usersid == board.usersId }">
				<a href="" class="button-common button-delete">게시글 삭제</a>
				<a href="" class="button-common button-modify">게시글 수정</a>
			</c:if>	
		</div>
		
		<hr><!-------------- 게시글 댓글 구분 -------------->
		
		<div class="comments-section">
			<c:if test="${sessionScope.user != null }">
				<form action="./BoardCommentInsert.do" method="post" class="comment-form">
					<textarea name="content" placeholder="댓글 내용을 입력해 주세요"></textarea>
					<button type="submit" class="button-common button-register">등록</button>
					<input type="hidden" name="bno" value="${board.bno }">
				</form>
			</c:if>
			
			<c:forEach var="comment" items="${clist }">
			    <div class="comment" data-bno="${board.bno}"> <input type="hidden" name="cno" value="${comment.bcno}">
			        <ul>
			            <li>작성자 : ${comment.usersId }</li>
			            <li>작성일 : ${comment.bcdate }</li>	
			            <li>
			                <button type="button" class="btn_comment_like" data-bcno="${comment.bcno}">
			                    <img src="${pageContext.request.contextPath}/images/heart.png" class="comment_heart" alt="하트엑박">
			                    <span>좋아요 개수 : ${comment.clike }</span>
			                </button>
			            </li>
			        </ul>
			        <p>${comment.bcpost }</p>
			        
			        <div class="comment-actions">
			            <c:if test="${sessionScope.user.usersid == comment.usersId }">
			                <a href="./BoardCommentDelete.do?cno=${comment.bcno }" class="button-common button-delete button-small">댓글 삭제</a>
			                <a href="#" class="button-common button-modify button-small">댓글 수정</a>
			            </c:if>
			        </div>
			    </div>
			</c:forEach>
	
		</div>
	</div>

</body>
<script>
	//게시글 좋아요 start//
	document.querySelector('.btn_content_like').onclick = async (e) => {
		const bno = ${board.bno};
		
		try{
			const response = await fetch(`./BoardLike.do?bno=\${bno}`);
			const data = await response.json(); //response를 json으로 파싱
		
			alert(data.msg);
			document.querySelector('.btn_content_like > span').innerHTML = data.count.BLIKE; //data.count.BLIKE 이부분수정해야함
			//BLIKE : selectBoardLikeHateCount(bno) 메서드의 SQL 결과에서 생긴 컬럼
			//.xml에선 소문자(대문자 가능)로 쓰지만, Oracle + MyBatis는 대문자로 바꿔서, jsp에서는 대문자로 써야함
		}catch(error){
			console.log(error);
		}
	}
	//게시글 좋아요 end//
	//댓글 좋아요 start//
	document.querySelectorAll('.btn_comment_like').forEach(item => {
	    item.onclick = async (e) => {
	    	const commentDiv = e.currentTarget.closest('.comment');
	        const cno = commentDiv.querySelector('input[name="cno"]').value;
	        const bno = commentDiv.dataset.bno; // data-bno 속성 값 가져오기
	
	        console.log("댓글 번호 (cno):", cno);
	        console.log("게시글 번호 (bno):", bno); // bno 값 확인용
	
	        let url = `./BoardCommentLike.do?bcno=\${cno}&bno=\${bno}`; // bno 파라미터 추가
	
	        try {
	            const response = await fetch(url);
	            const data = await response.json();
	
	            alert(data.msg);
	            console.log("서버 응답 데이터:", data);
	            document.querySelector('.btn_comment_like > span').innerHTML = data.bcount.CLIKE;
	
	            
	        } catch (error) {
	            console.error("댓글 좋아요 처리 중 오류 발생:", error);
	        }
	    }
	});
	//댓글 좋아요 end//
</script>
</html>