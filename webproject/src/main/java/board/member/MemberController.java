package board.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.trade.SellBoardDAO;

@WebServlet("/Page/SignUp2.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/Page/signUp2.jsp");
		rd.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");

		MemberDTO dto = new MemberDTO();
		
		dto.setName(req.getParameter("name"));
		dto.setNickname(req.getParameter("nickname"));
		dto.setUser_id(req.getParameter("user_id"));
		dto.setUser_passwd(req.getParameter("user_passwd"));
		dto.setEmail(req.getParameter("email"));
		dto.setPhone_num(req.getParameter("phone_num"));

		System.out.println(req.getParameter("name"));
		System.out.println(req.getParameter("nickname"));
		System.out.println(req.getParameter("user_id"));
		System.out.println(req.getParameter("user_passwd"));
		System.out.println(req.getParameter("email"));
		System.out.println(req.getParameter("phone_num"));

		MemberDAO dao = new MemberDAO();

		int signUpResult = dao.signUp(dto);
		dao.close();

		if (signUpResult == 1) {
			resp.sendRedirect("SignUp3.jsp");
			System.out.println("회원가입 성공");
		} else {
			resp.sendRedirect("SignUp2.jsp");
			System.out.println("회원가입 실패");
		}
	}

}
