<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	/* Google Fonts (Noto Sans KR 예시) */
	/* header.jsp와 main.jsp에서 이미 로드하고 있다면 중복해서 로드할 필요 없습니다. */
	/* 만약 이 footer.jsp가 단독으로 사용되는 경우가 있다면 아래 주석 해제하여 사용하세요. */
	/*
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
	*/

	.footer_container{
		width: 100%;
		height: 100px;
		box-sizing: border-box;
		font-family: 'Noto Sans KR', sans-serif;
		padding: 10px 20px; 
		display: flex; 
		justify-content: center; 
		align-items: center; 
		flex-direction: column; 
		text-align: center; 
	}

	.footer-content {
		line-height: 1.5; /* 줄 간격 조정 */
		font-size: 16px; /* 폰트 크기 조정 */
	}
	
</style>
<nav>
  <div class="footer_container">
    <div class="footer-content">
      KH무비 | 사업자등록번호 : 487-86-00000 |
      사업자등록번호 : 851-87-00000 | 서울 강남 제2025-000호 |
      대표자 : 한지훈 | DB관리자 : 안승현 |
      게시판관리자 : 석정현 | 회원관리자 : 신서혜<br>
      담당자 : 서울특별시 영등포구 신우성로 57 이레빌딩(구관) 19F, 20F<br>
      Copyright © 1998-2025 KH Movie All Right Reserved
    </div>
  </div>
</nav>