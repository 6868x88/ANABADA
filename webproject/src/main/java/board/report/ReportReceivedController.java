package board.report;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.member.MemberDAO;
import board.member.MemberDTO;

@WebServlet("/Page/ReportReceived.do")
public class ReportReceivedController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		HttpSession session = req.getSession();

		String boardName = "";
		if (Integer.parseInt(req.getParameter("boardName")) == 0) {
			boardName = "교환게시판";
		} else if (Integer.parseInt(req.getParameter("boardName")) == 1) {
			boardName = "판매게시판";
		} else {
			boardName = "자유게시판";
		}
		System.out.println(boardName + "게시판 이름");

		String reporterNickname = (String) session.getAttribute("Nickname");
		String reportedNickname = req.getParameter("reportedNickname");

		// 신고 사유 업데이트
		ReportDTO reportdto = new ReportDTO();
		reportdto.setIdx(Integer.parseInt(req.getParameter("idx")));
		reportdto.setBoardName(boardName);
		reportdto.setReportedNickname(req.getParameter("reportedNickname")); // 피신고자 닉네임
		reportdto.setReporterNickname(reporterNickname); // 신고자 닉네임
		reportdto.setReason(req.getParameter("reason")); // 신고 사유

		ReportDAO reportdao = new ReportDAO();
		int result = reportdao.reportReceived(reportdto);

		// 총 신고수 업데이트
		MemberDAO dao = new MemberDAO();
		dao.totalReportCount(reportedNickname, reportedNickname);
		dao.close();

		String referer = req.getHeader("Referer");

		if (result == 1) {
			resp.sendRedirect(referer);
			System.out.println("신고 접수 완료");
		} else {
			resp.sendRedirect("ReportReceived.jsp");
			System.out.println("신고 접수 실패");
		}
	}

}