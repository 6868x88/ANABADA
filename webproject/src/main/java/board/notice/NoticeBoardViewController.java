package board.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/notice/NoticeView.do")
public class NoticeBoardViewController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public NoticeBoardViewController() {
		super();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	NoticeBoardDAO dao = new NoticeBoardDAO();
	String n_num = req.getParameter("n_num");
	dao.updateVisitCount(n_num);
	NoticeBoardDTO dto = dao.selectView(n_num);
	dao.close();
	
	
//	dto.setN_content(dto.getN_content().replaceAll("\r\n", "<br/>"));
	
	req.setAttribute("dto", dto);
	req.getRequestDispatcher("/Page/NoticeBoard_read.jsp").forward(req, resp);
	}


	

}
