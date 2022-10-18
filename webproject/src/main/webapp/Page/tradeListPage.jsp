<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="./Header.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>거래 페이지</title>

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

<!-- 슬라이드 -->
<script>
	$('.carousel').carousel({
		interval : 2000
	//기본 5초
	})
</script>


<!-- TOP -->
<script>
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
		<a href="" class="a link">HOME</a> > 거래
	</div>



	<div class="slide-img">
		<div id="demo" class="carousel slide" data-ride="carousel">

			<div class="carousel-inner">
				<!-- 슬라이드 쇼 -->
				<div class="carousel-item active">
					<!--가로-->
					<picture>
					<source srcset="./img/banner1-trade.png" media="(min-width: 768px)" />
					<source srcset="./img/banner1(min)-trade.png"
						media="(min-width:400px)" />
					<img src="./img/banner1-trade.png"> </picture>
					<div class="carousel-caption d-none d-md-block"></div>
				</div>
				<div class="carousel-item">
					<picture>
					<source srcset="./img/banner2-trade.png" media="(min-width: 768px)" />
					<source srcset="./img/banner2(min)-trade.png"
						media="(min-width:400px)" />
					<img src="./img/banner2-trade.png"> </picture>
				</div>
				<div class="carousel-item">
					<picture>
					<source srcset="./img/banner3-trade.png" media="(min-width: 768px)" />
					<source srcset="./img/banner3(min)-trade.png"
						media="(min-width:400px)" />
					<img src="./img/banner3-trade.png"> </picture>
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
					<option value="sell_title">제목</option>
					<option value="sell_contents">내용</option>
				</select> <input class="search-text" type="text" name="searchWord"
					placeholder="키워드를 검색하세요."> <input type="hidden"
					name="category" value="${map.get("category") }">
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

	<!--카테고리-->
	<div style="margin-top: 5%;">
		<form method="get">
			<ul class="category">
				<li class="li-tradePage category-li">
					<button type="submit" name="category" value="7"
						style="border: none; background-color: rgb(255, 255, 255, 1);">
						<span> <img src="./img/sprout-tree-svgrepo-com.svg"
							class="icon"> <br>전체
						</span>
					</button>
				</li>

				<li class="li-tradePage category-li">
					<button type="submit" name="category" value="0"
						style="border: none; background-color: rgb(255, 255, 255, 1);">
						<span> <img src="./img/fassion.png" class="icon"> <br>패션/잡화/뷰티
						</span>
					</button>
				</li>

				<li class="li-tradePage category-li">
					<button type="submit" name="category" value="1"
						style="border: none; background-color: rgb(255, 255, 255, 1);">
						<span> <img src="./img/tech.png" class="icon"> <br>테크/가전
						</span>
					</button>
				</li>

				<li class="li-tradePage category-li">
					<button type="submit" name="category" value="2"
						style="border: none; background-color: rgb(255, 255, 255, 1);">
						<span> <img src="./img/home.png" class="icon"> <br>홈/리빙
						</span>
					</button>
				</li>

				<li class="li-tradePage category-li">
					<button type="submit" name="category" value="3"
						style="border: none; background-color: rgb(255, 255, 255, 1);">
						<span> <img src="./img/baby.png" class="icon"> <br>베이비/키즈
						</span>
					</button>
				</li>

				<li class="li-tradePage category-li">
					<button type="submit" name="category" value="4"
						style="border: none; background-color: rgb(255, 255, 255, 1);">
						<span> <img src="./img/pet.png" class="icon"> <br>반려동물
						</span>
					</button>
				</li>

				<li class="li-tradePage category-li">
					<button type="submit" name="category" value="5"
						style="border: none; background-color: rgb(255, 255, 255, 1);">
						<span> <img src="./img/game.png" class="icon"> <br>게임/취미
						</span>
					</button>
				</li>

				<li class="li-tradePage category-li">
					<button type="submit" name="category" value="6"
						style="border: none; background-color: rgb(255, 255, 255, 1);">
						<span> <img src="./img/etc.png" class="icon"> <br>기타
						</span>
					</button>
				</li>

			</ul>
		</form>
	</div>

	<div class="container-fluid">
		<h4>
			<c:out value='${category_word }' />
		</h4>
		<hr>
		<c:choose>
			<c:when test="${empty boardList}">
		등록된 게시물이 없습니다.
		</c:when>
			<c:otherwise>
				<div class="row">
					<c:forEach items="${boardList }" var="list_item" varStatus="loop">
						<div class="col-6 col-md-3">
							<div class="ex-list">
								<a
									href="/webproject/Page/sellPage.do?sell_num=${list_item.sell_num }">
									<p style="background-image: url('${list_item.user_picture}');"
										class="listimg"></p>
								</a>
								<p class="li-exchange-wish" style="text-align: center;">${list_item.sell_title }</p>
								<p class="li-exchange-wish" style="text-align: center;">

									<!-- 천 단위 표기(자바스크립트 사용) -->
									<script>
										var price = ${list_item.sell_price};

										if (price == 0) {
											document.write("무료나눔");
										} else {
											function priceToString(price) {
												return price
														.toString()
														.replace(
																/\B(?=(\d{3})+(?!\d))/g,
																',');
											}
											document.write(priceToString(price)
													+ "&nbsp;원");
										}
									</script>
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>


		<!-- 하단 -->
		<hr>
		<ul>

			<li><a href="../Page/sellWrite.jsp" title="글쓰기"
				class="button btnFade btnOrange" style="font-size: 12pt;" id="write">글쓰기</a></li>

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