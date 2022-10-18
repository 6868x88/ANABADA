package board.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Page/MembershipSuspension.do")
public class MembershipSuspension extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String user_id = req.getParameter("user_id");

		MemberDAO dao = new MemberDAO();
		int result = dao.MembershipSuspension(user_id);
		dao.close();

		if (result == 1) {
			req.getRequestDispatcher("MemberManagement.do").forward(req, resp);
		} else { 
			req.getRequestDispatcher("MemberManagement.do").forward(req, resp);
			System.out.println("회원 정지 실패");
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
