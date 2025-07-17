<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  /* box-sizing: border-box; */ /* 07.18결정 */
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
    height: 68px;
    border-radius: 10px;
    border: 2px solid darkgray;
    padding: 5px 20px; 
    font-size: 20px;
    box-sizing: border-box;
    transition: border-color 0.3s ease;
  }
  input::placeholder{
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
	cursor: pointer;
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
document.addEventListener('DOMContentLoaded', function () {
  const inId = document.getElementById('in_id');
  const inUsername = document.getElementById('in_username');
  const inNickname = document.getElementById('in_nickname');
  const inputs = [inId, inUsername, inNickname];

  // 마지막 클릭한 input에 계속 focus 유지
  inputs.forEach(input => {
    input.addEventListener('blur', () => {
      setTimeout(() => {
        const active = document.activeElement;
        if (!inputs.includes(active)) {
          input.focus();
        }
      }, 10);
    });
  });

  // 전역 유효성 검사 함수 등록
  window.valueForm = function () {
    const id = inId.value.trim();
    const username = inUsername.value.trim();
    const nickname = inNickname.value.trim();

    if (id === '') {
      alert('이메일을 입력해주세요.');
      inId.focus();
      return false;
    }
    if (username === '') {
      alert('이름을 입력해주세요.');
      inUsername.focus();
      return false;
    }
    if (nickname === '') {
      alert('별명을 입력해주세요.');
      inNickname.focus();
      return false;
    }
    if (username.length < 2 || nickname.length < 2) {
      alert("이름과 별명은 각각 두 글자 이상 입력해주세요.");
      if (username.length < 2) {
        inUsername.focus();
      } else {
        inNickname.focus();
      }
      return false;
    }

    return true; // 유효성 검사 OK
  };
});
</script>
</body>
</html>