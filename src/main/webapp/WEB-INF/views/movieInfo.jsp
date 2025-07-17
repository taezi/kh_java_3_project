<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${movie.movieName}-상세정보</title>
<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<style>
/* 기본 스타일 */
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	color: #1e1e1e;
}

/* 영화 상세 */
.detail-container {
	max-width: 1000px;
	margin: 60px auto;
	background-color: #fff;
	padding: 40px;
	box-shadow: 0 0 12px rgba(0, 0, 0, 0.08);
	display: flex;
	flex-wrap: wrap;
	gap: 40px;
	border-radius: 16px;
}

.poster {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
}

.poster img {
	width: 100%;
	max-width: 320px;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.info {
	flex: 2;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.info h1 {
	font-size: 32px;
	margin-bottom: 12px;
	font-weight: 700;
}

.info .sub {
	font-size: 16px;
	color: #666;
	margin-bottom: 18px;
}

.info p {
	font-size: 16px;
	line-height: 1.6;
	margin: 8px 0;
}

.info .highlight {
	font-weight: 600;
	color: #0077cc;
}

.description {
	margin-top: 20px;
	font-size: 16px;
	color: #444;
}

.popularity {
	margin-top: 14px;
	font-size: 12px;
	color: #999;
}

/* 댓글 섹션 */
.comment-section {
	max-width: 1000px;
	margin: 40px auto;
	background: #ffffff;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
}

.comment-section h3 {
	margin-bottom: 20px;
	font-size: 19px;
	font-weight: 600;
	color: #333;
	border-bottom: 1px solid #eee;
	padding-bottom: 6px;
}

.comment-section form {
	display: flex;
	flex-direction: column;
	gap: 12px;
}

.comment-section textarea {
	width: 100%;
	height: 90px;
	resize: vertical;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 15px;
	background-color: #fafafa;
	transition: border 0.3s;
}

.comment-section textarea:focus {
	border-color: #0077cc;
	outline: none;
	background-color: #fff;
}

.comment-section button {
	align-self: flex-end;
	padding: 8px 20px;
	background-color: #0077cc;
	color: white;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 14px;
	transition: background-color 0.2s ease;
}

.comment-section button:hover {
	background-color: #005fa3;
}

.comment-list {
	margin-top: 30px;
}

.comment-item {
	margin-bottom: 20px;
	padding: 14px 16px;
	background-color: #f9f9f9;
	border-radius: 8px;
	border-left: 4px solid #0077cc;
	transition: background-color 0.3s ease;
}

.comment-item:hover {
	background-color: #f1f1f1;
}

.comment-meta {
	font-size: 12px;
	color: #666;
	margin-bottom: 6px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.comment-meta button {
	background: none;
	border: none;
	color: #d9534f;
	cursor: pointer;
	font-size: 12px;
	transition: color 0.2s;
}

.comment-meta button:hover {
	color: #b52b27;
}
</style>
<script>
	function alertAndRedirect() {
		alert("로그인 후 이용 가능합니다.");
		location.href = "LoginView.do";
	}
	function reportUser(usersid, movieid) {
		  console.log("🐛 전달받은 값:", usersid, movieid);
		  const confirmResult = confirm("해당 유저를 신고하시겠습니까?");
		  if (!confirmResult) return;

		  fetch(`reportMovie.do?usersid=\${usersid}&movieid=\${movieid}`)
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
	<jsp:include page="./template/header.jsp" />

	<!-- 영화 상세 정보 -->
	<div class="detail-container">
		<div class="poster">
			<img src="https://image.tmdb.org/t/p/w500${movie.hposter}"
				alt="${movie.movieName}">
		</div>

		<div class="info">
			<h1>${movie.movieName}</h1>
			<div class="sub">${movie.openDt}개봉·${movie.gradeNm}</div>
			<p>
				<span class="highlight">장르:</span> ${movie.repGenreNm}
			</p>
			<div class="description">
				<span class="highlight">줄거리:</span> <br> ${movie.descriptions}
			</div>
			<div class="popularity">🔥 인기 지수: ${movie.popularity}</div>
		</div>
	</div>

	<!-- 댓글 섹션 -->
	<div class="comment-section">
		<h3>댓글 작성</h3>
		<c:choose>
			<c:when test="${not empty sessionScope.user}">
				<form action="movieCommentWrite.do" method="post">
					<input type="hidden" name="movieid" value="${movie.movieId}" /> <input
						type="hidden" name="usersid" value="${sessionScope.user.usersid}" />
					<textarea name="mpost" placeholder="댓글을 입력하세요..." required></textarea>
					<button type="submit">등록</button>
				</form>
			</c:when>
			<c:otherwise>
				<p style="color: red;">※ 로그인을 한 사용자만 댓글 작성이 가능합니다.</p>
			</c:otherwise>
		</c:choose>

		<hr />

		<!-- 댓글 리스트 -->
		<div class="comment-list">
			<h3>댓글 목록</h3>
			<c:forEach var="comment" items="${commentList}">
				<div class="comment-item">
					<div class="comment-meta"
						style="display: flex; justify-content: space-between; align-items: center;">
						<span> <strong>${comment.usersid}</strong>
							${comment.mdate}
						</span>

						<c:choose>
							<c:when test="${not empty sessionScope.user}">
								<!-- 로그인 상태면 신고 폼 -->
								<input type="hidden" name="mcno" value="${comment.mcno}" />
								<input type="hidden" name="movieid" value="${movie.movieId}" />
								<button type="button"
									onclick="reportUser('${comment.usersid}', '${movie.movieId}')"
									style="background: none; border: none; color: red; cursor: pointer;">🚩신고</button>
							</c:when>
							<c:otherwise>
								<!-- 비로그인 상태면 alert -->
								<button onclick="alertAndRedirect()"
									style="background: none; border: none; color: red; cursor: pointer;">🚩신고</button>
							</c:otherwise>
						</c:choose>
					</div>
					<p>${comment.mpost}</p>
				</div>
			</c:forEach>
		</div>
		
	</div>
	<jsp:include page="./template/footer.jsp"></jsp:include>
</body>
</html>