package board.report;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import board.member.MemberDTO;
import common.DBConnPool;

public class ReportDAO extends DBConnPool {

	public ReportDAO() {
		super();
	}

	public ReportDTO getReportDTO(int idx) {
		ReportDTO dto = new ReportDTO(); 
		String query = "SELECT * FROM reportTB WHERE idx=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			System.out.println(query);
			// 결과 처리
			if (rs.next()) {

				dto.setIdx(rs.getInt("idx"));
				dto.setReportedNickname(rs.getString("reportedNickname"));
				dto.setReporterNickname(rs.getString("reporterNickname"));
				dto.setReason(rs.getString("reason"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("신고 관리 테이블 조회 중 오류 발생");
		}

		return dto;
	}

	// 신고 접수
	public int reportReceived(ReportDTO dto) {
		int result = 0;

		String query = "INSERT INTO reportTB (idx, reportedNickname, reporterNickname, reason, reportDate) "
				+ "VALUES ( ?,?,?,?,sysdate)";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, dto.getIdx());
			psmt.setString(2, dto.getReportedNickname());
			psmt.setString(3, dto.getReporterNickname());
			psmt.setString(4, dto.getReason());
			result = psmt.executeUpdate();

			System.out.println(query);
		} catch (Exception e) {
			System.out.println("신고 접수 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	// 한 회원을 한 번만 신고할 수 있게 하기
	public boolean reporterIdxCheck(String reporterNickname, String reportedNickname) {
		boolean check = false;
		try {
			String query = " SELECT * FROM reportTB WHERE reporterNickname=? AND reportedNickname =?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, reporterNickname);
			psmt.setString(2, reportedNickname);
			rs = psmt.executeQuery();

			check = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("신고자 중복확인 오류");

		} finally {
			close();
		}
		return check;
	}

	// *************관리자*****************

	// 모든 회원 리스트

	public List<ReportDTO> AllReport(Map<String, Object> map) {
		List<ReportDTO> reportList = new Vector<ReportDTO>();

		String query = "SELECT *FROM REPORTTB ";

		if (map.get("reportSearchWord") != null) {
			query += " where " + map.get("reportSearchField") + " LIKE '%" + map.get("reportSearchWord") + "%' ";
		}

		System.out.println(query);
		try {
			psmt = con.prepareStatement(query);
			stmt = con.createStatement();
			rs = psmt.executeQuery();

			while (rs.next()) {
				ReportDAO dao = new ReportDAO();
				ReportDTO dto = new ReportDTO();
				dto.setIdx(rs.getInt(1));
				dto.setReportedNickname(rs.getString(2));
				dto.setReporterNickname(rs.getString(3));
				dto.setReason(rs.getString(4));
				dto.setReportDate(rs.getDate(5));
				dto.setReportCount(dao.reportCount(dto.getIdx()));
				reportList.add(dto);
			}
		} catch (Exception e) {
			System.out.println("전체 신고내역 조회 중 오류 발생");
			e.printStackTrace();
		}
		return reportList;
	}

	// 정지 내역 삭제
	public int deleteReport(String reportedNickname, String reporterNickname) {
		int result = 0;
		String query = "DELETE FROM REPORTTB r WHERE reportedNickname=? AND reporterNickname =?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, reportedNickname);
			psmt.setString(2, reporterNickname);
			result = psmt.executeUpdate();
			rs = psmt.executeQuery();
			System.out.println(query);
		} catch (

		Exception e) {
			System.out.println("관리자 권한으로 신고 내역 삭제 중 오류 발생");
			e.printStackTrace();
		}
		return result;
	}

//	
	// 총 몇 번의 신고인지
	public int reportCount(int idx) {
		String query = "SELECT COUNT(*) FROM reportTB WHERE idx =?";
		int totalCount = 0;

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			System.out.println(query);

			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("총 신고 수 조회 오류");
		}

		return totalCount; 
	}

}