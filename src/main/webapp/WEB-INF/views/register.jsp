<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>KHMOVE Membership</title>
  <style>
  * {
    margin: 0px;
    padding: 0px;
  font-family: 'Noto Sans KR', sans-serif;
  }
  .container{
    width: 1440px;
    margin: 0 auto;
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
  .membershipOutbox{
    display:flex;
    flex-flow: column nowrap;
    border: 1px solid #db1a1a;
    padding: 0px;
    width: 800px;
    justify-content: center;
    margin: 100px auto;
  }
  .membershipInbox > h1 {
    color: black;
    text-align: center;
    font-weight: bold;
    font-size: 32px; 
  }
  .membershipInbox{
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
  #checkbox{
    display: flex;
    box-sizing: border-box;
    text-align: center;
    text-justify: center;
    gap: 10px;
    padding-left: 10px;
    color: #3a3a3a;
  }
  .membershipInbox > #checkbox :hover{
   color: blue;
  }
  #chk_id{
    height: 24px;
    width: 24px;
    border-radius: 30px;
    justify-self: center;
    margin-top: 5px;
  }
  #checkbox >label{
    font-size: 20px;
  	color: #8a8a8a;
  }
  #btn_membership{
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
  #btn_membership:hover {
	border: 5px solid orange;
  cursor: pointer;
  }
  ul{
  list-style-type: none;
  }
  .linebox{
   display: flex;
    flex-flow: row nowrap;
    align-items: center;
    gap: 10px;
    width: 100%; /* loginInbox의 전체 너비를 사용 */
    box-sizing: border-box;
  }
</style>
<script></script>
</head>
  <body>
        <header>
          <div class="move_search">
            <jsp:include page="./template/header.jsp"></jsp:include>
          </div>
        </header>

   <div class="container">

    <div class="bodyBox">
     <div class="leftside"></div>

     <div class="membershipOutbox">
			<form action="Register.do" method="post">
        <div class="membershipInbox">
          <h1>KHMOVIE</h1>

          <input id="in_id" type="email" name="id" placeholder="이메일을 입력하세요" maxlength="50" required autofocus>
          <input id="in_pw" name="passwd" type="password" placeholder="비밀번호를 입력하세요(특수문자+숫자+문자조합)" maxlength="20" required>
          <input id="in_pwre" name="passwdre" type="password" placeholder="비밀번호를 다시 입력하세요(특수문자+숫자+문자조합)" maxlength="20" required>
          <input id="in_username" name="username" type="text" placeholder="이름을 입력하세요" maxlength="10" required>
          <input id="in_nickname" name="nickname" type="text" placeholder="별명을 입력하세요" maxlength="16" required>
            
          <div id="checkbox">
            <label for="chk_id">가입 필수 정보를 위임하는데 동의합니다.</label><input type="checkbox" id="chk_id">
          </div>
           
          <button type="submit" id="btn_membership">KHMOVIE 회원가입</button>
           
        </div>
       	 </form>
      </div>
      <div class="rightside"></div>
    </div>
    
  </div>
  <jsp:include page="./template/footer.jsp"></jsp:include>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    const form = document.querySelector('.membershipOutbox form');
    const Id = document.getElementById('in_id');
    const Username = document.getElementById('in_username');
    const Pw = document.getElementById('in_pw');
    const PwRe = document.getElementById('in_pwre');
    const Nickname = document.getElementById('in_nickname');
    const chkId = document.getElementById('chk_id');
    const inputs = [Id, Username, Pw, PwRe, Nickname];

    // input에 focus 계속 유지
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

    // 유효성 검사
    form.addEventListener('submit', function (event) {
      event.preventDefault();

      if (Id.value.trim() === '') {
        alert('이메일을 입력해 주세요.');
        Id.focus();
        return;
      }
      if (Username.value.trim() === '') {
        alert('이름을 입력해 주세요.');
        Username.focus();
        return;
      }
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
      if (Pw.value !== PwRe.value) {
        alert('비밀번호가 일치하지 않습니다. 다시 확인해 주세요.');
        PwRe.focus();
        return;
      }
      if (Nickname.value.trim() === '') {
        alert('별명을 입력해 주세요.');
        Nickname.focus();
        return;
      }
      //
      const password = Pw.value.trim();
      const regex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).+$/;
      if (!regex.test(password)) {
        alert('비밀번호는 특수문자 + 숫자 + 문자의 조합으로 입력해주세요.');
        Pw.focus();
        return;
      }

      if (!chkId.checked) {
        alert('가입 필수 정보 위임에 동의해 주세요.');
        chkId.focus();
        return;
      }

      form.submit();
    });
  });
</script>  
</body>
</html>