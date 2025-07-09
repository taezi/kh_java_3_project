<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Register.do" method="post">
		<input type="text" name="id" placeholder="아이디를 입력하세요." maxlength="16"><br>
		<input type="password" name="passwd" placeholder="암호를 입력하세요." maxlength="16"><br>
		<input type="text" name="username" placeholder="이름을 입력해주세요" maxlength="10"><br>
		<input type="text" name="nickname" placeholder="닉네임을 입력해주세요" maxlength="16"><br>
		<button>회원가입</button>
	</form>
</body>
</html>