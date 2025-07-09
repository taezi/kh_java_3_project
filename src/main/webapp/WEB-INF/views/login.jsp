<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login.do" method="post">
		<input type="text" name="id" placeholder="아이디를 입력해주세요." maxlength="16" />
		<input type="password" name="passwd" placeholder="암호를 입력해주세요." maxlength="16" />
		<button>로그인</button>
	</form>
</body>
</html>