<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./template/header.jsp"></jsp:include>
	<h1>메인 페이지입니다.</h1>
	<a href="AllMovie.do">영화 정보 보기</a>
	<hr />
	<a href="AllBoard.do">게시판 정보 보기</a>
</body>
</html>