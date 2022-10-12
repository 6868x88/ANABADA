<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="board.exchange.ExchangeBoardDAO"%>
<%@ page import="board.exchange.ExchangeBoardDTO"%>
<%@ include file="./Header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="./css/HeaderFooter.css">
<link rel="stylesheet" type="text/css" href="./css/SellBoard.css">
<script src="https://kit.fontawesome.com/e4982ae3c4.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
<title>SellBoard</title>
</head>

<body style="margin:0;">
 <%
 String user_id = (String) session.getAttribute("UserId");
String nickname = (String) session.getAttribute("Nickname");

String num = request.getParameter("excNum");
ExchangeBoardDAO dao= new ExchangeBoardDAO();
ExchangeBoardDTO dto = dao.selectView(num);
dto.setExc_contents(dto.getExc_contents().replaceAll("<br/>", "\r\n"));
dao.close();

if (!nickname.equals(dto.getNickname())) {
out.println("<script>alert('본인만 수정가능합니다.'); location.href='./exchangeListPage.do';</script>");
   return;
}

%>

	<section class="sale">
		<h2>교환글 수정하기</h2>
		<p class="RequiredInput">* 필수항목</p>
		<hr>

		<form name="ExchangeBoard" method="post" enctype="multipart/form-data" action="../Page/SellEditDelete/excEditProcess.jsp">
			<input type="hidden" name="WriteNickname" value="<%= dto.getNickname() %>">
		<input type="hidden" name="exc_num" value="<%= dto.getExc_num() %>">
		
			<span class="RequiredInput">* </span>제목 <br> <input type="text"
				name="exc_title" maxlength=50 size="30vw" value="<%= dto.getExc_title() %>"
				required>
				<br>

			<hr>


			<span class="RequiredInput">* </span><span>사진등록</span><br>

			<div class="sell_pic">
				<div class="main-wrapper">
					<div class="img-upload-plugin">
						<div class="img-upload-handler">
							<div class="img-preview-big">
								<img
									src="https://uploader-assets.s3.ap-south-1.amazonaws.com/codepen-default-placeholder.png">
								<div class="img-delete">
									<img
										src="https://uploader-assets.s3.ap-south-1.amazonaws.com/codepen-delete-icon.png">
								</div>
							</div>
						</div>
						<div class="img-preview-operate">
							<div class="img-holder"
								style="display: inline-block; padding: 5px;"></div>
						</div>
						<input type="file" name="img-upload-input"
							style="padding-bottom: 2rem" required>
					</div>
				</div>

				<p class="pic_explane">
					* 상품 이미지는 640x640에 최적화 되어 있습니다.<br> - 이미지는 상품 등록 시 정사각형으로 잘려서
					등록됩니다.<br> - 이미지를 클릭할 경우 원본 이미지를 확인할 수 있습니다.<br> - 이미지를
					클릭 후 이동하여 등록순서를 변경할 수 있습니다.<br> - 큰 이미지일 경우 이미지가 깨지는 경우가 발생할 수
					있습니다.
				</p>
				<hr>
			</div>

			<script>
				var initWidth = $(".img-preview-big")[0].offsetWidth;
				$(".img-preview-big").css("height", initWidth + "px");

				window.onresize = function(event) {
					var initWidth = $(".img-preview-big")[0].offsetWidth;
					$(".img-preview-big").css("height", initWidth + "px");
				};

				$(".img-upload-handler").on('mouseenter mouseleave',
						'.img-preview-big', function(ev) {
							var mouse_is_inside = ev.type === 'mouseenter';
							if ($(".img-preview-small").length > 0) {
								if (mouse_is_inside) {
									$(".img-delete").css("display", "flex");
								} else {
									$(".img-delete").css("display", "none");
								}
							} else {
								$(".img-delete").css("display", "none");
							}
						});

				$("input[type='file']")
						.change(
								function() {
									var input = $("input[type='file']")[0];
									if (input.files && input.files[0]) {
										var reader = new FileReader();
										reader.onload = function(e) {
											$(".img-preview-big img")[0].src = e.target.result;
											$(".img-preview-small img")
													.each(
															function() {
																$(this)
																		.removeClass(
																				"img-small-selected");
															})
											var newImg = '<div class="img-preview-small">'
													+ '<img src="' + e.target.result + '" class="img-small-selected">'
													+ '</div>';
											$(".img-holder").append(newImg);
											var left = $('.img-preview-operate')
													.width();
											$('.img-preview-operate')
													.scrollLeft(left);
										}
										reader.readAsDataURL(input.files[0]);
									}

								});

				$(".img-preview-small").hover(function() {
					console.log("Deepak");
				}, function() {
					console.log("Chandwani");
				})

				$(document)
						.on(
								'mouseenter mouseleave',
								'.img-preview-small img',
								function(ev) {
									var mouse_is_inside = ev.type === 'mouseenter';
									if (mouse_is_inside) {
										$(this)[0].classList
												.add("img-small-active");
									} else {
										if (!$(this)[0].classList
												.contains("img-small-selected"))
											;
										$(this)[0].classList
												.remove("img-small-active");
									}
								});

				$(document).on('click', '.img-preview-small img', function(ev) {
					$(".img-preview-small img").each(function() {
						$(this).removeClass("img-small-selected");
					})
					$(this).addClass("img-small-selected");
					$(".img-preview-big img")[0].src = $(this)[0].src;
				});

				$(".img-delete")
						.click(
								function() {
									$(".img-small-selected")[0].parentElement
											.remove();
									if ($(".img-preview-small").length > 0) {
										$(".img-preview-small img")[0].classList
												.add("img-small-selected");
										$(".img-preview-big img")[0].src = $(".img-preview-small img")[0].src;
										$('.img-preview-operate').scrollLeft(0);
									} else {
										$(".img-preview-big img")[0].src = "https://uploader-assets.s3.ap-south-1.amazonaws.com/codepen-default-placeholder.png";
										$(".img-delete").css("display", "none");
									}
								})
			</script>



			<div class="sell_select_state">
				<span class="RequiredInput">* </span><span>상품상태</span><br> <input
					type="radio" name="exc_condition" required> <label
					for="select" value="used">중고</label> <input type="radio" name="exc_condition"
					name="shop" value="new"><label for="select2">새상품</label>



			</div>
			<hr>

			<div class="sell_select_state">
				<span class="RequiredInput">* </span><span>차액 흥정 여부</span><br> <input
					type="radio" name="exc_diff" required> <label
					for="select" value="yes">가능</label> <input type="radio" name="exc_diff"
					name="shop" value="no"><label for="select2">불가능</label>



			</div>
			<hr>

		<label for="sell_price">교환 희망 물품</label><br>
			<input type="text" name="exc_wish"
				 style="width:80%;" value="<%= dto.getExc_wish() %>"> 
			<hr>
			


	

			<hr>
			<p class="formfield">
				<span class="RequiredInput">* </span><label for="sell_description">상품설명</label><br>
				<textarea class="sell_description" 
					name="exc_contents" maxlength=1000
					required><%= dto.getExc_contents() %></textarea>
			</p>
			<hr>


			<input type='submit' value='작성 완료' class="btn submitBtn">

		</form>
	</section>

	<%@ include file="./HeaderFooter/Footer.jsp"%>

</body>