<%@ page import="board.notice.NoticeBoardDAO"%>
<%@ page import="board.notice.NoticeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
String n_num = request.getParameter("n_num");
NoticeBoardDTO dto = new NoticeBoardDTO();
NoticeBoardDAO dao = new NoticeBoardDAO();
dto = dao.selectView(n_num);

String sessionId = session.getAttribute("UserId").toString();

int delResult=0;

if(sessionId.equals("admin")){
	delResult=dao.deletePost(dto);
	dao.close();
	

	out.println("<script>alert('삭제되었습니다.'); location.href='../list.do';</script>");
	return;
}

%>
