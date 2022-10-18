package board.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.report.ReportDAO;
import board.report.ReportDTO;

@WebServlet("/Page/Header.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		resp.setContentType("text/html; charset=UTF-8");

		HttpSession session = req.getSession();
		String UserId = req.getParameter("user_id");
		String userPwd = req.getParameter("user_passwd");

		MemberDAO dao = new MemberDAO();
		MemberDTO memberDTO = dao.getMemberDTO(UserId, userPwd);
		int report = memberDTO.getReport();
		dao.close();

		// 정지된 회원이면 로그인 불가
		if (report == 1) {
			session.invalidate();
			req.getRequestDispatcher("report.jsp").forward(req, resp);
			System.out.println("정지된 회원입니다.");
		} else if (memberDTO.getUser_id() != null) {
			// 로그인 성공
			session.setAttribute("UserId", memberDTO.getUser_id());
			session.setAttribute("Idx", memberDTO.getIdx());
			session.setAttribute("Nickname", memberDTO.getNickname());
			resp.sendRedirect("tradeListPage.do?category=7");
		} else {
			// 로그인 실패
			req.setAttribute("ErrMsg", "아이디/비밀번호가 틀립니다. 다시 확인해주세요.");
			req.getRequestDispatcher("Login.jsp").forward(req, resp);

		}

	}
}
