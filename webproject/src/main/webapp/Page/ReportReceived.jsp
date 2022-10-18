<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>report</title>
<script src="https://kit.fontawesome.com/0377843c9b.js"
	crossorigin="anonymous"></script>

<style>
@import
	url("https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css")
	;

* {
	font-family: 'NanumBarunGothic';
}

.report {
	text-align: center;
}

.report textarea {
	width: 80%;
	height: 15vw;
	padding: 10px;
	box-sizing: border-box;
	border: solid 2px #1E90FF;
	border-radius: 5px;
	font-size: 1.5vw;
	resize: none;
}

.report button {
	width: 10vw;
	height: 3rem;
	font-size: 1.5vw;
	padding: 2px;
	margin-top: 1%;
	background-color: #b9D8E0;
	border: 2px solid #b9D8E0;
	color: #2B5566;
}

.fa-solid {
	margin-top: 2vw;
	font-size: 2vw;
	color: #2B5566;
	font-size: 2vw;
}

.error {
	color: red;
}
</style>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String) session.getAttribute("UserId");
	System.out.print(user_id + "확인");

	if (user_id == null) {
		out.println("<script>alert('로그인 후 사용해주세요.'); location.href='Login.jsp';</script>");
	}
	%>
	<div class="report">
		<hr>
		<i class="fa-solid fa-car-on"></i>
		<h1>신고하기</h1>
		*신고 사유를 구체적으로 작성해주세요. 거짓 신고는 제재를 받을 수 있습니다.

		<form name="report" method="post" action="../Page/ReportReceived.do"
			onsubmit="return reportCheck()">
			<textarea name="reason"
				placeholder="신고사유를 자세히 작성해주세요.(거짓 신고는 제재를 받을 수 있습니다.)" id="reason"></textarea>
			<div id="reasonError" class="error"></div>
			<hr>
			<button type="submit" class="next_btn" id="report"
				onclick="reportCheck()">제출하기</button>
		</form>
	</div>
</body>
</html>
<script>
	function reportCheck() {
		let reportReason = document.getElementById("reason").value;

		if (reason === "") {
			document.getElementById("reasonError").innerHTML = "신고 사유를 입력해주세요."
			return false;
		} else if (reportReason.length < 30) {
			document.getElementById("reasonError").innerHTML = "신고 사유가 너무 짧습니다. 최소 30자 이상으로 적어주세요."
			return false;
		} else if (reportReason.length > 200) {
			document.getElementById("reasonError").innerHTML = "200자 이내로 적어주세요."
			return false;
		} else {
			document.getElementById("reasonError").innerHTML = ""
		}

	}
</script>

<script type="text/javascript">
	 
	var message = '${msg}';

	var returnUrl = '${url}';

	alert(mag);

	document.location.href = url;
</script>