<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Page/Header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ</title>
<link rel="stylesheet" href="./css/Faq_style.css">
<link rel="stylesheet" href="./css/Freeboard_style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body style="margin:0;">
	<section style="margin:0% 15% 15% 15%">

		<div>
			<p class="faq_title">고객센터</p>
		</div>
		<!-- <div class="btn-group-bar"> -->
		<!-- <button href="#" class="btn-menu btn-menu-1">FAQ</button> -->
		<!-- <button href="#" class="btn-menu btn-menu-2">공지사항</button> -->
		<!-- </div> -->
		<div class="container2">
			<div class="row">
				<form method="get">
					<table class="pull-right">
						<tr>
							<td><select class="form-control" name="searchField">
									<option value="q_title">제목</option>
									<option value="q_content">내용</option>
							</select></td>
							<td><input type="text" class="form-control"
								placeholder="검색어 입력" name="searchWord" maxlength="100"></td>
							<td><button type="submit" class="write_btn">검색</button></td>
						</tr>
					</table>
				</form>
			</div>
		</div>

		<form method="get">
			<div class="btn-mini-bar">
				<button class="btn-mini-menu" name="category" value="1"
					type="submit">TOP 10</button>
				<button class="btn-mini-menu" name="category" value="2"
					type="submit">구매/판매</button>
				<button class="btn-mini-menu" name="category" value="3"
					type="submit">거래품목</button>
				<button class="btn-mini-menu" name="category" value="4"
					type="submit">계정/인증</button>
			</div>
		</form>

		<div style="font-size: 25px"></div>
		<hr style="height: 2px; margin-bottom: 5%;">
		<c:forEach items="${ FaqLists }" var="row" varStatus="loop">
			<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="heading${row.q_num }">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapse${row.q_num }"
							aria-expanded="false" aria-controls="collaps${row.q_num }">
							<span style="color: #337A98;"><strong>Q</span>&nbsp;</strong> ${ row.q_title}
						</button>

					</h2>
					<div id="collapse${row.q_num }" class="accordion-collapse collapse"
						aria-labelledby="heading${row.q_num }"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">${row.q_content}</div>

					</div>
				</div>
			</div>
		</c:forEach>

		<hr style="height: 2px; margin-top: 5%;">

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous">
			
		</script>
		<!-- 한번에 상단으로 갈 수 있음. -->
		<a
			style="display: scroll; position: fixed; bottom: 30px; right: 30px;"
			rel="nofollow" href="#" style="font-size:2.0em"><img
			src="./img/top-arrow-svgrepo-com.svg"></a>

	</section>
	<%@ include file="./HeaderFooter/Footer.jsp"%>
</body>
</html>