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
<style>/* 헤더걍위로아예빼서 다시하기............ */
	* {
		margin: 0;
		padding: 0;
		
		font-family: 'Noto Sans KR', sans-serif;
		color: #333;
	}
	html, body {
    	height: 100%;
    	margin: 0;
    	padding: 0;
	}
	.max_container {
    	height: 100vh;

    	display: flex;
    	flex-flow: column nowrap;
    	font-size: 0px;	
	}
	.container {
        flex: 1;
		box-sizing: border-box;
        
        display: flex;
		flex-flow: row nowrap;
        font-size: 0px;
        
		background-color: #f0f0f0;
	}
	.margin_left, .margin_right {
		width: 15%;
		box-sizing: border-box;		
	}
	form {

		width: 70%;
		box-sizing: border-box;
		

		display: flex;
		flex-flow: column nowrap;
		font-size: 0px;
		
		border-radius: 30px; /*급히수정*/
			
    	margin: 40px;
   		box-shadow: 0 0 5px rgba(0,0,0,0.5);
   		
   		/*이상하면지워 --> 이거 무족권 들어갔어야했었음!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
   		background-color: white; /* 배경색 추가 */
		overflow: hidden; /* 안쪽에 튀어나오는 거 방지 */
	}
	#title {
		height: 30%;
		box-sizing: border-box;
		
		font-size: 48px;
		outline: none;
		
		border: none;
	}
	#editor {
		height: 70%;
		box-sizing: border-box;
		
		font-size: 24px;
		outline: none;
		
		border: none;
	}
	#title::placeholder {
 		color: lightgray;
		font-size: 48px;
	}
	.bottom {
		height: 100px;
		
		display: flex;
		flex-flow: row nowrap;
		font-size: 0px;
		
		justify-content: space-between;
		
		border: 1px solid black;
	}
	#back {
		width: 110px;
		height: 50px;
		margin-left: 60px; /*조정*/
		margin-top: 20px; /*조정*/
		
		border-style: none;
		background-color: transparent;
		
		font-size: 18px;
		font-weight: bold;
		color: #5B5B5B;
		/*color: #333; 이걸로도해보기*/
	}
	#register {
		width: 110px;
		height: 50px;
		margin-right: 60px; /*조정*/
		margin-top: 20px; /*조정*/
		
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
	
		document.querySelector('#input').onsubmit = (e) => {
			console.log(editor.getHTML());	
			document.querySelector('#content').value = editor.getHTML(); //에디터에 작성한 HTML을 숨겨진<input>태그에 넣어서 전송되게함
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
		<form id="input" action="./BoardWrite.do" method="post"> <!-- method="post", enctype="multipart/form-data" : 파일도 전송할거라 필요함 -->
			<input type="text" id="title" name="title" placeholder="제목">					  
			<div id="editor"></div>
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
		<jsp:include page="./template/footer.jsp"></jsp:include>


</body>
</html>