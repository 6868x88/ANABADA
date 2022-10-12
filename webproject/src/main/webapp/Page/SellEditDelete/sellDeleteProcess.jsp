<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.trade.SellBoardDAO"%>
<%@ page import="board.trade.SellBoardDTO"%>
<%
int sell_num = Integer.parseInt(request.getParameter("sellNum"));
String nickname = (String) session.getAttribute("Nickname");

String num = request.getParameter("sellNum");
SellBoardDAO dao = new SellBoardDAO();
SellBoardDTO dto = dao.selectView(num);

if  (session.getAttribute("UserId").equals("admin")||nickname.equals(dto.getNickname())){
	dto.setSell_num(sell_num);
	int result = dao.deletePost(dto);
	dao.close();
	if(result == 1){
		out.println("<script>alert('해당 글이 삭제되었습니다.'); location.href='../tradeListPage.do?category=7';</script>");
	}
} else if((!nickname.equals(dto.getNickname()))) {
	dao.close();
	out.println("<script>alert('본인만 삭제가능합니다.'); location.href='../tradeListPage.do?category=7';</script>");
	return;
	
}
%>