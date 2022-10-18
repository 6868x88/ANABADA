package board.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Page/UpdateInfo.do")
public class UpdateInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String user_id = (String) session.getAttribute("UserId");
		String Nickname = (String) session.getAttribute("Nickname");

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.PersonalInfo(user_id);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/Page/UpdateInfo.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		MemberDTO dto = new MemberDTO();
		dto.setName(req.getParameter("name"));
		dto.setNickname(req.getParameter("nickname"));
		dto.setUser_passwd(req.getParameter("user_passwd"));
		dto.setEmail(req.getParameter("email"));
		dto.setPhone_num(req.getParameter("phone_num"));
		dto.setUser_id(req.getParameter("user_id"));

		MemberDAO dao = new MemberDAO();
		int result = dao.UpdatePersonalnfo(dto);
		dao.close();


		if (result == 1) {
			resp.sendRedirect("PersonalInformation.do");
			System.out.println("개인정보 수정 성공");
		} else {
			resp.sendRedirect("PersonalInformation.do");
			System.out.println("개인정보 수정 실패");
		}

	}
}
