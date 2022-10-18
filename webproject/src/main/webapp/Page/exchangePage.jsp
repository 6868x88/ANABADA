<%@page import="board.report.ReportDTO"%>
<%@page import="board.report.ReportDAO"%>
<%@page import="board.exchange.ExchangeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="board.comment.CommentDTO"%>
<%@ page import="board.comment.CommentDAO"%>
<%@ include file="../Page/Header.jsp"%>

<%
CommentDAO dao = new CommentDAO(application);
int title_num = Integer.parseInt(request.getParameter("exc_num"));
List<CommentDTO> commentList = dao.select_exc_comm_List(title_num);
dao.close();

String session_nick = (String) session.getAttribute("Nickname");

if (session_nick == null) {
	session_nick = "null";
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="./css/style-jieun.css">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
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

<script>
	//댓글달기 버튼 클릭시 스크롤 이동
	button.addEventListener('click',
			function() {
				const scrollPosition = document
						.querySelector(this.dataset.target).offsetTop;

				window.scrollTo({
					top : scrollPosition,
					behavior : 'smooth'
				})
			});
</script>


<script>
	//TOP 스크롤
	$(window).scroll(function() {
		if ($(this).scrollTop() > 300) {
			$('.btn_gotop').show();
		} else {
			$('.btn_gotop').hide();
		}
	});
	$('.btn_gotop').click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 400);

		return false;
	});
</script>

<title>교환 물품 상세보기</title>
</head>

