package board.report;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Page/deleteReport.do")
public class ManageDeleteReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String reportedNickname = req.getParameter("reportedNickname");
		String reporterNickname = req.getParameter("reporterNickname");

		ReportDAO dao = new ReportDAO();
		int result = dao.deleteReport(reportedNickname, reporterNickname);
		dao.close();

		if (result == 1) {
			req.getRequestDispatcher("MemberManagement.do").forward(req, resp);
			System.out.println("관리자 권한 신고 내역 삭제 완료");
		} else {
			req.getRequestDispatcher("MemberManagement.do").forward(req, resp);
			System.out.println("관리자 권한 신고 내역 삭제 실패");
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
