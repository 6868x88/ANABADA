package board.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Page/IdcheckForm.do")
public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		resp.setContentType("text/html; charset=UTF-8");

		String user_id = req.getParameter("user_id");

		MemberDAO dao = new MemberDAO();
		boolean result = dao.IDCheck(user_id);
		dao.close();

		String idvalcheck = "^[a-z0-9]+$";
		boolean id_check = Pattern.matches(idvalcheck, user_id);

		if (user_id == "") {
			req.setAttribute("Msg", "아이디를 입력해주세요.");
			req.getRequestDispatcher("IdCheckForm.jsp").forward(req, resp);
		} else if (user_id.length() < 5 || user_id.length() > 15) {
			req.setAttribute("Msg", "5~15자의 영문 소문자, 숫자만 입력해주세요.");
			req.getRequestDispatcher("IdCheckForm.jsp").forward(req, resp);
		} else if (id_check == false) {
			req.setAttribute("Msg", "5~15자의 영문 소문자, 숫자만 입력해주세요.");
			req.getRequestDispatcher("IdCheckForm.jsp").forward(req, resp);
		
		} else {
			if (result == true) {
				req.setAttribute("Msg", user_id + "는 중복된 아이디 입니다.");
				req.getRequestDispatcher("IdCheckForm.jsp").forward(req, resp);
				System.out.println("중복된 아이디 ");
			} else { 
				req.setAttribute("Msg", user_id + "는 사용가능합니다.");
				req.setAttribute("UseMsg", user_id);
				req.getRequestDispatcher("IdCheckForm.jsp").forward(req, resp);
				System.out.println("사용 가능 아이디");
			}
		}
	}
}
