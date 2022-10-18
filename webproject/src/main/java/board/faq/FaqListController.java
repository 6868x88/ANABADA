package board.faq;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.notice.NoticeBoardDAO;
import board.notice.NoticeBoardDTO;
import utils.BoardPage;

public class FaqListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FaqListController() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FaqDAO dao = new FaqDAO();

		Map<String, Object> map = new HashMap<String, Object>();

		String category = req.getParameter("category");
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");

		if (searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		int totalCount = dao.selectCount(map);

		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);

		if (category == null || category.equals("")) {
			category = "1";
		}
		String category_title = req.getParameter("category");
		if (category_title == null || category_title.equals("")) {
			category_title = "1";
		}

		map.put("category", category);

		List<FaqDTO> FaqLists = dao.selectListPage(map);
		dao.close();

		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../Page/faqListPage.do");

		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);

		req.setAttribute("FaqLists", FaqLists);

		req.setAttribute("map", map);
		req.getRequestDispatcher("../Page/faqPage.jsp").forward(req, resp);
	}

}
