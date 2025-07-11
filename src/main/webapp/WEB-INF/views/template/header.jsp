<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	
	nav {
		height: 100px; 
		width: 100%; 
		background-color: #E9E9E9; 
		display: flex; 
		align-items: center; 
		justify-content: space-between; 
		padding: 0 40px; 
		box-sizing: border-box; 
	}


	.header-logo-link {
		
		display: flex; 
		align-items: center;
		height: 200px; 
	}

	.header-logo-link img {
		height: 100%; 
		vertical-align: middle;
	}


	
	.search-container {
		position: relative;
		width: 400px;
		height: 45px;
		
		display: flex;
		align-items: center;
		background-color: white;
		border-radius: 25px;
		border: 1px solid #ccc; 
	}
	
	


	.search-input {
		flex-grow: 1; 
		border: none; 
		outline: none; 
		font-size: 1.1em;
		padding: 0 10px; 
		z-index: 2; 
		background-color: transparent; 
		color: #333; 
	}

	/* 돋보기 아이콘  */
	.search-icon-inside {
		width: 24px; 
		height: 24px;
		margin-right: 15px; 
		cursor: pointer;
		z-index: 2;
	}


	.user-actions {
		list-style-type: none;
		margin: 0;
		padding: 0;
		display: flex; 
		gap: 25px; 
	}

	.user-actions li {
		display: flex;
		align-items: center;
	}

	.user-actions a {
		text-decoration: none; 
		color: #333; 
		font-size: 1.0em; 
		display: flex;
		align-items: center;
		white-space: nowrap; 
	}

	.user-actions a:hover {
		color: #007bff; 
	}

	/* 로그인/회원가입 아이콘 */
	.user-actions img {
		width: 36px; 
		height: 36px; 
		margin-right: 5px; 
		vertical-align: middle;
	}

	/* 로그인 상태 메시지 */
	.user-info {
		color: #555;
		font-size: 1.0em;
		white-space: nowrap; 
	}
</style>

<nav>
	<a href="Main.do" class="header-logo-link">
		<img src="${pageContext.request.contextPath}/images/kh_icon.png" alt="KH MOVIE 로고">
	</a>

	<form action="SearchView.do" method="get" class="search-form"> 
        <div class="search-container">
            <input type="text" class="search-input" placeholder="Search..." name="query"> 
            <button type="submit" style="background: none; border: none; padding: 0; cursor: pointer;">
                <img src="${pageContext.request.contextPath}/images/search_icon.png" alt="Search" class="search-icon-inside">
            </button>
        </div>
    </form>


	<ul class="user-actions">
		<c:if test="${sessionScope.user == null }">
			<li>
				<a href="LoginView.do">
					<img src="${pageContext.request.contextPath}/images/login_icon.png" alt="로그인 아이콘"> 로그인
				</a>
			</li>
			<li>
				<a href="RegisterView.do">
					<img src="${pageContext.request.contextPath}/images/register_icon.png" alt="회원가입 아이콘"> 회원가입
				</a>
			</li>
		</c:if>
		<c:if test="${sessionScope.user != null  && sessionScope.user.usersid != 'admin'}">
			<li>
				<a href="BoardWriteView.do">
					<img src="${pageContext.request.contextPath}/images/write_icon.png" alt="글쓰기 아이콘">글쓰기
				</a>
			</li>
			<li class="user-info">${sessionScope.user.nickName }님이 로그인하셨습니다.</li>
			<li>
				<a href="Logout.do">
					<img src="${pageContext.request.contextPath}/images/logout_icon.png" alt="로그아웃 아이콘">로그아웃
				</a>
			</li>
		</c:if>
		<c:if test="${sessionScope.user != null  && sessionScope.user.usersid == 'admin'}">
			<li>
				<a href="BoardWriteView.do">
					<img src="${pageContext.request.contextPath}/images/write_icon.png" alt="글쓰기 아이콘">글쓰기
				</a>
			</li>
			<li>
				<a href="Admin.do">
					<img src="${pageContext.request.contextPath}/images/admin_icon.png" alt="관리자 아이콘">관리자페이지
				</a>
			</li>
			<li class="user-info">${sessionScope.user.nickName }님이 로그인하셨습니다.</li>
			<li>
				<a href="Logout.do">
					<img src="${pageContext.request.contextPath}/images/logout_icon.png" alt="로그아웃 아이콘">로그아웃
				</a>
			</li>
		</c:if>
	</ul>
</nav>