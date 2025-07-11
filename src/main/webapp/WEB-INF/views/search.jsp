<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
			margin: 0;
			padding: 0;
			box-sizing: border-box; 
	}
	
	
	
	.container{
		width: 100%; 
		height: 2000px; 
		font-size: 0px;
		border: 1px solid black;
		display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: flex-start;
	}
	.left_container, .main_container, .right_container {
		box-sizing: border-box;
		height: 2000px; 
	}
	.main_container {
		width: 60%;
		border: 1px solid black;
		font-size: 30px;
		border-top: none;
	}

	.left_container, .right_container {
		width: 20%;
		background-color: black; /* 구분하기위해서 임시로 검은색 */
	}
	
		


</style>


</head>
<body>
	<jsp:include page="./template/header.jsp"></jsp:include>
	<div class="container">
		<div class="left_container">
			
		</div>

		<div class="main_container">
			<h2>검색어 : ${searchKeyword}</h2>
		</div>
		
		<div class="right_container">
		
		</div>

	</div>
	
	
	
	
	
</body>
</html>