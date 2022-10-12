<%@page import="board.message.MessageDAO"%>
<%@page import="board.message.MessageDTO"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String send_nickname = request.getParameter("send_nickname");
int sendidx = Integer.parseInt(request.getParameter("send_idx"));

int receiveidx = (int)session.getAttribute("Idx");

MessageDAO dao = new MessageDAO(application);
List<MessageDTO> MessageList = dao.select_Message(sendidx, receiveidx);
List<MessageDTO> sendList = dao.send_Message(sendidx, receiveidx);

dao.close();

%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=550px;">
<!--부트스트랩-->
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

<link rel="stylesheet" href="../css/style-jieun.css">

<title>쪽지창</title>
</head>

<body style="background-image: url('../img/background.png');">
    <div class="chat who"> 부적절한 대화는 제재 당할 수 있습니다.   </div>
	<!--채팅창-->
	<div class="chat-display">
		<!--자신의 채팅-->

		<ul>
			<%
				for (int i = 0; i < MessageList.size(); i++) {
					if(receiveidx != MessageList.get(i).getReceive_idx()){
				%>
			<li class="Message my" style="float:right;">
			<%= MessageList.get(i).getM_content() %>
			</li>
			<%}
				else{ %>
				<li class="Message you"><%= MessageList.get(i).getM_content() %></li>
				<%}%>
			<%} %>
		
			
		

		</ul>

	</div>


<!--채팅 입력-->
	<form name="messageFrm" method="post"
		action="./reMessage.jsp">
		<div class="chat input">
			<input type="text" class="input-chatbox" placeholder="최대 500자" name="content">
			<input type="hidden" value="<%= sendidx %>" name="receive_idx"> 
			<input type="hidden" value="<%= send_nickname %>" name="receive_nickname">
			<button type="submit" class="chat-btn btnFade btnOrange"
				style="margin: 0;">보내기</button>
		</div>
	</form>



</body>

</html>