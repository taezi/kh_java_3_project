<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}

.board-container {
	width: 60%;
	margin: 40px auto 60px auto;
	padding: 20px 30px;
	background-color: #fff;
	border-radius: 16px;
	border: 1px solid black;
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	gap: 20px;
	position: relative;
}

.margin_left, .margin_right {
	width: 20%;
	position: fixed;
	top: 150px;
}
.margin_left {
	left: 0;
}
.margin_right {
	right: 0;
}
.img_left {
	width: 200px;
	height: 200px;
}
.img_right {
	width: 150px;
	height: 600px;
}

.board-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px;
	border-bottom: 1px solid black;
	padding-bottom: 10px;
	text-align: left;
}

.board-meta-line {
	display: flex;
	justify-content: flex-start;
	gap: 20px;
	font-size: 14px;
	color: #777;
	padding: 2px 0;
	text-align: left;
}

.content {
	font-size: 16px;
	line-height: 1.5;
	padding-top: 10px;
	text-align: left;
}

.btn_content_like {
	background: none;
	border: none;
	cursor: pointer;
	display: flex;
	align-items: center;
	gap: 10px;
	justify-content: center;
	padding-top: 10px;
	align-self: center;
}

.board_heart {
	width: 40px;
	height: 40px;
	transition: transform 0.2s;
}
.board_heart:hover {
	transform: scale(1.1);
}

.board-actions {
	position: absolute;
	top: 20px;
	right: 30px;
	display: flex;
	gap: 10px;
}

.button-common {
	padding: 10px 18px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	font-size: 14px;
	text-decoration: none;
}
.button-delete {
	background-color: #e74c3c;
	color: white;
}
.button-modify {
	background-color: #3498db;
	color: white;
}
.button-common:hover {
	opacity: 0.9;
}

/* 신고 버튼 위치 오른쪽 정렬 (중복 방지해서 하나만 남김) */
.board-container > .report-button,
.board-container > button[onclick^="reportUser"],
.board-container > button[onclick^="alertAndRedirect"] {
	position: absolute;
	top: 20px;
	right: 100px;
	color: red;
	background: none;
	border: none;
	cursor: pointer;
	font-size: 16px;
}

/* 댓글 전체 영역 */
.comments-section {
	display: flex;
	flex-direction: column;
	gap: 20px;
	border-top: 1px solid black;
	padding-top: 20px;
}

/* 댓글 입력 폼 */
.comment-form {
	display: flex;
	flex-direction: column;
	align-items: center;
}
.comment-form textarea {
	width: 100%;
	max-width: 600px;
	height: 70px;
	resize: none;
	border: 1px solid #ccc;
	border-radius: 8px;
	padding: 10px;
	font-size: 14px;
	outline: none;
}
.comment-form button {
	margin-top: 10px;
}

.comment {
	background-color: #f9f9f9;
	padding: 16px 20px;
	border-radius: 12px;
	box-shadow: 0 2px 6px rgba(0,0,0,0.08);
	position: relative;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	gap: 10px;
}

.comment ul {
	list-style: none;
	padding: 0;
	margin: 0;
	text-align: left;
	display: flex;
	flex-direction: column;
	gap: 2px;
	font-size: 13px;
	color: #555;
}
.comment li:first-child {
	font-weight: bold;
}
.comment li:nth-child(2) {
	font-size: 12px;
	color: #888;
}
.comment li:nth-child(3) {
	font-size: 14px;
	margin-top: 4px;
}

.comment-actions {
	position: absolute;
	top: 10px;
	right: 10px;
	display: flex;
	gap: 5px;
}

.button-small {
	padding: 6px 10px;
	font-size: 12px;
	text-decoration: none;
}

/* 댓글 좋아요 중앙정렬 */
.btn_comment_like {
	background: none;
	border: none;
	display: flex;
	align-items: center;
	gap: 8px;
	cursor: pointer;
	justify-content: center;
	margin-top: 10px;
	align-self: center;
}

.comment_heart {
	width: 30px;
	height: 30px;
	transition: transform 0.2s;
}
.comment_heart:hover {
	transform: scale(1.1);
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

		<h3 class="board-title"><span id="title-display">${board.titles }</span></h3>
		<span class="board-meta-info">${board.nickname }</span>
		<span class="board-meta-info">${board.bdate }</span><span class="board-meta-info">&#128064;${board.bview }회</p>
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

		<button type="button" class="btn_content_like">
			<img src="${pageContext.request.contextPath}/images/heart.png"
				class="board_heart" alt="하트엑박"> <span>
				${board.blike }</span>
		</button>

		<div class="board-actions">

			<c:if test="${sessionScope.user != null && sessionScope.user.usersid == board.usersId }">
				<a href="./BoardDelete.do?bno=${board.bno}" class="button-common button-delete">삭제</a>
				<!-- 🆕 수정 버튼 -->
				<a href="#" id="edit-btn" class="button-common button-modify">수정</a>
			</c:if>	
		</div>
		
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
			            <li>${comment.nickname }</li>
			            <li>${comment.bcdate }</li>
			            <li>${comment.bcpost }</li>
			            <li>
			                <button type="button" class="btn_comment_like" data-bcno="${comment.bcno}">
							    <input type="hidden" name="cno" value="${comment.bcno}">
							    <img src="${pageContext.request.contextPath}/images/heart.png" class="comment_heart" alt="하트엑박">
							    <span>${comment.clike }</span>
							</button>
			            </li>
			        </ul>
			        
			        <div class="comment-actions">
			            <c:if test="${sessionScope.user.usersid == comment.usersId }">
			                <a href="./BoardCommentDelete.do?bcno=${comment.bcno }&bno=${board.bno}" class="button-common button-delete button-small">삭제</a>
							<a href="#" class="button-common button-modify button-small">수정</a>
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
			document.querySelector('.btn_content_like > span').innerHTML = `\${data.count.BLIKE}`;
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
		        e.currentTarget.querySelector('span').innerHTML = `\${newLikeCount}`;
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