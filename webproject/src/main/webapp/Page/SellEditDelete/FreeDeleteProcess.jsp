<%@ page import="board.free.FreeBoardDAO"%>
<%@ page import="board.free.FreeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
String free_num = request.getParameter("free_num");
FreeBoardDTO dto = new FreeBoardDTO();
FreeBoardDAO dao = new FreeBoardDAO();
dto = dao.selectViewEdit(free_num);


String sessionId = session.getAttribute("Nickname").toString();

int delResult=0;

if(sessionId.equals(dto.getNickname())||session.getAttribute("UserId").equals("admin")){
	//dto.setFree_num(free_num);
	delResult=dao.deletePost(dto);
	dao.close();
	
	if(delResult==1){
		out.println("<script>alert('삭제되었습니다.'); location.href='../freeListPage.do';</script>");
	}	else{
		out.println("<script>alert('삭제를 실패했습니다.'); location.href='../freeListPage.do';</script>");
	}
}	
	
else{
	out.println("<script>alert('삭제되었습니다.'); location.href='../freeListPage.do';</script>");
	return;
}

%>