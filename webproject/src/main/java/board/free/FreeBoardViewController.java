package board.free;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/free/FreeBoardView.do")
public class FreeBoardViewController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public FreeBoardViewController() {
		super();
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	FreeBoardDAO dao = new FreeBoardDAO();
	String free_num = req.getParameter("free_num");
	dao.updateVisitCount(free_num);
	FreeBoardDTO dto = dao.selectViewEdit(free_num);
	dao.close();
	
	
	dto.setFree_contents(dto.getFree_contents().replaceAll("\r\n", "<br/>"));
	
	req.setAttribute("dto", dto);
	req.getRequestDispatcher("../Page/freeboard_read.jsp").forward(req, resp);
	}


	

}
