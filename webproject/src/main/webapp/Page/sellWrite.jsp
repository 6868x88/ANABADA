<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../Page/Header.jsp"%>
<%@ page import = "utils.JSFunction" %>
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

if (user_id == null) {
   out.println("<script>alert('로그인 후 사용주세요.'); location.href='tradeListPage.do?category=7';</script>");
   return;
}
%>

	<section class="sale">
		<h2>판매글 작성하기</h2>
		<p class="RequiredInput">* 필수항목</p>
		<hr>

		<form name="SellBoard" method="post" enctype="multipart/form-data" action="../Page/sellWriteProcess.jsp">
			<span class="RequiredInput">* </span>제목 <br> 
			<input type="text"
				name="title" maxlength=50 size="30vw" placeholder="제목을 입력해주세요."
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
					type="radio" name="sell_condition" required> <label
					for="select" value="used">중고</label> <input type="radio" name="sell_condition"
					name="shop" value="new"><label for="select2">새상품</label>



			</div>
			<hr>

			<span class="RequiredInput">* </span><label for="sell_price">가격</label><br>
			<input type="number" name="sell_price" placeholder="0" maxlength="10"
				oninput="maxLengthCheck(this)" style="text-align: right;">원
			<hr>
			<script>
				function maxLengthCheck(object) {
					if (object.value.length > object.maxLength) {
						object.value = object.value.slice(0, object.maxLength);
					}
				}
			</script>



			<span class="RequiredInput">* </span><span>카테고리 선택 &nbsp;</span><br>

			<select class="sell_category" id="sell_category" name="category"
				onchange="selectBox(this.value)">
				<option value="sell_choose">카테고리 선택</option>
				<option value="sell_category0">패션/잡화/뷰티</option>
				<option value="sell_category1">테크/가전</option>
				<option value="sell_category2">홈/리빙</option>
				<option value="sell_category3">베이비/키즈</option>
				<option value="sell_category4">반려동물</option>
				<option value="sell_category5">게임/취미(문화)</option>
				<option value="sell_category6">기타</option>
			</select>


			<script>
				
			</script>

			<hr>
			<p class="formfield">
				<span class="RequiredInput">* </span><label for="sell_description">상품설명</label><br>
				<textarea class="sell_description" 
					name="contents" maxlength=1000
					placeholder="상품에 대한 내용을 자세하게 설명해주세요.&#13;&#10;(가품 및 판매 금지 물품은 게시가 제한 될 수 있어요.)"
					required></textarea>
			</p>
			<hr>


			<input type='submit' value='작성 완료' class="btn submitBtn">

		</form>
	</section>
    
	<%@ include file="./HeaderFooter/Footer.jsp"%>

</body>