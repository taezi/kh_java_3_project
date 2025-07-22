<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<style>
    /* .container, .main_container 등 전체적인 레이아웃 스타일 추가 (기존 스타일에서 일부 누락된 부분 채워넣음) */
   	* {
	margin: 0;
	padding: 0;
	box-sizing: border-box; 
	font-family: 'Noto Sans KR', sans-serif; /* 페이지 전체에 Noto Sans KR 적용 */
	
	}
    .container {
        display: flex;
        justify-content: center;
        align-items: flex-start; /* 상단 정렬 */
        width: 100%;
        min-height: 720px; /* 최소 높이 설정 */
        padding: 60px 0;
    }

    .main_container {
        width: 60%;
        background-color: #f8f8f8; /* 밝은 배경색 예시 */
        padding: 40px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        align-items: center; /* 중앙 정렬 */
    }

    .main_container h1 {
        font-size: 2.5em;
        color: #333;
        margin-bottom: 30px;
        font-family: 'Noto Sans KR', sans-serif;
    }

    .info-display {
        width: 80%;
        margin-bottom: 30px;
        text-align: center;
        padding: 15px;
        background-color: #e0e0e0;
        border-radius: 5px;
        color: #555;
        font-size: 1.1em;
    }

    .info-display p {
        margin: 5px 0;
    }

    .nickname-form {
        width: 80%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .form-group {
        width: 100%;
        margin-bottom: 20px;
        text-align: left;
    }

    .form-group label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
        color: #555;
        font-size: 1.1em;
    }

    .form-group input[type="text"] {
        width: calc(100% - 110px); /* 입력 필드 너비 조절 */
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1em;
        margin-right: 10px; /* 중복 확인 버튼과의 간격 */
        display: inline-block; /* 중복 확인 버튼과 같은 줄에 */
    }

    .form-group button {
        padding: 12px 20px;
        background-color: #4CAF50; /* 버튼 색상 */
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1em;
        transition: background-color 0.3s ease;
    }

    .form-group button:hover {
        background-color: #45a049;
    }

    .form-actions {
        width: 100%;
        text-align: center;
        margin-top: 20px;
    }

    .form-actions button {
        padding: 15px 30px;
        background-color: #db1a1a; 
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1.2em;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .form-actions button:hover {
        background-color: #0056b3;
    }

    .message {
        margin-top: 20px;
        padding: 10px;
        border-radius: 5px;
        font-weight: bold;
        text-align: center;
        word-break: keep-all; 
    }
    .success {
        background-color: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
    }
    .error {
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
    }
    .warning {
        background-color: #fff3cd;
        color: #856404;
        border: 1px solid #ffeeba;
    }
</style>
</head>
<body>
	<jsp:include page="./template/header.jsp"></jsp:include>
	<div class="container">
		<div class="left_container"></div>

		<div class="main_container">
			<h1>마이 페이지</h1>
            <h2>닉네임 수정</h2>

            
            <c:if test="${not empty sessionScope.user}">
                <div class="info-display">
                    <p><strong>아이디:</strong> ${sessionScope.user.usersid}</p>
                    <p><strong>현재 닉네임:</strong> <span id="currentNickname">${sessionScope.user.nickName}</span></p>
                </div>

               
                <form action="MyPageUpdate.do?command=updateNickname" method="post" class="nickname-form" onsubmit="return validateNicknameForm();">
                    <div class="form-group">
                        <label for="newNickname">새 닉네임:</label>
                        <input type="text" id="newNickname" name="newNickname" value="${sessionScope.user.nickName}" required>
                        <button type="button" id="checkNicknameBtn">중복 확인</button>
                        <span id="nicknameCheckResult" style="margin-left: 10px;"></span>
                    </div>
                    <div class="form-actions">
                        <button type="submit">닉네임 변경</button>
                    </div>
                </form>
            </c:if>
            <c:if test="${empty sessionScope.user}">
                 <div class="info-display">
                    <p>로그인 정보가 없습니다. 로그인이 필요합니다.</p>
                 </div>
            </c:if>

            
            <c:if test="${not empty requestScope.msg}">
                <div class="message ${requestScope.msgType eq 'success' ? 'success' : (requestScope.msgType eq 'error' ? 'error' : 'warning')}">
                    <p>${requestScope.msg}</p>
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.tempMsg}">
                 <div class="message ${sessionScope.tempMsgType eq 'success' ? 'success' : (sessionScope.tempMsgType eq 'error' ? 'error' : 'warning')}">
                    <p>${sessionScope.tempMsg}</p>
                 </div>
                 <c:remove var="tempMsg" scope="session"/>
                 <c:remove var="tempMsgType" scope="session"/>
            </c:if>

            

		</div>

		<div class="right_container"></div>
	</div>
	<jsp:include page="./template/footer.jsp"></jsp:include>

