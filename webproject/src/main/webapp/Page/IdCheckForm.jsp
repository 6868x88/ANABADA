<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 확인</title>
<link rel="stylesheet" href="./css/Check.css">
<script src="https://kit.fontawesome.com/0377843c9b.js"
	crossorigin="anonymous"></script>

</head>
<body>

	<div style="text-align: center; margin: 10vw">
		<i class=" check_title fa-solid fa-user-check"></i>
		<h2 class="check_title">ID 중복 확인</h2>
<div>아이디는 5~15자의 <br> 영문 소문자 및 숫자만 입력해주세요.</div>
		<form name="login" method="post" action="../Page/IdcheckForm.do">

			<div class="input_style">
				<div class="btn-input">
					<input type="text" id="id" class="input_body" size=30
						maxlength="20" name="user_id" placeholder="아이디(중복 확인은 필수입니다.)" />
					<input type="submit" name="dbCheckID" id="check_button"
						class="btnSignUp" value="ID 중복 검사" />
				</div>
			</div>
		</form>
		<hr>
		<div id="idError" class="error"></div>
		<span class="check_error"> <%=request.getAttribute("Msg") == null ? "" : request.getAttribute("Msg")%></span>


		<br> <input type="hidden" id="useId" name="useId"
			value="<%=request.getParameter("user_id")%>" />

		<c:set var="str" value="<%=request.getAttribute("Msg")%>" />
		<c:if test="${fn:contains(str, '사용')}">
			<input type="button" onclick="sendCheckValue()" value="사용하기"
				class="btnSignUp" />
		</c:if>
		<hr>
		<input type="button" onclick="window.close()" value="창 닫기"
			class="btnSignUp" />
	</div>
</body>



<script type="text/javascript">
	function sendCheckValue() {

		window.name = "parentForm";
		opener.document.getElementById("id").value = document
				.getElementById("useId").value
		window.close();

	}
</script>