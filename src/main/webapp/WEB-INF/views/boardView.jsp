<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script> //신고 부분 Script입니다.
function alertAndRedirect() {
	alert("로그인 후 이용 가능합니다.");
	location.href = "LoginView.do";
}
function reportUser(usersid, bno) {
	  console.log("🐛 전달받은 값:", usersid, bno);
	  const confirmResult = confirm("해당 유저를 신고하시겠습니까?");
	  if (!confirmResult) return;

	  fetch(`reportBoard.do?usersid=\${usersid}&bno=\${bno}`)
	    .then((res) => {
	      if (!res.ok) throw new Error("서버 오류");
	      return res.text();
	    })
	    .then((result) => {
	      alert("신고가 접수되었습니다.");
	    })
	    .catch((error) => {
	      alert("신고 중 오류가 발생했습니다.");
	      console.error(error);
	    });
	}
</script>
</head>
<body>
	<jsp:include page="./template/header.jsp"></jsp:include>
	<div class="board-container">

			<!-- 신고 시작 부분 -->
		<c:choose>
			<c:when test="${not empty sessionScope.user}">
				<input type="hidden" name="bno" value="${board.bno}" />
				<button type="button"
					onclick="reportUser('${board.usersId}', '${board.bno}')"
					style="background: none; border: none; color: red; cursor: pointer;">🚩신고</button>
			</c:when>
			<c:otherwise>
				<button onclick="alertAndRedirect()"
					style="background: none; border: none; color: red; cursor: pointer;">🚩신고</button>
			</c:otherwise>
		</c:choose>
		<!-- 신고 끝 부분 -->

		<h3 class="board-title">제목 : ${board.titles }</h3>
		<p class="board-meta-info">작성자 : ${board.usersId }, 작성일 :
			${board.bdate }</p>
		<p class="board-meta-info">조회수 : ${board.bview }</p>
		<div class="content">${board.bpost }</div>

		<button type="button" class="btn_content_like">
			<img src="${pageContext.request.contextPath}/images/heart.png"
				class="board_heart" alt="하트엑박"> <span>좋아요 개수 :
				${board.blike }</span>
		</button>

		<div class="board-actions">
			<c:if
				test="${sessionScope.user != null && sessionScope.user.usersid == board.usersId }">
				<a href="./BoardDelete.do?bno=${board.bno}"
					class="button-common button-delete">게시글 삭제 버튼</a>
				<a href="" class="button-common button-modify">게시글 수정</a>
			</c:if>
		</div>

		<hr>
		<!-------------- 게시글 댓글 구분 -------------->

		<div class="comments-section">
			<c:if test="${sessionScope.user != null }">
				<form action="./BoardCommentInsert.do" method="post"
					class="comment-form">
					<textarea name="content" placeholder="댓글 내용을 입력해 주세요"></textarea>
					<button type="submit" class="button-common button-register">등록</button>
					<input type="hidden" name="bno" value="${board.bno}">
				</form>
			</c:if>

			<c:forEach var="comment" items="${clist }">

				<div class="comment" data-bno="${board.bno}">
					<input type="hidden" name="cno" value="${comment.bcno}">
					<ul>
						<li>작성자 : ${comment.usersId }</li>
						<li>작성일 : ${comment.bcdate }</li>
						<li>
							<button type="button" class="btn_comment_like"
								data-bcno="${comment.bcno}">
								<input type="hidden" name="cno" value="${comment.bcno}">
								<img src="${pageContext.request.contextPath}/images/heart.png"
									class="comment_heart" alt="하트엑박"> <span>좋아요 개수 :
									${comment.clike }</span>
							</button>
						</li>
					</ul>
					<p>${comment.bcpost }</p>

					<div class="comment-actions">
						<c:if test="${sessionScope.user.usersid == comment.usersId }">
							<!--<a href="./BoardCommentDelete.do?cno=${comment.bcno }" class="button-common button-delete button-small">댓글 삭제</a>-->
							<a
								href="./BoardCommentDelete.do?bcno=${comment.bcno }&bno=${board.bno}"
								class="button-common button-delete button-small">댓글 삭제 버튼</a>
							<!-- 0716 gpt 댓글삭제 기능 -->
							<a href="#" class="button-common button-modify button-small">댓글
								수정</a>
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
		    const cno = e.currentTarget.querySelector('input[name="cno"]')?.value;
		    const commentDiv = e.currentTarget.closest('.comment');
		    const bno = commentDiv?.dataset?.bno;

		    if (!cno || !bno) {
		        console.error("cno 또는 bno를 찾을 수 없습니다.");
		        return;
		    }

		    try {
		        const response = await fetch(`./BoardCommentLike.do?bcno=\${cno}&bno=\${bno}`);
		        const data = await response.json();
		        alert(data.msg);

		        const newLikeCount = (data.bcount && typeof data.bcount.CLIKE !== 'undefined') ? data.bcount.CLIKE : 0;
		        e.currentTarget.querySelector('span').innerHTML = `좋아요 개수 : \${newLikeCount}`;
		    } catch (error) {
		        console.error("댓글 좋아요 처리 중 오류 발생:", error);
		    }
		};
	});
	//댓글 좋아요 end//
</script>
</html>