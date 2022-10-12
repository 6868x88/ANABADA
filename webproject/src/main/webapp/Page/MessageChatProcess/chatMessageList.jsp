<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.message.MessageDTO"%>
<%@page import="board.message.MessageDAO"%>
<%@ page import="java.util.*"%>
<%
String user_id = (String) session.getAttribute("UserId");
if (user_id == null) {
	   out.println("<script>alert('로그인 후 사용주세요.'); window.close();</script>");
	   return;
	} 
MessageDAO dao = new MessageDAO(application);
int idx = (int) session.getAttribute("Idx");
List<MessageDTO> messageList = dao.myListMessage(idx);

int send_idx1;
dao.close();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/chatMessageCss.css">
<title>받은 쪽지함</title>
</head>

<body style="background-image: url('../img/background.png');">
	<span class="message-title">
		<h3>📩 쪽지함</h3>
	</span>

	<div>
		<table class="message-table">
			<thead>
				<tr>
					<th style="width: 30%;">보낸 사람</th>
					<th>쪽지 내용</th>

				</tr>
			</thead>
		</table>




		<form method="post" target="popwin" name="chatMessageFrm">
			<div class="message-tbody">
				<table class="message-table">
					<tbody>
						<%
						for (int i = 0; i < messageList.size(); i++) {
						%>
						<input type="hidden" value=<%=messageList.get(i).getSend_idx()%>
							name="send_idx">
						<input type="hidden"
							value=<%=messageList.get(i).getSend_nickname()%>
							name="send_nickname">
						<tr>
							<td><%=messageList.get(i).getSend_nickname()%> <%=messageList.get(i).getSend_idx()%></td>
							<td><a href="#"
								onClick="
								window.open('about:blank','popwin','width=550,height=750,resizable=no');
								document.chatMessageFrm.action='./chatMessageView.jsp?send_idx=<%=messageList.get(i).getSend_idx()%>';
							 document.chatMessageFrm.submit();">
							 <%=messageList.get(i).getM_content()%></a></td>

						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</form>

	</div>
</body>

</html>