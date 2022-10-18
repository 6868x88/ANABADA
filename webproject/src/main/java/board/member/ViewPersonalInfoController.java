package board.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Page/PersonalInformation.do")
public class ViewPersonalInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String user_id = (String) session.getAttribute("UserId");
		 
		MemberDAO dao = new MemberDAO(); 
		MemberDTO dto = dao.PersonalInfo(user_id); 
		dao.close();

		req.setAttribute("dto", dto);
		req.getRequestDispatcher("../Page/PersonalInformation.jsp").forward(req, resp);
	}

}
