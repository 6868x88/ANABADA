package board.free;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FreeBoardWriteController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public FreeBoardWriteController() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/Page/freeboard_write.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		FreeBoardDTO dto = new FreeBoardDTO();
		dto.setIdx((int) session.getAttribute("Idx"));
		dto.setFree_title(req.getParameter("title"));
		dto.setFree_contents(req.getParameter("contents"));
		dto.setNickname((String) session.getAttribute("Nickname"));

		FreeBoardDAO dao = new FreeBoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();

		if (result == 1) {
			resp.sendRedirect("../Page/freeListPage.do");
		} else {
			resp.sendRedirect("../Page/FreeBoardWrite.do");
		}
	}

}