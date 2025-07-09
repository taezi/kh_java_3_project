<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	.container{
		margin: 0 auto;
		width: 1280px;
		height: 2165px;
		font-size: 0px;
		border: 1px solid black;
		display: flex;
        flex-direction: column; 
        align-items: center; 
        justify-content: center; 

	}
	.main-img{
		width: 100%;
		height: 530px;
		font-size: 0px;
		border: 1px solid black;

	}
	.sub-img{
		width: 100%;
		height: 300px;
		font-size: 0px;
		border: 1px solid black;
		

	}

	.board{
		margin-top: 30px;
		width: 80%;
		font-size: 20px;
		border: 1px solid black;
		
		
	}



</style>
</head>


<body>
	<jsp:include page="./template/header.jsp"></jsp:include>
	<div class="main-img">

	</div>
	<div class="container">
		
		<div class="sub-img">

		</div>
		
		<div class="board">
			<h1>게시판</h1>
			<a href="AllMovie.do">영화 정보 보기</a>
			<hr />
			<a href="AllBoard.do">게시판 정보 보기</a>
		</div>
	
		

	</div>
	
</body>
</html>