<script>
    const contextPath = "${pageContext.request.contextPath}";

    window.onload = function() {
        // user 세션이 존재할 때만 JavaScript 로직을 활성화
        <c:if test="${not empty sessionScope.user}">
            const newNicknameInput = document.getElementById('newNickname');
            const checkNicknameBtn = document.getElementById('checkNicknameBtn');
            const nicknameCheckResult = document.getElementById('nicknameCheckResult');
            let isNicknameAvailable = false;

            // 닉네임 중복 확인 버튼 클릭 이벤트
            checkNicknameBtn.addEventListener('click', function() {
                const newNickname = newNicknameInput.value.trim();

                if (newNickname === '') {
                    nicknameCheckResult.textContent = '닉네임을 입력해주세요.';
                    nicknameCheckResult.style.color = 'red';
                    isNicknameAvailable = false;
                    return;
                }

                const currentNickname = document.getElementById('currentNickname').textContent.trim();
                if (newNickname === currentNickname) {
                    nicknameCheckResult.textContent = '현재 닉네임과 동일합니다. 다른 닉네임을 입력해주세요.';
                    nicknameCheckResult.style.color = 'orange';
                    isNicknameAvailable = false;
                    return;
                }
                
                // fetch URL에 contextPath 변수 사용
                fetch(`MyPageUpdate.do?command=checkNickname&nickname=\${encodeURIComponent(newNickname)}`)
                    .then(response => {
                        if (!response.ok) {
                            return response.text().then(text => {
                                throw new Error(`HTTP error! Status: ${response.status}. Response: ${text}`);
                            });
                        }
                        return response.json();
                    })
                    .then(data => {
                        if (data.isAvailable) {
                            nicknameCheckResult.textContent = '사용 가능한 닉네임입니다.';
                            nicknameCheckResult.style.color = 'green';
                            isNicknameAvailable = true;
                        } else {
                            nicknameCheckResult.textContent = '이미 사용 중인 닉네임입니다.';
                            nicknameCheckResult.style.color = 'red';
                            isNicknameAvailable = false;
                        }
                    })
                    .catch(error => {
                        console.error('Error during nickname check:', error);
                        nicknameCheckResult.textContent = `닉네임 확인 중 오류가 발생했습니다: ${error.message}`;
                        nicknameCheckResult.style.color = 'red';
                        isNicknameAvailable = false;
                    });
            });

            // 닉네임 입력 필드가 변경될 때마다 중복 확인 상태 초기화
            newNicknameInput.addEventListener('input', function() {
                nicknameCheckResult.textContent = '';
                isNicknameAvailable = false;
            });

            // 폼 제출 시 유효성 검사
            function validateNicknameForm() {
                const newNickname = newNicknameInput.value.trim();
                const currentNickname = document.getElementById('currentNickname').textContent.trim();

                if (newNickname === '') {
                    alert('새 닉네임을 입력해주세요.');
                    return false;
                }

                if (newNickname === currentNickname) {
                    alert('현재 닉네임과 동일합니다. 다른 닉네임을 입력해주세요.');
                    return false;
                }

                if (!isNicknameAvailable) {
                    alert('닉네임 중복 확인을 해주세요.');
                    return false;
                }

                return true;
            }

            window.validateNicknameForm = validateNicknameForm;
        </c:if>
        <c:if test="${empty sessionScope.user}">
           
            console.log("User not logged in. Nickname update features are disabled.");
            
            const nicknameForm = document.querySelector('.nickname-form');
            if (nicknameForm) {
                nicknameForm.querySelectorAll('input, button').forEach(el => el.disabled = true);
            }
        </c:if>
    };
</script>
</body>
</html>