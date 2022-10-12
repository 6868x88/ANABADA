<%@ page import="board.free.FreeBoardDAO"%>
<%@ page import="board.free.FreeBoardDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// 폼값 받기
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");

	// 폼값을 DTO 객체에 저장
	FreeBoardDTO dto = new FreeBoardDTO();
	dto.setFree_title(title);
	dto.setFree_contents(contents);



	// DAO 객체를 통해 DB에 DTO 저장
	FreeBoardDAO dao = new FreeBoardDAO();
//	int iResult = dao.insertWrite(dto);
	dao.close();

	%>

</body>
</html>

