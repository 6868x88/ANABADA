 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("UserId");
session.removeAttribute("Nickname");
session.removeAttribute("Idx");

session.invalidate();

response.sendRedirect("../tradeListPage.do?category=7");
%>