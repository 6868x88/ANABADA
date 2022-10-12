<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../Page/Header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>교환 페이지</title>

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
	$('.carousel').carousel({
		interval : 2000
	//기본 5초
	})
</script>

<script>
	//TOP스크롤
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

<link rel="stylesheet" href="./css/style-jieun.css">
</head>

<body>





	<div style="margin-left: 10%; margin-top: 2%;">
		<a href="" class="a link">HOME</a> > 교환
	</div>



	<div class="slide-img">
		<div id="demo" class="carousel slide" data-ride="carousel">

			<div class="carousel-inner">
				<!-- 슬라이드 쇼 -->
				<div class="carousel-item active">
					<!--가로-->
					<picture>
					<source srcset="./img/banner1-exchange.png"
						media="(min-width: 768px)" />
					<source srcset="./img/banner1(mini)-exchange.png"
						media="(min-width:370px)" />
					<img src="./img/banner1-exchange.png"> </picture>
					<div class="carousel-caption d-none d-md-block"></div>
				</div>
				<div class="carousel-item">
					<picture>
					<source srcset="./img/banner2-exchange.png"
						media="(min-width: 768px)" />
					<source srcset="./img/banner2(mini)-exchange.png"
						media="(min-width:370px)" />
					<img src="./img/banner2-exchange.png"> </picture>
				</div>
				<div class="carousel-item">
					<picture>
					<source srcset="./img/banner3-exchange.png"
						media="(min-width: 768px)" />
					<source srcset="./img/banner3(mini)-exchange.png"
						media="(min-width:370px)" />
					<img src="./img/banner3-exchange.png"> </picture>
				</div>

				<!-- / 슬라이드 쇼 끝 -->

				<!-- 왼쪽 오른쪽 화살표 버튼 -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<!-- <span>Previous</span> -->
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<!-- <span>Next</span> -->
				</a>
				<!-- / 화살표 버튼 끝 -->

				<!-- 인디케이터 -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<!--0번부터시작-->

					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>
				<!-- 인디케이터 끝 -->
			</div>
		</div>
	</div>



	<!--검색창-->
	<form method="get">
		<div class="search-category">
			<div class="searchbox">
				<select name="searchField" style="border: none; margin-right: 15px;">
					<option value="exc_title">제목</option>
					<option value="exc_contents">내용</option>
				</select> <input class="search-text" type="text" name="searchWord"
					placeholder="키워드를 검색하세요.">
				<button class="search-btn" type="submit">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="#337a98" class="bi bi-search" viewBox="0 0 16 16">
          <path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
        </svg>

				</button>
			</div>
		</div>
	</form>

	<!--게시글 리스트(기능 넣으면 수정예정)-->

	<div class="container-fluid">
		<h4>교환 물품 목록</h4>
		<hr>

		<c:choose>
			<c:when test="${empty boardLists}">
		등록된 게시물이 없습니다.
	</c:when>
			<c:otherwise>
				<div class="row">
					<c:forEach items="${boardLists }" var="list_item" varStatus="loop">
						<div class="col-6 col-md-3">
							<div class="ex-list">
								<a
									href="/webproject/Page/exchangePage.do?exc_num=${list_item.exc_num }"><p
										style="background-image: url('${list_item.user_picture}');"
										class="listimg"></p></a>
								<ul>
									<li class="li-tradePage" style="color: #ff6666;">♥</li>
									<li class="li-tradePage">교환 희망 물품 :</li>
								</ul>
								<p class="li-exchange-wish">${list_item.exc_wish}</p>
								<p class="li-exchange-wish" style="text-align: center;">${list_item.exc_title }</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>


		<!-- 하단 -->
		<hr>
		<ul>
			<li><a href="../Page/exchangeWrite.jsp" title="글쓰기"
				class="button btnFade btnOrange" style="font-size: 12pt;">글쓰기</a></li>
			<li>
				<div style="text-align: center; font-size: 15pt;">${map.pagingImg }</div>
			</li>
		</ul>
		<p style="margin: 20% 0;"></p>
	</div>

	<!--TOP 버튼-->
	<div class="floating">
		<a href="#" class="btn_gotop" id="click"> <span
			class="glyphicon glyphicon-chevron-up"> <img
				src="./img/top-arrow-svgrepo-com.svg"
				style="width: 50px; height: 50px;">
		</span>
		</a>
	</div>



	<%@ include file="./HeaderFooter/Footer.jsp"%>
</body>

</html>