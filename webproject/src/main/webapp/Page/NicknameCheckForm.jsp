<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복 확인</title>
<link rel="stylesheet" href="./css/Check.css">
<script src="https://kit.fontawesome.com/0377843c9b.js"
	crossorigin="anonymous"></script>
</head>
<body>


	<div style="text-align: center; margin: 10vw">
		<i class=" check_title fa-solid fa-user-check"></i>
		<h2 class="check_title">닉네임 중복 확인</h2>
<div>닉네임은 6글자 이하로 <br> 공백 없이 한글, 영어, 숫자만 사용가능합니다.</div>
		<form name="login" method="post" action="../Page/NicknameCheckForm.do">
			<div class="input_style">
				<div class="btn-input">
					<input type="text" id="nickname" class="input_body" size=30
						maxlength="20" name="nickname" placeholder="별명(중복 확인은 필수입니다.)" />
					<input type="submit" id="check_button" class="btnSignUp" value="별명 중복 검사" />
				</div>
			</div>
		</form>
		<hr>
		<div id="idError" class="error"></div>
		<span class="check_error"> <%=request.getAttribute("Msg") == null ? "" : request.getAttribute("Msg")%></span>


		<br> <input type="hidden" id="useNickname" name="useNickname"
			value="<%=request.getParameter("nickname")%>" />

		<c:set var="str" value="<%=request.getAttribute("Msg")%>" />
		<c:if test="${fn:contains(str, '사용가능')}">
			<input type="button" onclick="sendCheckValue()" value="사용하기"
				class="btnSignUp"/>
		</c:if>
		<hr>
		<input type="button" onclick="window.close()" value="창 닫기"
			class="btnSignUp" />
	</div>
</body>



<script type="text/javascript">
	function sendCheckValue() {
		opener.document.getElementById("nickname").value = document
				.getElementById("useNickname").value
		window.close();
	}
</script>