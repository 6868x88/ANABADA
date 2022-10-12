package utils;

public class SellBoardPage {
	public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl, int category) {
		String pagingStr ="";
		int totalPages = (int) (Math.ceil(((double)totalCount/pageSize)));
		
		int pageTemp = (((pageNum-1)/blockPage)*blockPage)+1;
		
		if(pageTemp !=1) {
			pagingStr += "<a href='"+reqUrl+"?pageNum=1&category="+category+"'> << </a>";
			pagingStr += "&nbsp;&nbsp;";
			pagingStr += "<a href='" + reqUrl +"?pageNum="+(pageTemp -1)+"&category="+category+"'> 이전 </a>";
		}
		
		int blockCount = 1;
		
		while(blockCount <= blockPage && pageTemp <= totalPages) {
			if(pageTemp == pageNum) {
				pagingStr += "&nbsp;"+pageTemp+"&nbsp;";
			}else {
				pagingStr += "&nbsp;<a href='"+reqUrl+"?pageNum="+pageTemp+"&category="+category+"'>"+pageTemp+"</a>&nbsp;";
				
			}
			pageTemp ++;
			blockCount ++;
		}
		
		if(pageTemp<=totalPages) {
			pagingStr +="<a href ='"+reqUrl+"?pageNum="+pageTemp+"&category="+category+"'> 다음 </a>";
			pagingStr += "&nbsp;&nbsp;";
			pagingStr +="<a href='"+reqUrl+"?pageNum="+totalPages+"&category="+category+"'> >> </a>";
		}
		
		
		
		return pagingStr;
	}
	
}
