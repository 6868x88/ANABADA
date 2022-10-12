<%@page import="board.message.MessageDTO"%>
<%@page import="board.message.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String nickname = (String) session.getAttribute("Nickname");
int idx = (int)session.getAttribute("Idx");
String content = request.getParameter("content");
int receiveIdx = Integer.parseInt(request.getParameter("receive_idx"));
String receiveNickname = request.getParameter("receive_nickname");

MessageDTO dto = new MessageDTO();
dto.setSend_idx(idx);
dto.setSend_nickname(nickname);
dto.setM_content(content);
dto.setReceive_idx(receiveIdx);
dto.setReceive_nickname(receiveNickname);

MessageDAO dao = new MessageDAO(application);
int result = dao.sendMessage(dto);
dao.close();

if (nickname == null) {
out.println("<script>alert('로그인 후 사용주세요.'); location.href='exchangeListPage.do';</script>");
   return;
}

if(result == 1){
	response.sendRedirect("./chatMessageView.jsp?send_idx="+receiveIdx);
}
%>