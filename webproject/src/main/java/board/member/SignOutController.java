package board.member;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Page/SignOut.do")
public class SignOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		int idx = (int) session.getAttribute("Idx");
		String user_passwd = req.getParameter("user_passwd");

		MemberDAO dao = new MemberDAO();
		int result = dao.SignOut(idx, user_passwd);
		dao.close();

		if (result == 1) {
			session.invalidate();
			resp.sendRedirect("tradeListPage.do?category=7");
			System.out.println("탈퇴 성공");
		} else { 
			req.setAttribute("ErrMsg", "비밀번호가 다릅니다.");
			req.getRequestDispatcher("SignOut.jsp").forward(req, resp);
			System.out.println("탈퇴 실패");
		}

	}

}
