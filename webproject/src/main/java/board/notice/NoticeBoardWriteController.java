package board.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NoticeBoardWriteController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public NoticeBoardWriteController() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/Page/Noticeboard_write.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	 

	
		NoticeBoardDTO dto = new NoticeBoardDTO();
		dto.setN_title(req.getParameter("title"));
		dto.setN_content(req.getParameter("contents"));

		NoticeBoardDAO dao = new NoticeBoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();

		if (result == 1) {
			resp.sendRedirect("../Page/list.do");
		} else {
			resp.sendRedirect("../Page/NoticeBoardWrite.do");
		}
	}

}