<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board.comment.CommentDTO"%>
<%@ page import="board.comment.CommentDAO"%>
<%
request.setCharacterEncoding("UTF-8");

String content = request.getParameter("content");
String nickname = (String) session.getAttribute("Nickname");
int idx = (int)session.getAttribute("Idx");
int titleNum = Integer.parseInt(request.getParameter("titleNum"));
int board_num = 0;

CommentDTO dto = new CommentDTO();
dto.setComm(content.replace(" ","&nbsp;"));
dto.setTitle_num(titleNum);
dto.setNickname(nickname);
dto.setIdx(idx);
dto.setBoard_num(board_num);

CommentDAO dao = new CommentDAO(application);
int result = dao.commentWrite(dto);
dao.close();

if (nickname == null) {
out.println("<script>alert('로그인 후 사용주세요.'); location.href='exchangeListPage.do';</script>");
   return;
}

if(result == 1){
	response.sendRedirect("../exchangePage.do?exc_num="+titleNum);
}

%>