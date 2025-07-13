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
<style>
	* {
		margin: 0;
		padding: 0;	
	}
	
	.container {
        width: 100%;
		box-sizing: border-box;
        font-size: 0px;
        
        display: flex;
		flex-flow: row nowrap;
	}
	.margin_left, .margin_right {
		width: 10%;
		box-sizing: border-box;		
	}
	form {
		margin: 0 auto;
		width: 80%
		display: flex;
		flex-flow: column nowrap;
		border: 1px solid black;
	}
	#title {
		height: 40%;
		box-sizing: border-box;
		
		padding-left: 30px;
		padding-top: 50px;
		font-size: 48px;
		outline: none;
	}
	#content {
		height: 60%;
		box-sizing: border-box;
		
		padding-left: 30px;
		padding-bottom: 570px;
		font-size: 24px;
		outline: none;
	}
	#title::placeholder {
 		color: lightgray;
		font-size: 48px;
	}
	
	.bottom {
		height: 100px;
		display: flex;
		flex-flow: row nowrap;
		justify-content: space-between;
		border: 1px solid black;
	}
	#back {
		width: 110px;
		height: 50px;
		margin-left: 60px;
		margin-top: 20px;
		
		border-style: none;
		background-color: transparent;
		
		font-size: 18px;
		font-weight: bold;
		color: #5B5B5B;
	}
	#register {
		width: 110px;
		height: 50px;
		margin-right: 60px;
		margin-top: 20px;
		
		border-style: none;
		border-radius: 20px;
		background-color: #DB1A1A;
		
		font-size: 18px;
		font-weight: bold;
		color: white;
	}
</style>
<script>
	window.onload = () => {
		const editor = new toastui.Editor({
        	el: document.querySelector('#editor'), //에디터를 #editor에 넣음
        	previewStyle: 'vertical',
        	height: '500px',
        	initialEditType : 'wysiwyg',
        	placeholder: '당신의 이야기를 적어보세요...'
      	});
	
		console.log(editor.getHTML()); //콘솔에 작성된 HTML내용 찍어보기
	
		document.querySelector('form').onsubmit = (e) => {
			console.log(editor.getHTML());	
			document.querySelector('#content').value = editor.getHTML(); //에디터에 작성한 HTML을 숨겨진<input>태그에 넣어서 전송되게함
		};
	};
</script>
</head>
<body><%-- 테스트할때 귀찮아서 주석처리해뒀음
	<c:if test="${sessionScope.user == null }">
		<script>
			alert('로그인 후 글쓰기가 가능합니다.');
			history.back();
		</script>	
	</c:if> --%>
	
	<jsp:include page="./template/header.jsp"></jsp:include>
	
	<div class="container">	
		<div class="margin_left"></div>
		<form action="./BoardWriteView.do" method="post" enctype="multipart/form-data"> <!-- method="post", enctype="multipart/form-data" : 파일도 전송할거라 필요함 -->
			<div id="editor"></div>
			<input type="text" id="title" name="title" placeholder="제목">					  
			<input type="hidden" name="content" id="content"> <!-- <input type="hidden" : 화면에 보이지 않는 입력 태그, 근데 form데이터를 서버로 전송할때는 포함됨 -->	
		<%--<input type="text" id="content" name="content" placeholder="당신의 이야기를 적어보세요...">--%> <!-- content의 placeholder는 에디터에 넣어버렸음 -->
			<br>
		<%--<input type="file" name="file">
			<input type="file" name="file">
			<input type="file" name="file">--%> <!-- 첨부파일꼭안해도되지않나...흠 -->
		</form>
		<div class="margin_right"></div>
	</div>
		
	<div class="bottom">
		<button type="button" id="back" onclick="history.back();">← 뒤로가기</button>
		<button type="submit" id="register" form="input">등록</button> <!-- form="input" : 위의 form의 id와 이어줌 -->
	</div>
</body>
</html>