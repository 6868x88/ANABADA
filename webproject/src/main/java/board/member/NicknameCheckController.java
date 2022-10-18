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

@WebServlet("/Page/NicknameCheckForm.do")
public class NicknameCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		resp.setContentType("text/html; charset=UTF-8");

		String nickname = req.getParameter("nickname");

		MemberDAO dao = new MemberDAO();
		boolean result = dao.NickNameCheck(nickname);
		dao.close();

		String spe = "^([ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]*)$";
		boolean check = Pattern.matches(spe, nickname);

		if (nickname == "") {
			req.setAttribute("Msg", "별명을 입력해주세요.");
			req.getRequestDispatcher("NicknameCheckForm.jsp").forward(req, resp);
			nickname = "";
		} else if (nickname.length() > 6) {
			req.setAttribute("Msg", "별명은 6글자 이하로 지어주세요.");
			req.getRequestDispatcher("NicknameCheckForm.jsp").forward(req, resp);
			nickname = "";
		} else if (check == false) {
			req.setAttribute("Msg", "공백 없이 한글, 영어, 숫자만 사용가능합니다.");
			req.getRequestDispatcher("NicknameCheckForm.jsp").forward(req, resp);
			nickname = "";
		}else if(nickname == "null") {
			req.setAttribute("Msg", "은(는) 중복된 닉네임 입니다.");
			req.getRequestDispatcher("NicknameCheckForm.jsp").forward(req, resp);

		} else {
			if (result == true) {
				req.setAttribute("Msg", nickname + "은(는) 중복된 닉네임 입니다.");
				req.getRequestDispatcher("NicknameCheckForm.jsp").forward(req, resp);
				System.out.println("중복된 닉네임 ");
				nickname = "";
			} else { 
				req.setAttribute("Msg", nickname + "는 사용가능합니다.");

				req.setAttribute("UseMsg", nickname);
				req.getRequestDispatcher("NicknameCheckForm.jsp").forward(req, resp);
				System.out.println("사용 가능 닉네임");
			}
		}
	}
}
