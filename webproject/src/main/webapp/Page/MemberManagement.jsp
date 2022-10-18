
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="board.report.ReportDAO"%>
<%@ page import="board.report.ReportDTO"%>
<%@ page import="board.member.MemberDAO"%>
<%@ page import="board.member.MemberDTO"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 관리 페이지</title>
<link rel="stylesheet" type="text/css" href="./css/HeaderFooter.css">
<%@ include file="../Page/Header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
.viewAllMember {
	padding: 5% 10% 5% 10%;
}

table {
	width: 100%;
	border: 1px solid #444444;
}

th, td {
	border: 1px solid #444444;
	height: 2rem;
	text-align: center;
	font-size: 1.1rem
}

tr:hover {
	background-color: #b6adad;
	color: black;
}

caption {
	padding-top: 3rem;
	padding-bottom: 1rem;
}

.form_btn {
	display: flex;
	justify-content: center;
}

.form_btn button {
	margin-left: 0.5rem;
}

.title_user {
	background: #2980b9;
	color: #ffffff;
}

.title_user th {
	height: 3.7rem;
}

.title_report {
	background: #ea6153;
	color: #ffffff;
	height: 6px;
}

.title_report th {
	height: 3.7rem;
}

.total {
	font-size: 1.5rem;
}

#clickMember, #clickReport {
	padding-top: 2.5rem;
	padding-bottom: 2.5rem;
	font-size: 1.5rem;
}

button {
	font-size: 1.3rem;
	background-color: #b9D8E0;
	color: #2B5566;
	border: 2px solid #b9D8E0;
}

button:hover {
	color: #2B5566;
	background-color: #b9D8E0;
	color: #fffff;
}

