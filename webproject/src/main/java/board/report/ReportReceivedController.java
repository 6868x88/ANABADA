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

      int idx = Integer.parseInt(req.getParameter("idx"));
      String reporterNickname = (String) session.getAttribute("Nickname");
      String reportedNickname = req.getParameter("reportedNickname");

      ReportDTO reportdto = new ReportDTO();
      reportdto.setIdx(idx); // idx
      reportdto.setReportedNickname(req.getParameter("reportedNickname")); // 피신고자 닉네임
      reportdto.setReporterNickname(reporterNickname); // 신고자 닉네임
      reportdto.setReason(req.getParameter("reason")); // 신고 사유

      ReportDAO reportdao = new ReportDAO();
      int result = reportdao.reportReceived(reportdto);

      boolean reporterResult = reportdao.reporterIdxCheck(reporterNickname, reportedNickname);
      reportdao.close();

      if (reporterResult == true) {
         resp.sendRedirect("PersonalInformation.do");
         req.setAttribute("Msg", "이미 신고 접수 처리중입니다. 중복 신고는 불가합니다.");
         System.out.println("신고 접수가 이미 완료되었습니다.");
      } else if (result == 1) {
         // resp.sendRedirect("ReportReceived.jsp");
         req.setAttribute("Msg", "신고 접수가 완료되었습니다.");
         System.out.println("신고 접수 완료");
      } else {
         resp.sendRedirect("ReportReceived.jsp");
         System.out.println("신고 접수 실패");
      }
   }

}