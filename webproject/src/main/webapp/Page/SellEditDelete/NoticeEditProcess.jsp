<%@ page import="board.notice.NoticeBoardDAO"%>
<%@ page import="board.notice.NoticeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String title = request.getParameter("title");
    String contents = request.getParameter("contents");
    
    
    NoticeBoardDTO dto = new NoticeBoardDTO();
    dto.setN_num(Integer.parseInt(request.getParameter("n_num").toString()));
    dto.setN_title(title);
    dto.setN_content(contents);
    
    NoticeBoardDAO dao = new NoticeBoardDAO();
    int affected = dao.updateEdit(dto);
    dao.close();
    
    if(affected == 1){
		out.println("<script>alert('수정되었습니다.'); location.href='../list.do';</script>");
    }

%>
