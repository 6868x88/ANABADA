<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.free.FreeBoardDAO"%>
<%@ page import="board.free.FreeBoardDTO"%>
<%@ page import="board.comment.CommentDTO"%>
<%@ page import="board.comment.CommentDAO"%>
<%@ include file="../Page/Header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>

<%
String free_num = request.getParameter("free_num");

FreeBoardDAO dao = new FreeBoardDAO();
dao.updateVisitCount(free_num);
FreeBoardDTO dto = dao.selectViewEdit(free_num);
dao.close();


CommentDAO dao2 = new CommentDAO(application);
int titlenum = Integer.parseInt(request.getParameter("free_num"));

List<CommentDTO> commentList = dao2.free_comm_List(titlenum);
dao2.close();

String session_nick = (String) session.getAttribute("Nickname");
if (session_nick == null) {
	session_nick = "null";
}
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/Freeboard_style.css">
<meta charset="UTF-8">
<title>자유게시판 보기</title>
<script>
function deletePost(){
	var confirmed = confirm("정말로 삭제하겠습니까?");
	if(confirmed){
		var form = document.writeFrm;
		form.method="post";
		form.action="../Page/SellEditDelete/FreeDeleteProcess.jsp"
		form.submit();
	}
}
</script>
</head>



<body style="margin:0;" >
<section style="margin: 0% 15% 15% 15%">
	<div>
		<p class="free_title_mini">자유게시판</p>
	</div>

	<hr style="color: #4C6D81; height: 4px; margin-bottom: 0px;">
	<form name="writeFrm">
		<input type="hidden" name="free_num" value="<%= free_num %>" />
		<div class="top_list">
			<table class="table_freeboard">
				<tr>
					<th>제목</th>
					<td><%= dto.getFree_title() %></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%= dto.getNickname() %></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><%= dto.getFree_date() %></td>
				</tr>
				<tr>
					<th>조회수</th>
					<td><%= dto.getFree_count() %></td>
				</tr>
			</table>
		</div>

		<div style="text-align: center;">
			<p class="freeboard_content"><%=dto.getFree_contents().replace("\r\n", "<br/>") %></p>
		</div>

		<hr style="margin-top: 20%; border: 1px solid #d3d3d3;">

		<div class="btn_list">
			<%
		
		 if(session.getAttribute("Nickname")!=null && session.getAttribute("Nickname").toString().equals(dto.getNickname())){
				%>
			<button class="list_move_btn" type="button"
				onclick="location.href='freeboard_edit.jsp?free_num=<%= dto.getFree_num() %>';">수정</button>
		<button class="list_move_btn" type="button" onclick="deletePost();">삭제</button>
		
		<% }
		else if(session.getAttribute("UserId").equals("admin")){
		%>
			
			<button class="list_move_btn" type="button" onclick="deletePost();">삭제</button>
			<%
		}
			%>
			<button class="list_move_btn" type="button"
				onclick="location.href='../Page/freeListPage.do' ">목록</button>
				<button class="list_move_btn" type="button"
				onclick="location.href='../Page/freeListPage.do' ">신고</button>
		</div>
	</form>

	<div style="margin-top: 20%;">
		<h4>댓글</h4>
	</div>
	<hr style="color: #4C6D81; height: 4px;">
	<form action="./CommentProcess/freeWriteCommProcess.jsp" method="post">
		<input type="hidden" name="title_num" value="<%=dto.getFree_num() %>">
		<div class="comm_line">
			
			<input type="text" class="comm_input" name="comm_contents"
				placeholder="댓글을 입력하세요.">
			<button class="list_move_btn" type="submit"
				style="font-size: 18px; margin-left: 3%; padding: 20px;">등록</button>
		</div>
	</form>
		<%
            for(int i=0; i<commentList.size(); i++){
            	%>

	<div class="comm_div_align">
		<div class="comm_list">

			<p><%=commentList.get(i).getNickname() %></p>
			<p><%=commentList.get(i).getComm() %></p>
			<p style="font-size: 12px; color: gray"><%=commentList.get(i).getComm_date() %></p>
		</div>
		<div class="dropdown">
			<button class="dropbtn">
				<span class="dropbtn_icon"><img src="./img/ios-more.svg"
					width="20px" alt="more"></span>
			</button>
			<div class="dropdown-content">
					<%
		if (session_nick.equals(commentList.get(i).getNickname()) || session.getAttribute("UserId").equals("admin")) {
			%>
				<form id="CommentFrm" name="CommentFrm" method="post"
					action="./CommentProcess/freeDeleteCommProcess.jsp">
						<input type="hidden" name="comm_num2" value=<%=commentList.get(i).getComm_num() %>>
						<input type="hidden" name="title_num2" value=<%=commentList.get(i).getTitle_num() %>>
					<div class="dropbutton"> 
						<button type="submit" style="border:0">삭제</button>

					<%
          }
          %>
						<button type="button" style="border:0">신고</button>
						</div> 
					
				</form>
			</div>

		</div>




	</div>


	<%
}
%>


	 <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
			
		</script>

</section> 
	<%@ include file="./HeaderFooter/Footer.jsp"%>

</body>

</html>

