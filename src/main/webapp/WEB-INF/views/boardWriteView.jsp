<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<style>
	/* 전체 페이지 기본 설정 */
	body {
		font-family: "Noto Sans KR", sans-serif;
		margin: 0;
		padding: 0;
		background-color: #f0f2f5; /* 배경색을 약간 회색으로 설정 */
		display: flex;
		flex-direction: column;
		min-height: 100vh; /* 최소 높이를 뷰포트 높이로 설정하여 푸터를 하단에 고정 */
	}

	/* 컨테이너 스타일 */
	.container {
		display: flex;
		justify-content: center;
		padding: 20px;
		flex-grow: 1; /* 남은 공간을 채우도록 설정 */
		box-sizing: border-box; /* 패딩 포함 크기 계산 */
	}

	/* 변경된 부분: 좌우 여백을 각각 20%로 설정 */
	.margin_left, .margin_right {
		flex-basis: 20%; /* 좌우 여백 비율을 20%로 조정 */
		max-width: 250px; /* 좌우 여백 최대 너비 제한 (기존 150px에서 조금 더 늘림, 필요시 조절) */
	}

	/* 폼 영역 스타일 */
	form#input {
		background-color: #fff;
		border-radius: 22px;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		padding: 30px;
		width: 100%;
		max-width: 900px; /* 폼의 최대 너비 설정 */
		box-sizing: border-box;
		border: 1px solid black;/**/
	}

	/* 제목 입력 필드 */
	input#title {
		width: 100%;
		padding: 12px 15px;
		margin-bottom: 20px;
		border: 1px solid #black;
		border-radius: 5px;
		font-size: 20px;
		font-weight: bold;
		color: #333;
		box-sizing: border-box;
		outline: none; /* 포커스 시 아웃라인 제거 */
	}
	input#title::placeholder {
		color: #bbb;
	}

	/* Toast UI Editor 컨테이너 */
	#editor {
		border: 1px solid #ddd; /* 에디터 테두리 추가 */
		border-radius: 5px;
		margin-bottom: 20px;
	}

	/* 하단 버튼 영역 */
	.bottom {
		display: flex;
		justify-content: space-between; /* 버튼들을 양 끝으로 정렬 */
		width: 100%;
		/* 좌우 여백 20%를 고려하여 전체 너비의 60%에 해당하는 max-width 설정 */
		/* (100% - 20% - 20% = 60%, container의 max-width 900px을 기준으로 계산) */
		max-width: 900px; 
		margin: 0 auto 30px auto; /* 중앙 정렬 및 하단 여백 추가 */
		padding: 0 20px; /* 좌우 패딩 추가 */
		box-sizing: border-box;
	}

	/* 버튼 스타일 */
	.bottom button {
		padding: 10px 20px;
		border: none;
		border-radius: 22px;
		font-size: 16px;
		cursor: pointer;
		transition: background-color 0.3s ease;
	}

	/* 뒤로가기 버튼 */
	button#back {
		background-color: #6c757d; /* 회색 계열 */
		color: white;
	}
	button#back:hover {
		background-color: #5a6268;
	}

	/* 등록 버튼 */
	button#register {
		background-color: #dc3545; /* 빨간색 계열 */
		color: white;
	}
	button#register:hover {
		background-color: #c82333;
	}
</style>
<script>
	window.onload = () => {
		const editor = new toastui.Editor({
        	el: document.querySelector('#editor'),
        	previewStyle: 'vertical',
        	height: '500px', // 에디터 높이
        	initialEditType : 'wysiwyg',
        	placeholder: '당신의 이야기를 적어보세요...'
      	});
	
		// 콘솔에 작성된 HTML 내용 찍어보기 (개발용)
		// console.log(editor.getHTML());
	
		document.querySelector('#input').onsubmit = (e) => {
			// console.log(editor.getHTML()); // 제출 시 콘솔에 HTML 내용 찍어보기
			document.querySelector('#content').value = editor.getHTML();
		};
	};
</script>
</head>
<body>
	<c:if test="${sessionScope.user == null }">
		<script>
			alert('로그인 후 글쓰기가 가능합니다.');
			history.back();
		</script>	
	</c:if>

	
		<jsp:include page="./template/header.jsp"></jsp:include>
		
		<div class="container">	
			<div class="margin_left"></div>
			<form id="input" action="./BoardWrite.do" method="post">
				<input type="text" id="title" name="title" placeholder="제목">					  
				<div id="editor"></div>
				<input type="hidden" name="content" id="content">
			</form>
			<div class="margin_right"></div>
		</div>
		
		<div class="bottom">
			<button type="button" id="back" onclick="history.back();">← 뒤로가기</button>
			<button type="submit" id="register" form="input">등록</button>
		</div>

		<jsp:include page="./template/footer.jsp"></jsp:include>
	 </body>
</html>