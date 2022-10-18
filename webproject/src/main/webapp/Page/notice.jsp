<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Page/Header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>공지사항</title>
</head>
<body style="margin: 0;">
	<section style="margin: 0% 15% 15% 15%">

		<div>
			<p class="free_title">공지사항</p>
		</div>
		<div class="container2">
			<div class="row">
				<form method="get">
					<table class="pull-right">
						<tr>
							<td><select class="form-control" name="searchField">
									<option value="n_title">제목</option>
									<option value="n_content">내용</option>
							</select></td>
							<td><input type="text" class="form-control"
								placeholder="검색어 입력" name="searchWord" maxlength="100"></td>
							<td><button type="submit" class="btn write_btn">검색</button></td>
						</tr>
					</table>
				</form>
			</div>
		</div>

		</div>
		<table class="table table-hover">
			<tr align="center" style="background-color: #4C6D81;">
				<th>번호</th>
				<th style="width:60%">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:choose>
				<c:when test="${empty boardLists}">
					<tr>
						<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${ boardLists }" var="row" varStatus="loop">
						<tr align="center">
							<td>${ map.totalCount - (((map.pageNum-1)*map.pageSize)+loop.index) }
							</td>
							<td align="center"><a
								href="../Page/NoticeView.do?n_num=${ row.n_num }">${ row.n_title }</a></td>
							<td>운영자</td>
							<td>${row.n_date}</td>
							<td>${row.n_count}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

		<%	
		if(session.getAttribute("UserId")==null){
		%>
		<%
		}else if (session.getAttribute("UserId").equals("admin")){
		%>			
		<button class="list_move_btn"
				onclick="location.href='../Page/NoticeBoardWrite.do' ">글 쓰기</button>
		<%
		}
		%>
		<!-- 글쓰기 버튼을 누르면 해당 jsp 파일로 연결 -->
		<div class="container2">
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
				crossorigin="anonymous">
				
			</script>
		</div>

		<div class="paging">${ map.pagingImg }</div>
	</section>
	<%@ include file="./HeaderFooter/Footer.jsp"%>
</body>
</html>