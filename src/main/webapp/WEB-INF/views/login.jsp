<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>login</title>
<style>
* {
	margin: 0px;
	padding: 0px;
}

.container {
	width: 1440px;
	margin: 0 auto;
	/* border: 1px solid black;  */ /* 크기 확인용 */
}

header {
	height: 100px;
	/*  border: 1px dotted red; */ /* 영역 확인용*/
}

.bodyBox {
	display: flex;
	flex-flow: row nowrap;
}

.leftside {
	width: 245px;
	/* background-color: black; */ /* 없음으로 변경_25.07.10 */
}

.rightside {
	width: 245px;
	/* background-color: black; */ /* 없음으로 변경_25.07.10 */
}

.loginOutbox {
	display: flex;
	flex-flow: column nowrap;
	border: 2px solid #db1a1a;
	padding: 0px;
	width: 800px;
	justify-content: center;
	margin: 100px auto;
}

.loginInbox>h1 {
	color: black;
	text-align: center;
	font-weight: bold;
}

.loginInbox {
	width: 500px;
	display: flex;
	flex-flow: column nowrap;
	justify-content: center;
	margin: 50px auto;
	border: none;
	row-gap: 20px;
}

input {
	height: 60px;
	border-radius: 10px;
	border: 2px solid darkgray;
	/*  justify-items: center; */
	padding: 5px 15px;
	font-size: 20px;
}

.loginInbox>input:hover {
	color: gray;
}

input::placeholder {
	/* padding-left: 10px; */
	font-size: 20px;
	font-style: #e9e9e9;
	/*  justify-content: center; */
}

input:focus {
	border-color: #db1a1a;
	outline: none;
	/*  background-color: yellow; */ /* 커서 깜박임 보여셔 지움25.07.11*/
}

#checkbox {
	display: flex;
	box-sizing: border-box;
	text-align: center;
	gap: 10px;
	color: darkgray;
}

#chk_id {
	height: 24px;
	width: 24px;
	border-radius: 30px;
	justify-self: center;
	margin-top: 5px;
}

#checkbox>label {
	font-size: 20px;
	color: rgb(77, 77, 77);
}

.loginInbox>button {
	height: 50px;
	border-radius: 10px;
	border: #db1a1a;
}

button:hover {
	border: 5px solid orange;
}

.loginInbox>ul>li {
	display: flex;
	box-sizing: border-box;
}

#btn_login {
	background-color: #db1a1a;
	color: white;
	font-weight: bold;
	height: 68px;
	font-size: 20px;
}

ul {
	list-style-type: none;
}

.linebox {
	display: flex;
	flex-flow: row nowrap;
	align-items: center;
	gap: 10px;
	width: 100%; /* loginInbox의 전체 너비를 사용 */
	box-sizing: border-box;
}

.linebox>li:nth-child(2) {
	/*width: 60px; */
	flex-shrink: 0;
	padding: 0px 10px;
	text-align: center;
	color: gray;
	white-space: nowrap;
}

.line {
	/*width: 50%; */
	flex-grow: 1; /* 남은 공간을 동일하게 나눠 갖도록 1로 설정 */
	display: flex; /* li 내부의 hr이 flex 아이템이므로 li 자체도 flex로 */
	align-items: center; /* hr을 세로 중앙에 정렬 */
}

.line>hr { /* .linebox > li.line > hr */
	border: none; /* 기본 테두리 제거 */
	height: 1px; /* 선의 두께 지정 */
	background-color: lightgray; /* 선의 색상 지정 */
	width: 100%; /* 부모 li의 너비를 꽉 채우도록 100% */
	margin: 0; /* hr의 기본 마진 제거 */
}

#btn_naver {
	background-color: #1BC662;
	color: white;
	font-weight: bold;
	height: 68px;
	font-size: 20px;
}

.userbox>ul {
	display: flex;
	flex-flow: row nowrap;
	justify-content: space-around;
	width: 90%;
}

.userbox>ul>li>a {
	color: darkgray;
	text-decoration: none;
	white-space: nowrap; /* 텍스트가 줄바꿈되지 않도록 방지 */
}

.userbox>ul>li>a:hover {
	color: #db1a1a;
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

		<div class="bodyBox">
			<div class="leftside"></div>
			<div class="loginOutbox">
				<form action="Login.do" method="post">
					<div class="loginInbox">
						<h1>KHMOVIE</h1>
						<input id="in_id" type="text" name="id"
							placeholder="아이디(이메일)을 입력해주세요" maxlength="50" autofocus /> <input
							id="in_pw" type="password" name="passwd"
							placeholder="비밀번호를 입력해주세요." maxlength="20" />

						<div id="checkbox">
							<label for="chk_id">아이디 저장</label><input type="checkbox"
								id="chk_id">
						</div>
						<button type="submit" id="btn_login">KHLogIn</button>

						<ul class="linebox">
							<li class="line"><hr></li>
							<li>또는</li>
							<li class="line"><hr></li>
						</ul>
						<button type="button" id="btn_naver">네이버로그인</button>
						<div class="userbox">
							<ul>
								<li><a href="">아이디찾기</a></li>
								<li><a href="">비밀번호찾기</a></li>
								<li><a href="RegisterView.do">회원가입</a></li>
							</ul>
						</div>
					</div>
				</form>
			</div>
			<div class="rightside"></div>
		</div>
		<footer> </footer>
	</div>
	<script>
	document.addEventListener('DOMContentLoaded', function () {
		  const loginForm = document.querySelector('.loginOutbox form');
		  const inId = document.getElementById('in_id');
		  const inPw = document.getElementById('in_pw');
		  const chkId = document.getElementById('chk_id');

		  loginForm.addEventListener('submit', function(event) {
		    event.preventDefault();

		    if (inId.value.trim() === '') {
		      alert('이메일을 입력해 주세요.');
		      inId.focus();
		      return; 
		    }

		    if (inPw.value.trim() === '') {
		      alert('비밀번호를 입력해 주세요.');
		      inPw.focus();
		      return;
		    }

		    if (chkId.checked) {
		      const confirmed = confirm("아이디 저장을 체크하셨습니다.\n공용 PC라면 정보 노출 위험이 있습니다. 이대로 로그인 하시겠습니까?");
		      if (!confirmed) {
		        return;
		      }
		    }
		    loginForm.submit();
		  });
		});

</script>



</body>
</html>