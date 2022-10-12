<%@ page import="board.free.FreeBoardDAO"%>
<%@ page import="board.free.FreeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String title = request.getParameter("title");
    String contents = request.getParameter("contents");
    
    
    FreeBoardDTO dto = new FreeBoardDTO();
    dto.setFree_num(Integer.parseInt(request.getParameter("free_num").toString()));
    dto.setFree_title(title);
    dto.setFree_contents(contents);
    
    FreeBoardDAO dao = new FreeBoardDAO();
    int affected = dao.updateEdit(dto);
    dao.close();
    
    if(affected == 1){
		out.println("<script>alert('수정되었습니다.'); location.href='../freeListPage.do';</script>");
    }

%>
