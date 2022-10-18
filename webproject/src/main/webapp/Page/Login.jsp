
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../Page/Header.jsp"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>

</head>

<body style="margin:0;">
	<%
		request.setCharacterEncoding("UTF-8");
		String user_id = (String) session.getAttribute("UserId");
		System.out.print(user_id + "확인");

		if (user_id != null) {
			out.println("<script>alert('이미 로그인이 되어있습니다.'); location.href='tradeListPage.do?category=7';</script>");
		}
		%>
	<section style="margin: 5% 35% 5% 35%">

<hr>
		<div class="Login_form" style="font-size: 1vw">
			<h3>Login to ANABADA</h3><p></p>

			<form style="margin-top: 3vw" action="../Page/Login.do" method="post" name="loginFrm"
				onsubmit="return validateForm(this);">
				<div class="form-group">
					<input style="font-size: 1vw"  type="text" name="user_id"  required /><label>ID</label>
				</div>
				<div class="form-group">
					<input style="font-size: 1vw"  type="password" name="user_passwd" required /><label>Password</label>
					<span style="color: red; font-size: 1.2em;"> 
					<%=request.getAttribute("ErrMsg") == null ? "" : request.getAttribute("ErrMsg")%>
					</span>
				</div>
				<div class="GoSignUp">
					<input type="submit" value="Login" class="submit" id="btnLogin"
						onclick="insertReplyFunc();">
					<p>
						Not Yet Registered? <a href="../Page/SignUp1.jsp">Sign Up</a>
					</p>
				</div>
					<hr>
			</form>
		</div>
	</section>
</body>
<%@ include file="./HeaderFooter/Footer.jsp"%>

</html>