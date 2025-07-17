<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchId</title>
<style>
  * {
    margin: 0px;
    padding: 0px;
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
    display:flex;
    flex-flow: column nowrap;
    border: 1px solid #db1a1a;
    padding: 0px;
    width: 800px;
    justify-content: center;
    margin: 100px auto;
  }
  .searchIdInBox > h1 {
    color: black;
    text-align: center;
    font-weight: bold; 
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
    height: 60px;
    border-radius: 10px;
    border: none;
    border: 1px solid darkgray;
    /* justify-items: center; */
    padding: 5px 20px; 
    font-size: 20px;
  }
  input:hover{
    color: gray;
  }
  input::placeholder{
    /* padding-left: 10px; */ /*여백중복 삭제 25.07.11*/
    font-size: 20px;
    color: #3a3a3a;
    /* justify-content: center; */
  }
    input:focus {
    border-color:#db1a1a;
    outline: none;
  /*  background-color: yellow; */ /* 커서 깜박임 보여셔 지움25.07.11*/
  }
 .searchIdInBox > button{
    height: 50px;
    border-radius: 10px;
    border: #db1a1a
  }
  #btn_searchId{
    background-color: #db1a1a;
    color: white;
    font-weight: bold;
    height: 68px;
    font-size: 20px;
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
  	<c:if test="${not empty errorPWMsg}">
	    <script>
	        alert("${errorPWMsg}");
	    </script>
	</c:if>

		<div class="bodyBox">
			<div class="leftside"></div>
      
			<div class="searchIdOutbox">
				<form action="ResetPwView.do" method="post" onsubmit="return valueForm()">
					<div class="searchIdInBox">
						<h1>KHMOVIE</h1>
            <input id="in_id" type="email" name="id" placeholder="이메일을 입력하세요" maxlength="20" required autofocus>
						<input id="in_username" name="username" type="text" placeholder="이름을 입력하세요" maxlength="20" required>
            <input id="in_nickname" name="nickname" type="text" placeholder="별명을 입력하세요" maxlength="16" required>

            
						<button type="submit" id="btn_searchId">비밀번호찾기</button>
					
					</div>
				</form>
			</div>
			<div class="rightside"></div>

		</div>
	</div>
<jsp:include page="./template/footer.jsp"></jsp:include>	
<script>
  // 유효성 검사 - 이름, 별명 2자이상
function valueForm() {
    const id = document.getElementById('in_id').value.trim();
    const username = document.getElementById('in_username').value.trim();
    const nickname = document.getElementById('in_nickname').value.trim();
    
    if (id === ''){
        alert('이메일을 입력해주세요.');
        document.getElementById('in_id').focus();
        return false;
    }
    if (username === ''){
        alert('이름을 입력해주세요.');
        document.getElementById('in_username').focus();
        return false;
    }
    if (nickname === ''){
      alert('별명을 입력해주세요.');
      document.getElementById('in_nickname').focus();
      return false;
    }
    if (username.length < 2 || nickname.length <2) { 
        alert("이름과 별명은 각각 두 글자 이상 입력해주세요.");
        if(username.length < 2){
          document.getElementById('in_username').focus();
        }else{
          document.getElementById('in_nickname').focus();
        }
        return false; 
    }
    return true; //유효성검사 OK
  }
</script>
</body>
</html>