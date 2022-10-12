package board.trade;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.SellBoardPage;

@WebServlet("/Page/tradeListPage.do")
public class SellListController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public SellListController() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		SellBoardDAO dao = new SellBoardDAO();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		String category = req.getParameter("category");
		
		if(searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		
		}
		
		int totalCount = dao.selectCount(map);
	
		
		
		//페이지 처리
		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
	
		
	
		if(pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);
		

		
		
		int start = (pageNum -1) * pageSize +1;
		int end = pageNum * pageSize;
		
		map.put("category", category);
		map.put("start", start);
		map.put("end", end);
		
		System.out.println(category+ ":카테고리- 컨트롤러");
	
		int categoryNum=Integer.parseInt(category);
		//게시물 목록 받기
		List<SellBoardDTO> boardList = dao.selectListPage(map);
		String pagingImg = 
				SellBoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum,"/webproject/Page/tradeListPage.do",categoryNum);
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		String category_word = "";
		if(category.toString().equals("0")) {
			category_word="패션/잡화/뷰티";
		}else if(category.toString().equals("1")){
			category_word="테크/가전";
		}else if(category.toString().equals("2")){
			category_word="홈/리빙";
		}else if(category.toString().equals("3")){
			category_word="베이비/키즈";
		}else if(category.toString().equals("4")){
			category_word="반려동물";
		}else if(category.toString().equals("5")){
			category_word="게임/취미";
		}else if(category.toString().equals("6")){
			category_word="기타";
		}else {
			category_word="전체";
		}
		
		//전달할 데이터를 req영역에 저장 후 포워드
		req.setAttribute("boardList", boardList);
		req.setAttribute("map", map);
		req.setAttribute("category_word", category_word);
		req.getRequestDispatcher("/Page/tradeListPage.jsp").forward(req, resp);
		
		dao.close();
		
		
	
	}
}
