<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../Page/Header.jsp"%>

<%
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
<link rel="stylesheet" href="/youjin/style.css">

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



<title>거래 물품 상세보기</title>
</head>

<body style="margin: 0;">



	<div style="margin: 2% 10%;">
		<a href="" class="a link">HOME</a> > <a
			href="./tradeListPage.do?category=7" class="a link">거래</a> > 물품 상세보기
	</div>

	
	
	
	<c:set var="session_nick" value="<%=session_nick%>" />
	
	<!--상단-->
	<div class="detail top">
		<div class="img details"
			style="text-align: center; background-image: url('${dto.user_picture}');"></div>

		<div style="float: left;">
			<ul>
				<li class="li-tradePage detail high">${dto.sell_title }</li>
				<li class="li-tradePage detail high title">
					<table style="width: 100%; font-size: 13pt;">
						<tr>
							<td class="detail-table">· 상품 상태</td>
							<td>${condition }</td>
						</tr>
						<tr>
							<td class="detail-table">· 카테고리</td>
							<td>${category }</td>
						</tr>
						<tr>
							<td class="detail-table">· 작성자</td>
							<td>${dto.nickname }</td>
						</tr>
						<tr>
							<td class="detail-table">· 가격</td>
							<td style="color: #337A98;" id="money">${price }원</td>
						</tr>
					</table>
				</li>
				
				<li class="li-tradePage detail high btn">
				
				<a href="#"
					data-toggle="modal" data-target="#moaModal1" title="신고하기"
					class="button btnNormal" style="color: #bebebe;"> <img
						src="./img/siren.png" style="width: 20px;"> &nbsp; 신고하기
				</a> 
				
				<script>
					function openWin() {
						window.open('about:blank', 'popwin',
								'width=550,height=750,resizable=no');
						document.chatMessageFrm.submit();
					}
				</script>
				<c:set var="session_nick" value="<%=session_nick%>" />
			<c:choose>
				<c:when test="${session_nick ne writenickname }">
					<form action="./Chat.jsp?receive_idx=${dto.idx}" method="post" name="chatMessageFrm" target="popwin">
						<input type="hidden" name="receive_nickname" value="${dto.nickname}">
						<input type="hidden" name="receive_idx" value="${dto.idx}">
						<button type="submit" class="chat-btn btnFade btnRed" onClick="openWin()">쪽지보내기</button>
					</form>
					</c:when>
					</c:choose>
				
					</li>
			</ul>
		</div>
	</div>

	<!--내용-->
	<div style="margin: 0 12% 12% 12%; overflow: hidden;">
		<hr>
		<div class="content" style="width: 100%;">
			<ul>
				상품정보
				<hr>
				<li class="li-tradePage content li">${dto.sell_contents}</li>
			</ul>
		</div>


		<!-- 글 수정/삭제 -->
		<div>
			
			<c:choose>
				<c:when test="${session_nick eq writenickname }">
					<form method="post" name="deleteFrm"
						action="./SellEditDelete/sellDeleteProcess.jsp">
						<input type="hidden" value="${dto.sell_num }" name="sellNum">
						<button class="chat-btn btnFade btnRed" type="submit">글
							삭제</button>
					</form>
					<form method="post" name="editFrm" action="./sellEdit.jsp">
						<input type="hidden" value="${dto.sell_num }" name="sellNum">
						<button class="chat-btn btnFade btnOrange" type="submit">글
							수정</button>
					</form>
				</c:when>
					<c:when test="${sessionScope.UserId eq 'admin' }">
					<form method="post" name="deleteFrm"
						action="./SellEditDelete/sellDeleteProcess.jsp">
						<input type="hidden" value="${dto.sell_num }" name="sellNum">
						<button class="chat-btn btnFade btnRed" type="submit">글
							삭제</button>
					</form>

				</c:when>
			</c:choose>

		</div>
	</div>

	<!--신고버튼(모달)-->
	<form name="report" method="post" action="../Page/ReportReceived.do" onsubmit="return reportCheck()">
		<input type="hidden" value="${dto.idx }" name="idx">
		<input type="hidden" value="${dto.board_num }" name="boardName">
		<input type="hidden" value="${dto.nickname }" name="reportedNickname">
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
								<div id="reasonError" class="error" style="color:red;"></div>
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
	<%@ include file="./HeaderFooter/Footer.jsp"%>
</body>

</html>