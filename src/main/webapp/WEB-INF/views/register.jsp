<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>KHMOVE Membership</title>
  <style>
  * {
    margin: 0px;
    padding: 0px;
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
    font-style: #e9e9e9;
    /* justify-content: center; */
  }
    input:focus {
    border-color:#db1a1a;
    outline: none;
  /*  background-color: yellow; */ /* 커서 깜박임 보여셔 지움25.07.11*/
  }
  #checkbox{
    display: flex;
    box-sizing: border-box;
    text-align: center;
    gap: 10px;
    color: darkgray;
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
    font-style: #e9e9e9;
  }
  .membershipInbox > button{
    height: 50px;
    border-radius: 10px;
    border: #db1a1a
  }
  #btn_membership{
    background-color: #db1a1a;
    color: white;
    font-weight: bold;
    height: 68px;
    font-size: 20px;
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
<script>

</script>
</head>
  <body>
        <header>
          <div class="move_search">
            <jsp:include page="./template/header.jsp"></jsp:include>
          </div>
        </header>

   <div class="container">

    <div class="bodyBox">
     <div class="leftside">

     </div>
     <div class="membershipOutbox">
			<form action="Register.do" method="post">
        <div class="membershipInbox">
          <h1>KHMOVIE</h1>

          <input id="in_id" type="text" name="id" placeholder="이메일을 입력하세요" maxlength="20" autofocus>
          <input id="in_username" name="username" type="text" placeholder="이름을 입력하세요" maxlength="10">
          <input id="in_pw" name="passwd" type="password" placeholder="비밀번호를 입력하세요" maxlength="20">
          <input id="in_pwre" name="passwdre" type="password" placeholder="비밀번호를 다시 입력하세요" maxlength="20">
          <input id="in_nickname" name="nickname" type="text" placeholder="별명을 입력하세요" maxlength="16">
            
          <div id="checkbox">
            <input type="checkbox" id="chk_id"><label for="chk_id">가입 필수 정보를 위임하는데 동의합니다.</label>
          </div>
           
          <button type="submit" id="btn_membership" type="button">KHLogIn</button>
           
        </div>
       	 </form>
      </div>
      <div class="rightside">

      </div>
    </div>
    <footer>

    </footer>
  </div>

  
</body>
</html>