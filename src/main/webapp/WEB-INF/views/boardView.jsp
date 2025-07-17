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

		<h3 class="board-title">제목 : <span id="title-display">${board.titles }</span></h3>
		<p class="board-meta-info">작성자 : ${board.usersId }, 작성일 : ${board.bdate }</p>
		<p class="board-meta-info">조회수 : ${board.bview }</p>
		<div class="content"><span id="bpost-display">${board.bpost }</span></div>
		
		<!-- 🆕 게시글 수정 input 영역 (숨겨진 상태) -->
		<c:if test="${sessionScope.user != null && sessionScope.user.usersid == board.usersId }">
			<div id="edit-area" style="display: none;">
				<p>제목 : <input type="text" id="edit-title" value="${board.titles}"></p>
				<p>내용 : <textarea id="edit-bpost">${board.bpost}</textarea></p>
				<button id="save-btn">저장</button>
			</div>
		</c:if>

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

			<c:if test="${sessionScope.user != null && sessionScope.user.usersid == board.usersId }">
				<a href="./BoardDelete.do?bno=${board.bno}" class="button-common button-delete">게시글 삭제 버튼</a>
				<!-- 🆕 수정 버튼 -->
				<a href="#" id="edit-btn" class="button-common button-modify">게시글 수정</a>
			</c:if>	
		</div>
		
		<hr><!-------------- 게시글 댓글 구분 -------------->


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
			                <button type="button" class="btn_comment_like" data-bcno="${comment.bcno}">
							    <input type="hidden" name="cno" value="${comment.bcno}">
							    <img src="${pageContext.request.contextPath}/images/heart.png" class="comment_heart" alt="하트엑박">
							    <span>좋아요 개수 : ${comment.clike }</span>
							</button>
			            </li>
			        </ul>
			        <p>${comment.bcpost }</p>
			        
			        <div class="comment-actions">
			            <c:if test="${sessionScope.user.usersid == comment.usersId }">
			                <a href="./BoardCommentDelete.do?bcno=${comment.bcno }&bno=${board.bno}" class="button-common button-delete button-small">댓글 삭제 버튼</a>
							<a href="#" class="button-common button-modify button-small">댓글 수정</a>
			            </c:if>
			        </div>
			    </div>

			</c:forEach>
		</div>
	</div>

	<!-- 🆕 게시글 수정 시 필요한 bno -->
	<input type="hidden" id="bno" value="${board.bno}">
	<jsp:include page="./template/footer.jsp"></jsp:include>
</body>

<!-- 게시글 좋아요 -->
<script>
	document.querySelector('.btn_content_like').onclick = async (e) => {
		const bno = ${board.bno};

		try{

			const response = await fetch(`./BoardLike.do?bno=\${bno}`);
			const data = await response.json();
			alert(data.msg);
			document.querySelector('.btn_content_like > span').innerHTML = data.count.BLIKE;
		} catch (error) {
			console.log(error);
		}
	};
</script>

<!-- 댓글 좋아요 -->
<script>
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
</script>

<!-- 🆕 게시글 수정 Ajax -->
<script>
	document.getElementById('edit-btn').onclick = () => {
		document.getElementById('edit-area').style.display = 'block';
	};

	document.getElementById('save-btn').onclick = async () => {
		const bno = document.getElementById('bno').value;
		const titles = document.getElementById('edit-title').value;
		const bpost = document.getElementById('edit-bpost').value;

		const response = await fetch('./BoardUpdate.do', {
			method: 'POST',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'bno=' + encodeURIComponent(bno) + '&titles=' + encodeURIComponent(titles) + '&bpost=' + encodeURIComponent(bpost)
		});

		if (response.ok) {
			alert('수정 완료');
			location.reload();
		} else {
			alert('수정 실패');
		}
	};
</script>
<script>
document.querySelectorAll('.comment-actions .button-modify').forEach(button => {
	button.addEventListener('click', () => {
		const comment = button.closest('.comment');
		const p = comment.querySelector('p');
		const old = p.innerText;
		const cno = comment.querySelector('input[name="cno"]').value;
		const bno = comment.dataset.bno;

		// textarea + 저장 버튼 만들기
		const textarea = document.createElement('textarea');
		textarea.value = old;
		const save = document.createElement('button');
		save.innerText = '저장';

		save.onclick = async () => {
			const bcno = encodeURIComponent(cno);
			const bcpost = encodeURIComponent(textarea.value);

			const res = await fetch('./BoardCommentUpdate.do', {
				method: 'POST',
				headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
				body: 'bcno=' + bcno + '&bcpost=' + bcpost // ← 템플릿 리터럴 사용 안함
			});
			if (res.ok) {
				alert('수정 성공');
				location.reload();
			} else {
				alert('실패');
			}
		};

		p.replaceWith(textarea);
		button.replaceWith(save);

	});
});
</script>
</html>
