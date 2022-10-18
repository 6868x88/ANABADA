<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정지된 회원입니다.</title>
<link rel="stylesheet" type="text/css" href="./css/HeaderFooter.css">
<%@ include file="../Page/Header.jsp"%>
<script src="https://kit.fontawesome.com/0377843c9b.js"
	crossorigin="anonymous"></script>
</head>
<%
request.setCharacterEncoding("UTF-8");
String user_id = (String) session.getAttribute("UserId");
System.out.print(user_id + "확인");

if (user_id != null) {
	out.println("<script>alert('잘못된 접근입니다'); location.href='Login.jsp';</script>");
}
%>
<body>

	<div
		style="margin: 5% 25% 5% 25%; line-height: 2rem; text-align: center">
		<div style="font-size: 2rem">
			<span class="fa-solid fa-ban" style="color: red"></span> <span>정지된
				계정입니다.</span><hr>
		</div>
		<div style="font-size: 1rem">
		일정 기준 이상의 신고 수 누적 혹은 규칙 위반으로 계정이 정지되었습니다.<br> 계정이 비활성화 되었으므로 로그인할 수 없습니다.<br>
		이용제한 사유 조회 및 해제 혹은 계정 탈퇴 진행을 요청하고 싶으시다면 아래로 문의 주세요. <br>
		<hr></div> <span
			class="fa-solid fa-envelope"></span> : songsunkite@gmail.com<br>
		<span class="fa-solid fa-phone-volume"></i> : 031-0000-0000 
	</div>
</body>
<%@ include file="./HeaderFooter/Footer.jsp"%>
</html>