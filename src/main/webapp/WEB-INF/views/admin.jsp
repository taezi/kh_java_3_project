<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    .container {
      display: flex;
      justify-content: center;
     
    }
    
	.left_container,
    .right_container {
      width: 20%;
      background-color: black;
      height: 2000px;
    }

    .main_container {
      width: 60%;
      padding: 20px;
      border: 1px solid #ccc;
      border-top: none;
    }
    
    
</style>
</head>
<body>
	<jsp:include page="./template/header.jsp"></jsp:include>
	<div class="container">
		<div class="left_container">
		</div>

		<div class="main_container">
			<h2>관리자페이지</h2>
		</div>

		<div class="right_container">
		</div>

	</div>
	
</body>
</html>