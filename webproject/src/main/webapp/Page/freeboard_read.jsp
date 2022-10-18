<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.free.FreeBoardDAO"%>
<%@ page import="board.free.FreeBoardDTO"%>
<%@ page import="board.comment.CommentDTO"%>
<%@ page import="board.comment.CommentDAO"%>
<%@ include file="../Page/Header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>

<%
String free_num = request.getParameter("free_num");

FreeBoardDAO dao = new FreeBoardDAO();
dao.updateVisitCount(free_num);
FreeBoardDTO dto = dao.selectViewEdit(free_num);
dao.close();

CommentDAO dao2 = new CommentDAO(application);
int titlenum = Integer.parseInt(request.getParameter("free_num"));

List<CommentDTO> commentList = dao2.free_comm_List(titlenum);
dao2.close();

String session_nick = (String) session.getAttribute("Nickname");
if (session_nick == null) {
	session_nick = "null";
}
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/Freeboard_style.css">
<meta charset="UTF-8">
<title>자유게시판 보기</title>


</head>



<body style="margin: 0;">
	<section style="margin: 0% 15% 15% 15%">
		<div>
			<p class="free_title_mini">자유게시판</p>
		</div>

		<hr style="color: #4C6D81; height: 4px; margin-bottom: 0px;">
		<form name="writeFrm">
			<input type="hidden" name="free_num" value="<%=free_num%>" />
			<div class="top_list">
				<table class="table_freeboard">
					<tr>
						<th>제목</th>
						<td><%=dto.getFree_title()%></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%=dto.getNickname()%></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td><%=dto.getFree_date()%></td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><%=dto.getFree_count()%></td>
					</tr>
				</table>
			</div>

			<div style="text-align: center;">
				<p class="freeboard_content"><%=dto.getFree_contents().replace("\r\n", "<br/>")%></p>
			</div>

			<hr style="margin-top: 20%; border: 1px solid #d3d3d3;">

			<div class="btn_list">
				<%
				if (session.getAttribute("Nickname") != null && session.getAttribute("Nickname").toString().equals(dto.getNickname())) {
				%>
				<button class="list_move_btn" type="button"
					onclick="location.href='freeboard_edit.jsp?free_num=<%=dto.getFree_num()%>';">수정</button>
				<button class="list_move_btn" type="button" onclick="deletePost();">삭제</button>

				<%
				} else if (session.getAttribute("UserId").equals("admin")) {
				%>

				<button class="list_move_btn" type="button" onclick="deletePost();">삭제</button>
				<%
				}
				%>

				<button class="list_move_btn" type="button"
					onclick="location.href='../Page/freeListPage.do' ">목록</button>
				<button class="list_move_btn" type="button" data-toggle="modal"
					data-target="#moaModal1" title="신고하기">신고</button>
			</div>
		</form>

		<div style="margin-top: 20%;">
			<h4>댓글</h4>
		</div>
		<hr style="color: #4C6D81; height: 4px;">
		<form action="./CommentProcess/freeWriteCommProcess.jsp" method="post">
			<div class="comm_line">
				<input type="hidden" name="title_num" value="<%=dto.getFree_num()%>">

				<input type="text" class="comm_input" name="comm_contents"
					placeholder="댓글을 입력하세요.">
				<button class="list_move_btn" type="submit"
					style="font-size: 18px; margin-left: 3%; padding: 20px;">등록</button>
			</div>
		</form>
		<%
		for (int i = 0; i < commentList.size(); i++) {
		%>

		<div class="comm_div_align">
			<div class="comm_list">

				<p>작성자 : <span style="color:blue;"><%=commentList.get(i).getNickname()%></span></p>
				<p><%=commentList.get(i).getComm()%></p>
				<p style="font-size: 12px; color: gray"><%=commentList.get(i).getComm_date()%></p>
			</div>
			<div class="dropdown">
				<button class="dropbtn">
					<span class="dropbtn_icon"><img src="./img/ios-more.svg"
						width="20px" alt="more"></span>
				</button>
				<div class="dropdown-content">
					<%
					if (session_nick.equals(commentList.get(i).getNickname()) || session.getAttribute("UserId").equals("admin")) {
					%>
					<form id="CommentFrm" name="CommentFrm" method="post"
						action="./CommentProcess/freeDeleteCommProcess.jsp">

						<input type="hidden" name="comm_num2"
							value=<%=commentList.get(i).getComm_num()%>> <input
							type="hidden" name="title_num2"
							value=<%=commentList.get(i).getTitle_num()%>>
						<div class="dropbutton">
							<button type="submit" style="border: 0">삭제</button>

							<%
							}
							%>
							<button type="button" style="border: 0" data-toggle="modal"
								data-target="#moaModal2" class="chat-btn btnFade btnRed">신고</button>
						</div>

					</form>
				</div>

			</div>



		</div>


		<%
}
%>
		<form name="report" method="post" action="../Page/ReportReceived.do"
			onsubmit="return reportCheck()">

			<input type="hidden" value="<%=dto.getNickname()%>"
				name="reportedNickname"> <input type="hidden"
				value="<%=dto.getIdx()%>" name="idx"> <input type="hidden"
				value="<%=dto.getBoard_num()%>" name="boardName">
			<div class="modal fade" id="moaModal1" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content" style="width: 550px; height: 400px;">
						<div class="modal-header">
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
						</div>
						<div class="modal-body">
							<h4>🚨 신고하기</h4>
							<div>
								<textarea style="width: 100%; height: 100px; resize: none;" maxlength="200"
									placeholder="신고 사유를 작성해주세요." name="reason" id="reason"></textarea>
								<hr>
							</div>
							<div style="color: #bebebe;">
								· 정상적인 게시물을 신고하는 경우 본인이 제재를 당할 수 있습니다. <br> · 신고하게 된 이유를
								자세히 써주시면 운영자의 관련 결정에 도움이 됩니다.
								<div id="reasonError" class="error" style="color: red"></div>
							</div>
							<div class="reportBtn">
								<button type="submit">신고하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>

		<form name="report" method="post" action="../Page/ReportReceived.do"
			onsubmit="return reportCheck1()">

			<%
			for (int i = 0; i < commentList.size(); i++) {
			%>
			<input type="hidden" value="<%=commentList.get(i).getNickname()%>"
				name="reportedNickname"> <input type="hidden"
				value="<%=commentList.get(i).getIdx()%>" name="idx">
				<input type="hidden"
				value="<%=commentList.get(i).getBoard_num()%>" name="boardName">
			<%
			}
			%>
			<div class="modal fade" id="moaModal2" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content" style="width: 550px; height: 400px;">
						<div class="modal-header">
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
						</div>
						<div class="modal-body">
							<h4>🚨 신고하기</h4>
							<div>
								<textarea style="width: 100%; height: 100px; resize: none;" maxlength="200"
									placeholder="신고 사유를 작성해주세요." name="reason" id="reason1"></textarea>
								<hr>
							</div>
							<div style="color: #bebebe;">
								· 정상적인 게시물을 신고하는 경우 본인이 제재를 당할 수 있습니다. <br> · 신고하게 된 이유를
								자세히 써주시면 운영자의 관련 결정에 도움이 됩니다.
								<div id="reason1Error" class="error" style="color: red"></div>
							</div>
							<div>
								<button type="submit">신고하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>


		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous">
			
		</script>

		<script>
			function deletePost() {
				var confirmed = confirm("정말로 삭제하겠습니까?");
				if (confirmed) {
					var form = document.writeFrm;
					form.method = "post";
					form.action = "../Page/SellEditDelete/FreeDeleteProcess.jsp"
					form.submit();
				}
			}
		</script>
		<script>
			function reportCheck() {
				let reportReason = document.getElementById("reason").value;

				if (reportReason.length === "") {
					document.getElementById("reasonError").innerHTML = "신고 사유를 입력해주세요."
					return false;
				} else if (reportReason.length < 30) {
					document.getElementById("reasonError").innerHTML = "신고 사유가 너무 짧습니다. 최소 30자 이상으로 적어주세요."
					return false;
				} else if (reportReason.length > 200) {
					document.getElementById("reasonError").innerHTML = "200자 이내로 적어주세요."
					return false;
				} else {
					alert("신고 접수가 완료되었습니다.\n(중복된 신고는 접수되지 않습니다.)")
					document.getElementById("reasonError").innerHTML = ""
				}

			}
		</script>
		<script>
			function reportCheck1() {
				let reportReason1 = document.getElementById("reason1").value;

				if (reportReason1.length === "") {
					document.getElementById("reason1Error").innerHTML = "신고 사유를 입력해주세요."
					return false;
				} else if (reportReason1.length < 30) {
					document.getElementById("reason1Error").innerHTML = "신고 사유가 너무 짧습니다. 최소 30자 이상으로 적어주세요."
					return false;
				} else if (reportReason1.length > 200) {
					document.getElementById("reason1Error").innerHTML = "200자 이내로 적어주세요."
					return false;
				} else {
					alert("신고 접수가 완료되었습니다.\n(중복된 신고는 접수되지 않습니다.)")
					document.getElementById("reason1Error").innerHTML = ""
				}

			}
		</script>


	</section>
	<%@ include file="./HeaderFooter/Footer.jsp"%>

</body>

</html>