<body>

	<div style="margin: 2% 10%;">
		<a href="" class="a link">HOME</a> > <a
			href="/webproject/Page/exchangeListPage.do" class="a link">교환</a> >
		물품 상세보기
	</div>


	<!--상단-->
	<div class="detail top">

		<div class="img details"
			style="text-align: center; background-image: url('${dto.user_picture}');"></div>

		<div style="float: left;">
			<ul>
				<li class="li-tradePage detail high">${dto.exc_title }</li>
				<li class="li-tradePage detail high title">
					<table style="width: 100%; font-size: 13pt;">
						<tr>
							<td class="detail-table">· 상품 상태</td>
							<td>${condition }</td>
						</tr>
						<tr>
							<td class="detail-table">· 차액 흥정 여부</td>
							<td>${diff }</td>
						</tr>
						<tr>
							<td class="detail-table">· 작성자</td>
							<td>${dto.nickname }</td>
						</tr>
					</table>
				</li>
				<li class="li-tradePage detail high btn"><a href="#"
					data-toggle="modal" data-target="#moaModal1" title="신고하기"
					class="button btnNormal" style="color: #bebebe;"> <img
						src="./img/siren.png" style="width: 20px;"> &nbsp; 신고하기
				</a> <a href="#comment" title="댓글달기" class="button btnFade btnOrange">댓글달기</a>
				</li>

				<li>
					<!-- 글 수정/삭제 (본인일 때만 버튼 활성화) -->
					<div style="bottom: 0;">
						<c:set var="session_nick" value="<%=session_nick%>" />
						<c:choose>
							<c:when test="${session_nick eq writenickname }">
								<form method="post" name="deleteFrm"
									action="./SellEditDelete/excDeleteProcess.jsp">
									<input type="hidden" value="${dto.exc_num }" name="excNum">
									<button class="chat-btn btnFade btnRed" type="submit">글
										삭제</button>
								</form>
								<form method="post" name="editFrm" action="./excEdit.jsp">
									<input type="hidden" value="${dto.exc_num }" name="excNum">
									<button class="chat-btn btnFade btnOrange" type="submit">글
										수정</button>
								</form>
							</c:when>

							<c:when test="${sessionScope.UserId eq 'admin' }">
								<form method="post" name="deleteFrm"
									action="./SellEditDelete/excDeleteProcess.jsp">
									<input type="hidden" value="${dto.exc_num }" name="excNum">
									<button class="chat-btn btnFade btnRed" type="submit">글
										삭제</button>
								</form>

							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</div>

				</li>
			</ul>

		</div>



	</div>

	<!--내용-->
	<div style="margin: 0 12%; overflow: hidden;">
		<hr>
		<div class="content">
			<ul>
				♥ &nbsp; ${dto.nickname } &nbsp; 님께서 교환 희망하는 물품이에요.
				<hr>

				<li class="li-tradePage content li">${dto.exc_wish }</li>

			</ul>
		</div>
		<div class="content">
			<ul>
				상품정보
				<hr>
				<li class="li-tradePage content li">${dto.exc_contents }</li>
			</ul>
		</div>




	</div>



	<!--하단(댓글)-->
   <div style="margin: 12%;">

      <hr>
      <div class="comment" id="comment">
         <h3>
            <b>댓글</b>
         </h3>
         <br>
         <div class="comment-box">
            <form name="commentFrm" method="post"
               action="./CommentProcess/writeCommentProcess.jsp">
               <input type="hidden" name="titleNum" value="${dto.exc_num}">
               <input type="text" placeholder="댓글을 입력해주세요." class="comment-text"
                  name="content">
               <button class="comment-btn" type="submit">등록</button>
            </form>
         </div>

         <ul style="margin: 15px; display: flex; flex-direction: column;">
            <%
            for (int i = 0; i < commentList.size(); i++) {
            %>
            <li>
               <div class="dropup">
                  <div>
                     <ul style="float: left; width: 90%;">
                        <li class="comment-li"><%=commentList.get(i).getNickname()%></li>
                        <li class="comment-li"><%=commentList.get(i).getComm()%></li>
                        <li class="comment-li edit"><%=commentList.get(i).getComm_date()%></li>
                        <li class="comment-li edit">
                           <%
                           if (session_nick.equals(commentList.get(i).getNickname())) {
                           %>

                           <form name="commentFrm" method="post"
                              action="./CommentProcess/deleteCommentProcess.jsp">
                              <input type="hidden" name="titleNum" value="${dto.exc_num }">
                              <input type="hidden" name="comment"
                                 value=<%=commentList.get(i).getComm()%>> <input
                                 type="hidden" name="comm_num"
                                 value="<%=commentList.get(i).getComm_num()%>">
                              <button class="button btnNormal" type="submit">삭제</button>
                           </form> <%
 }
 %>
                        </li>
                     </ul>
                     <ul style="float: right;">
                        <li>
                           <button class="comment-li-more" type="button"
                              data-toggle="dropdown" id="dropdownBtn">
                              <img src="./img/more.svg">
                           </button>
                           
                           
                           <div class="dropdown-menu">
                              <form method="post" target="popwin" name="chatMessageFrm" action="./Chat.jsp?received_idx=<%=commentList.get(i).getIdx()%>" >
                                 <input type="hidden" name="receive_idx" value=<%= commentList.get(i).getIdx()%>>
                                 <input type="hidden" name="receive_nickname" value=<%= commentList.get(i).getNickname() %>>
                                     <button type="submit" class="dropdown-item" onClick="
                                    window.open('about:blank','popwin','width=550,height=750,resizable=no');">
                                    쪽지보내기</button>
                                 <a class="dropdown-item" href="#" data-toggle="modal"
                                    data-target="#moaModal2">신고하기</a>
                              </form>
                           </div>
                        </li>

                     </ul>
                  </div>
               </div> 
               <% 
               }
               %>
            </li>
         </ul>
      </div>
   </div>








	<!--댓글신고버튼(모달)-->
	<form name="report" method="post" action="../Page/ReportReceived.do"
		onsubmit="return commentCheck()">

		<%
		for (int i = 0; i < commentList.size(); i++) {
		%>
		<input type="hidden" value="<%=commentList.get(i).getNickname()%>"
			name="reportedNickname"> <input type="hidden"
			value="<%=commentList.get(i).getIdx()%>" name="idx"> <input
			type="hidden" value="<%=commentList.get(i).getBoard_num()%>"
			name="boardName">
		<%
		}
		%>
		<div class="modal fade" id="moaModal2" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content" style="width: 550px; height: 400px;">
					<div class="modal-header">
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
					</div>
					<div class="modal-body">
						<h4>🚨 신고하기</h4>
						<div>
							<textarea style="width: 100%; height: 100px; resize: none;"
								placeholder="신고 사유를 작성해주세요." id="commentreason" name="reason" maxlength="200"></textarea>
							<div id="commentreasonError" class="error" style="color: red;"></div>
							<hr>
						</div>
						<div style="color: #bebebe;">
							· 정상적인 게시물을 신고하는 경우 본인이 제재를 당할 수 있습니다. <br> · 신고하게 된 이유를 자세히
							써주시면 운영자의 관련 결정에 도움이 됩니다.
						</div>
						<div>
							<button type="submit" class="chat-btn btnFade btnRed">신고하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>


	<!-- 신고버튼(모달)-->
	<form name="report" method="post" action="../Page/ReportReceived.do"
		onsubmit="return reportCheck()">
		<input type="hidden" value="${dto.nickname}" name="reportedNickname">
		<input type="hidden" value="${dto.idx }" name="idx">
		<input type="hidden" value="${dto.board_num }" name="boardName">
		<div class="modal fade" id="moaModal1" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content" style="width: 550px; height: 400px;">
					<div class="modal-header">
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
					</div>
					<div class="modal-body">
						<h4>🚨 신고하기</h4>
						<div>
							<textarea style="width: 100%; height: 100px; resize: none;"
								placeholder="신고 사유를 작성해주세요." id="reason" name="reason" maxlength="200"></textarea>
							<div id="reasonError" class="error" style="color: red;"></div>
							<hr>
						</div>
						<div style="color: #bebebe;">
							· 정상적인 게시물을 신고하는 경우 본인이 제재를 당할 수 있습니다. <br> · 신고하게 된 이유를 자세히
							써주시면 운영자의 관련 결정에 도움이 됩니다.
						</div>
						<div>
							<button type="submit" class="chat-btn btnFade btnRed">신고하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>


	<!--TOP 버튼-->
	<div class="floating">
		<a href="#" class="btn_gotop" id="click"> <span
			class="glyphicon glyphicon-chevron-up"> <img
				src="./img/top-arrow-svgrepo-com.svg"
				style="width: 50px; height: 50px;">
		</span>
		</a>
	</div>


	<script>
		function reportCheck() {
			let reportReason = document.getElementById("reason").value;

			if (reportReason.length === "") {
				document.getElementById("reasonError").innerHTML = "신고 사유를 입력해주세요."
				return false;
			} else if (reportReason.length < 30) {
				document.getElementById("reasonError").innerHTML = "신고 사유가 너무 짧습니다. 최소 30자 이상으로 적어주세요."
				return false;
			} else if (reportReason.length > 200) {
				document.getElementById("reasonError").innerHTML = "200자 이내로 적어주세요."
				return false;
			} else {
				alert("신고 접수가 완료되었습니다.\n(중복된 신고는 접수되지 않습니다.)")
				document.getElementById("reasonError").innerHTML = ""
			}

		}
	</script>

	<script>
		function commentCheck() {
			let reportReason = document.getElementById("commentreason").value;

			if (reportReason.length === "") {
				document.getElementById("commentreasonError").innerHTML = "신고 사유를 입력해주세요."
				return false;
			} else if (reportReason.length < 30) {
				document.getElementById("commentreasonError").innerHTML = "신고 사유가 너무 짧습니다. 최소 30자 이상으로 적어주세요."
				return false;
			} else if (reportReason.length > 200) {
				document.getElementById("commentreasonError").innerHTML = "200자 이내로 적어주세요."
				return false;
			} else {
				alert("신고 접수가 완료되었습니다.\n(중복된 신고는 접수되지 않습니다.)")
				document.getElementById("reasonError").innerHTML = ""
			}

		}
	</script>
	<%@ include file="./HeaderFooter/Footer.jsp"%>
</body>

</html>