.form-control, input {
	height: 1.5rem;
}
</style>
</head>
<body style="margin: 0;">
	<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String) session.getAttribute("UserId");
	System.out.print(user_id + "확인");

	if (user_id == null) {
		out.println("<script>alert('로그인 후 사용해주세요.'); location.href='Login.jsp';</script>");
	}
	%>

	<section class="viewAllMember">
		<h1 style="text-align: center; font-size: 2vw;">관리자 회원 관리</h1>
		<hr>
		<h2>전체 회원 테이블</h2>
		<form method="get">
			<tr>
				<td><select class="form-control" name="searchField">
						<option value="report">회원 상태</option>
						<option value="user_id">회원 아이디</option>
						<option value="name">회원 이름</option>
						<option value="nickname">회원 닉네임</option>
						<option value="email">회원 메일</option>
						<option value="phone_num">회원 전화번호</option>
				</select></td>
				<td><input type="text" class="form-control"
					placeholder="검색어 입력" name="searchWord" maxlength="100"></td>
				<td><button type="submit">검색</button></td>
			</tr>
		</form>

		<div style="width: 100%; height: 500px; overflow: auto">
			<table id="memberTable">
				<caption class="total">총 회원 수: ${fn:length(memberList)} 명</caption>
				<p>* 상태 1은 정지된 회원, 0은 정상회원을 뜻합니다.</p>
				<tr class="title_user">
					<th>상태</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>이름</th>
					<th>비밀번호</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>받은 신고 수</th>
				</tr>
				<c:choose>
					<c:when test="${ empty memberList }">
						<tr>
							<td colspan="7" align="center">가입한 회원이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${memberList}" var="row" varStatus="loop">
							<c:choose>
								<c:when test="${row.report ne 0}">
									<tr style="color: red">
										<td><c:out value="${row.report }" /></td>
										<td><c:out value="${row.user_id }" /></td>
										<td><c:out value="${row.nickname}" /></td>
										<td><c:out value="${row.name}" /></td>
										<td><c:out value="${row.user_passwd}" /></td>
										<td><c:out value="${row.email}" /></td>
										<td><c:out value="${row.phone_num}" /></td>
										<td><c:out value="${row.countReport }" /></td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td><c:out value="${row.report }" /></td>
										<td><c:out value="${row.user_id }" /></td>
										<td><c:out value="${row.nickname}" /></td>
										<td><c:out value="${row.name}" /></td>
										<td><c:out value="${row.user_passwd}" /></td>
										<td><c:out value="${row.email}" /></td>
										<td><c:out value="${row.phone_num}" /></td>
										<td><c:out value="${row.countReport}" /></td>
									</tr>
								</c:otherwise>
							</c:choose>

						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			<br>
		</div>
		<div id="clickMember">* 회원을 선택해주세요.</div>

		<div class="form_btn">
			<form name="MembershipSuspension" method="get"
				action="../Page/MembershipSuspension.do" onsubmit="return check1()">
				<input type="hidden" name=user_id id="user_id1" value="" />
				<button type="submit" id='btn1'>회원 정지 하기</button>
			</form>

			<form name="liftOff" method="get" action="../Page/liftOff.do"
				onsubmit="return check2()">
				<input type="hidden" name=user_id id="user_id2" value="" />
				<button type="submit" id='btn2'>회원 정지 해제 하기</button>
			</form>

			<form name="ManageSignOut" method="get"
				action="../Page/ManageSignOut.do" onsubmit="return check3()">
				<input type="hidden" name=user_id id="user_id3" value="" />
				<button type="submit">회원 탈퇴 처리 하기</button>
			</form>
		</div>
		<hr>
		<h2>신고 테이블</h2>
		<form method="get">
			<tr>
				<td><select class="form-control" name="reportSearchField">
						<option value="boardName">신고 게시판</option>
						<option value="reportedNickname">피신고자 닉네임</option>
						<option value="reporterNickname">신고자 닉네임</option>
						<option value="reason">신고 사유</option>
						<option value="reportDate">신고 날짜</option>
				</select></td>
				<td><input type="text" class="form-control"
					placeholder="검색어 입력" name="reportSearchWord" maxlength="100"></td>
				<td><button type="submit">검색</button></td>
					<p>* 게시판은 교환, 거래, 판매 게시판으로 나누어져 있습니다.</p>
			</tr>
		</form>

		<div style="width: 100%; height: 300px; overflow: auto">
			<table id="reportTable">
				<caption class="total">총 신고 수: ${fn:length(reportList)} 회</caption>
				<tr class="title_report">
					<th>신고 위치</th>
					<th>피신고자</th>
					<th>신고자</th>
					<th style="width:50%;">신고 사유</th>
					<th>신고 날짜</th>
					<th>누적 신고 번호</th>

				</tr>
				<c:choose>
					<c:when test="${ empty reportList }">
						<tr>
							<td colspan="7" align="center">신고 내역이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${reportList}" var="row" varStatus="loop">
							<tr>
								<td><c:out value="${row.boardName }" /></td>
								<td><c:out value="${row.reportedNickname }" /></td>
								<td><c:out value="${row.reporterNickname }" /></td>
								<td><c:out value="${row.reason }" /></td>
								<td><c:out value="${row.reportDate }" /></td>
								<td><c:out value="${row.countReport }" /></td>
							</tr>

						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<div id="clickReport">* 신고내역을 선택해주세요.</div>

		<form name="deleteReport" method="get"
			action="../Page/deleteReport.do" onsubmit="return check6()">
			<input type="hidden" name=reportedNickname id="reportedNickname"
				value="" /> <input type="hidden" name=reporterNickname
				id="reporterNickname" value="" /> <input type="hidden" name=reason
				id="reason" value="" />
			<button type="submit" id='btn6'>신고내역 삭제하기</button>
		</form>
		<hr>

	</section>
</body>
<%@ include file="./HeaderFooter/Footer.jsp"%>
</html>

