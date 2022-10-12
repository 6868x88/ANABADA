<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.trade.SellBoardDAO"%>
<%@ page import="board.trade.SellBoardDTO"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.io.File" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
request.setCharacterEncoding("UTF-8");

String user_id = (String) session.getAttribute("UserId");
String nickname = (String) session.getAttribute("Nickname");
int idx = (int) session.getAttribute("Idx");

if (user_id == null) {
out.println("<script>alert('로그인 후 사용주세요.'); location.href='tradeListPage.do';</script>");
   return;
}

//이미지 파일 저장
ServletContext context = request.getServletContext();
String saveFolder ="./Page/img/sellWriteImg";
String realFolder = "";
int maxImgSize = 10*1024*1024;
String encoding = "UTF-8";
realFolder = context.getRealPath(saveFolder);

MultipartRequest mr = new MultipartRequest(request, realFolder, maxImgSize, encoding, new DefaultFileRenamePolicy());



String org_img = mr.getFilesystemName("img-upload-input");
String title = mr.getParameter("title");
String contents = mr.getParameter("contents");
String category = mr.getParameter("category");
String condition = mr.getParameter("sell_condition");
int price = Integer.parseInt(mr.getParameter("sell_price"));

String ext = org_img.substring(org_img.lastIndexOf("."));
String now = new SimpleDateFormat("yyyyMMdd_MmsS").format(new Date());
String new_img = now+ext;

File oldFile = new File(realFolder + File.separator + org_img);
File newFile = new File(realFolder + File.separator + new_img);

oldFile.renameTo(newFile);

//카테고리 숫자 받아오기 - 반복문(아스키코드 변환)
int category_num = 6;

for(int i=48; i<55; i++){
	if(category.charAt(13) == i){
				category_num = i-48;
	}
};

//상품 상태 숫자 받아오기 
int condition_num = 0;
if(condition.equals("new")){
	condition_num = 1;
}else{
	condition_num = 2;
}

SellBoardDTO dto = new SellBoardDTO();
dto.setSell_title(title);
dto.setSell_contents(contents.replace("\r\n", "<br/>"));
dto.setSell_category(category_num);
dto.setSell_price(price);
dto.setSell_condition(condition_num);
dto.setUser_picture("./img/sellWriteImg/"+new_img);
dto.setNickname(nickname);
dto.setIdx(idx);

SellBoardDAO dao = new SellBoardDAO();
int result = dao.insertWrite(dto);
dao.close();

if(result == 1 ){
response.sendRedirect("../Page/tradeListPage.do?category=7");
}else {
	response.sendRedirect("../Page/tradeListPage.do?category=7");
}

%>
    