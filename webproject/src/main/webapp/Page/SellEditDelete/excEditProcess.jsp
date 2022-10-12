<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="board.exchange.ExchangeBoardDAO"%>
<%@ page import="board.exchange.ExchangeBoardDTO"%>
<%

ServletContext context = request.getServletContext();
String saveFolder ="./Page/img/excWriteImg";
String realFolder = "";
int maxImgSize = 10*1024*1024;
String encoding = "UTF-8";
realFolder = context.getRealPath(saveFolder);
MultipartRequest mr = new MultipartRequest(request, realFolder, maxImgSize, encoding, new DefaultFileRenamePolicy());

String nickname = (String) session.getAttribute("Nickname");
int exc_num = Integer.parseInt(mr.getParameter("exc_num"));

String org_img = mr.getFilesystemName("img-upload-input");
String title = mr.getParameter("exc_title");
String contents = mr.getParameter("exc_contents");
String diff = mr.getParameter("exc_diff");
String condition = mr.getParameter("exc_condition");
String wish = mr.getParameter("exc_wish");

String ext = org_img.substring(org_img.lastIndexOf("."));
String now = new SimpleDateFormat("yyyyMMdd_MmsS").format(new Date());
String new_img = now+ext;

File oldFile = new File(realFolder + File.separator + org_img);
File newFile = new File(realFolder + File.separator + new_img);

oldFile.renameTo(newFile);


//상품 상태 숫자 받아오기 
int condition_num = 0;
if(condition.equals("new")){
	condition_num = 1;
}else{
	condition_num = 2;
}

int diff_num = 0;
if(diff.equals("no")){
	diff_num = 2;
}else{
	diff_num = 1;
}

ExchangeBoardDTO dto = new ExchangeBoardDTO();
dto.setExc_title(title);
dto.setExc_contents(contents.replace("\r\n", "<br/>"));
dto.setExc_condition(condition_num);
dto.setExc_diff(diff_num);
dto.setExc_wish(wish);
dto.setUser_picture("./img/excWriteImg/"+new_img);
dto.setExc_num(exc_num);

ExchangeBoardDAO dao = new ExchangeBoardDAO();
int result = dao.updateEdit(dto);
dao.close();

if(result == 1){
	out.println("<script>alert('수정되었습니다.'); location.href='../exchangeListPage.do';</script>");
	return;
}else{
	
}
%>