<script>
	//테이블의 Row 클릭시 값 가져오기
	$("#memberTable tr").click(
			function() {
				var str = ""
				var tdArr = new Array();
				var user_id1 = document.getElementById("user_id1").value;
				var user_id2 = document.getElementById("user_id2").value;
				var user_id3 = document.getElementById("user_id3").value;

				// 현재 클릭된 Row(<tr>)
				var tr = $(this);
				var td = tr.children();

				// td.eq(index)를 통해 값가져오기
				var state = td.eq(0).text();
				var user_id = td.eq(1).text();
				var name = td.eq(2).text();
				var nickname = td.eq(3).text();
				var email = td.eq(5).text();
				var phone_num = td.eq(6).text();
				var reportCount = td.eq(7).text();

				if (state == 1) {
					btn1.style.display = 'none';
					btn2.style.display = 'block';
				} else {
					btn1.style.display = 'block';
					btn2.style.display = 'none';
				}

				str += " *선택한 회원 : 상태 : <font color='blue'>" + state
						+ "</font>" + ", 아이디 : <font color='blue'>" + user_id
						+ "</font>" + ", 이름 : <font color='blue'>" + name
						+ "</font>" + ", 닉네임 : <font color='blue'>" + nickname
						+ "</font>" + ", 이메일 : <font color='blue'>" + email
						+ "</font>" + ", 전화번호 : <font color='blue'>"
						+ phone_num + "</font>"
						+ ", 받은 신고 수: <font color='blue'>" + reportCount
						+ "</font>";

				$("#clickMember").html(str);

				document.getElementById("user_id1").value = user_id;
				document.getElementById("user_id2").value = user_id;
				document.getElementById("user_id3").value = user_id;
			});

	function check1() {

		if (user_id1.value == "") {
			alert("회원을 먼저 선택해주세요.")
			return false;
		} else {
			var confirm_check = confirm("'"
					+ user_id1.value
					+ "'님을'회원 정지' 상태로 바꾸시겠습니까? \n회원 정지 상태가 되면 로그인이 불가한 계정으로 바뀝니다.");

			if (!confirm_check) {
				return false;
			}
		}
	}

	function check2() {

		if (user_id2.value == "") {
			alert("회원을 먼저 선택해주세요.")
			return false;
		} else {
			var confirm_check = confirm("'"
					+ user_id1.value
					+ "'님을 '정상 회원' 상태로 바꾸시겠습니까?\n회원 상태가 정상으로 되어도 신고 내역은 그대로 남아있습니다.\n(받은 신고 내역을 삭제하기 원한다면 '받은 신고 사유'-> '신고 내역 삭제')");

			if (!confirm_check) {
				return false;
			}
		}
	}

	function check3() {
		if (user_id3.value == "") {
			alert("회원을 먼저 선택해주세요.")
			return false;
		} else {
			var confirm_check = confirm("'"
					+ user_id3.value
					+ "'님 을 탈퇴처리 하시겠습니까? \n확인을 누르면 계정이 삭제되며 기존의 작성한 게시글, 댓글 등 모든 정보가 삭제됩니다.");

			if (!confirm_check) {
				return false;
			}
		}
	}
</script>


<script>
	$("#reportTable tr")
			.click(
					function() {
						var str = ""
						var tdArr = new Array();
						var reportedNickname = document
								.getElementById("reportedNickname").value;
						var reporterNickname = document
								.getElementById("reporterNickname").value;
						var reason = document.getElementById("reason").value;

						var tr = $(this);
						var td = tr.children();

						var boardName = td.eq(0).text();
						var reportedNickname = td.eq(1).text();
						var reporterNickname = td.eq(2).text();
						var reason = td.eq(3).text();
						var reportDate = td.eq(4).text();
						var reportCount = td.eq(5).text();

						str += " *선택한 회원 : 신고 게시판 : <font color='blue'>"
								+ boardName + "</font>"
								+ ", 피신고자 : <font color='blue'>"
								+ reportedNickname + "</font>"
								+ ", 신고자 : <font color='blue'>"
								+ reporterNickname + "</font>"
								+ ", 신고사유 : <font color='blue'>" + reason
								+ "</font>" + ", 신고 날짜: <font color='blue'>"
								+ reportDate + "</font>"
								+ ", 누적 신고 번호: <font color='blue'>"
								+ reportCount + "</font>";

						$("#clickReport").html(str);

						document.getElementById("reportedNickname").value = reportedNickname;
						document.getElementById("reporterNickname").value = reporterNickname;
						document.getElementById("reason").value = reason;
					});

	function check6() {
		if (reportedNickname.value == "") {
			alert("삭제할 내역을 먼저 눌러주세요.")
			return false;
		} else {
			var confirm_check = confirm("선택하신 '" + reporterNickname.value
					+ "'님이 신고한 '" + reportedNickname.value
					+ "'님의 신고내역을 삭제하시겠습니까?\n이는 회원 정지 유무에 영향을 미칠 수 있습니다.");

			if (!confirm_check) {
				return false;
			}
		}
	}
</script>



