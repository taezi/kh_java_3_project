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
  .adminInfo{
    display:flex;
    flex-flow: column nowrap;
    border: 2px solid #db1a1a;
    padding: 20px 20px;
    width: 800px;
    justify-content: center;
    margin: 100px auto;
  } 
  h2{
    margin-top: 20px;
  } 
  .crimeList, .registerList{
    padding: 20px;
    margin: 20px 20px;
    border: 2px dotted #db1a1a; /* 영역확인용 나중 삭제 */
    height: 150px;
    /* width: px; */
  }   
</style>
</head>
<body>
	<jsp:include page="./template/header.jsp"></jsp:include>
	<div class="container">
		<div class="left_container">
		</div>

		<div class="main_container">
			<div class="adminInfo">
        <h1>관리자페이지</h1>
          <p></p>
          <h2>■ 신고 목록</h2>
          <p></p>
          <div class="crimeList">
           신고 목록이 없습니다.
          </div>
          <p></p>
          <h2>■ 회원 목록</h2>
          <p></p>
          <div class="registerList">
           회원 목록이 나올예정입니다.
          </div>
        </div>
		</div>

		<div class="right_container">
		</div>

	</div>
	
</body>
</html>