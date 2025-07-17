<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dto.userDTO" %>

<%
    userDTO user = (userDTO) request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>SearchId</title>
<style>
  * {
    margin: 0px;
    padding: 0px;
	font-family: 'Noto Sans KR', sans-serif;
  }
  .container{
    width: 1440px;
    margin: 0 auto;
    height: 750px; /* footer용*/
    /* border: 1px solid black;  */   /* 크기 확인용 */
  }
  header{
    height: 100px;
  /* border: 1px dotted black; */ /* 영역 확인용*/
  }
  .bodyBox{
    display: flex;
    flex-flow: row nowrap;
  }
  .leftside{
    width: 245px;
  /*  background-color: black; */ /* 없음으로 변경_25.07.10 */
  }
  .rightside{
    width: 245px;
    /*  background-color: black; */ /* 없음으로 변경_25.07.10 */
  }
  .searchIdOutbox{
	display: flex;
	flex-flow: column nowrap;
	border: 2px solid #db1a1a;
	padding: 0px;
	width: 800px;
	justify-content: center;
	margin: 100px auto;
  }
  .searchIdInBox > h1 {
    color: black;
    text-align: center;
    font-weight: bold; 
    font-size: 32px;
  }
  .searchIdInBox{
    width: 500px;
    display: flex;
    flex-flow: column nowrap;
    justify-content: center;
    margin: 50px auto;
    border: none;
    row-gap: 20px; 
  }
  input{
	height: 68px;
	border-radius: 10px;
	border: 2px solid darkgray;
	padding: 5px 15px;
	font-size: 20px;
	box-sizing: border-box;
  transition: border-color 0.3s ease;
  }
  input::placeholder {
	  font-size: 20px;
	  color: #8a8a8a;
  }
  input:hover{
    border-color: orange;
  }
  input:focus {
    border-color:#db1a1a;
    outline: none;
  }
  #btn_searchId{
    background-color: #db1a1a;
    color: white;
    font-weight: bold;
    font-size: 20px;
    height: 68px;
    border-radius: 10px;
    border: 2px solid #db1a1a;
    box-sizing: border-box;
    transition: border 0.3s ease;
    cursor: pointer;
  }
  #btn_searchId:hover {
	border: 5px solid orange;
  }
</style>
</head>
<body>
  	<header>
		<div class="move_search">
			<jsp:include page="./template/header.jsp"></jsp:include>
		</div>
	</header>

  <div class="container">
	<c:if test="${not empty okPwMsg}">
		<script>
			alert("${okPwMsg}");
		</script>
	</c:if>
		<c:if test="${not empty errorMsg}">
		<script>
			alert("${errorMsg}");
		</script>
	</c:if>

		<div class="bodyBox">
			<div class="leftside"></div>
      
			<div class="searchIdOutbox">
				<form action="ResetPw.do" method="post" onsubmit="return valueForm()">
					<div class="searchIdInBox">
						<h1>KHMOVIE</h1>
							<input type="hidden" name="id" value="<%= user.getUsersid() %>">
		                    <input id="in_pw" name="passwd" type="password" placeholder="비밀번호를 입력하세요(특수문자+숫자+문자조합)" maxlength="20" required autofocus>
		          			<input id="in_pwre" name="passwdre" type="password" placeholder="비밀번호를 다시 입력하세요(특수문자+숫자+문자조합)" maxlength="20" required>

							<button type="submit" id="btn_searchId">비밀번호 재설정</button>
					</div>
				</form>
			</div>
			<div class="rightside"></div>
			
		</div>
	</div>	
<jsp:include page="./template/footer.jsp"></jsp:include>
</body>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('.searchIdOutbox form'); // 폼 요소를 선택
    const Pw = document.getElementById('in_pw');
    const PwRe = document.getElementById('in_pwre');

      form.addEventListener('submit', function(event) {
        // 기본 제출 동작을 막습니다. (유효성 검사를 위해)
        event.preventDefault(); 

        // 1. 입력 필드 값 확인
         if (Pw.value.trim() === '') {
          alert('비밀번호를 입력해 주세요.');
          Pw.focus();
          return;
         }
        if (PwRe.value.trim() === '') {
          alert('비밀번호를 다시 입력해 주세요.');
          PwRe.focus();
          return;
        }
        // 2. 비밀번호 일치 여부 확인
        if (Pw.value !== PwRe.value) {
          alert('비밀번호가 일치하지 않습니다. 다시 확인해 주세요.');
          PwRe.focus();
          return;
        }
        const password = Pw.value.trim();
        const regex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).+$/;
        // 2-1 비밀번호 특수문자+숫자+알파벳 조합 추가. (해야함)
        if (!regex.test(password)) {
			      alert('비밀번호는 특수문자 + 숫자 + 문자의 조합으로 입력해주세요.');
			    Pw.focus();
			    return;
}
       // 모든 유효성 검사를 통과시 폼을 제출.
        form.submit();
      });
  });
</script>
</html>