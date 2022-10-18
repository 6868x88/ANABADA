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

	// idx에 해당하는 모든 신고 컬럼 조회
	public ReportDTO getReportDTO(int idx) {
		ReportDTO dto = new ReportDTO();
		String query = "SELECT * FROM reportTB WHERE idx=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			System.out.println(query);
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

		String query = "INSERT INTO reportTB( "
				+ " idx, boardName, reportedNickname ,reporterNickname , reason , reportDate , countReport ) "
				+ " VALUES (?,?,?,?,?,sysdate , " + " ( SELECT NVL(COUNT(countReport)+1, 0) cnt"
				+ " FROM reportTB WHERE idx = ? ))";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, dto.getIdx());
			psmt.setString(2, dto.getBoardName());
			psmt.setString(3, dto.getReportedNickname());
			psmt.setString(4, dto.getReporterNickname());
			psmt.setString(5, dto.getReason());
			psmt.setInt(6, dto.getIdx());
			result = psmt.executeUpdate();

			System.out.println(query);
		} catch (Exception e) {
			System.out.println("신고 접수 중 예외 발생");
			e.printStackTrace();
		}
		return result;
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
				ReportDTO dto = new ReportDTO();
				dto.setIdx(rs.getInt(1));
				dto.setBoardName(rs.getString(2));
				dto.setReportedNickname(rs.getString(3));
				dto.setReporterNickname(rs.getString(4));
				dto.setReason(rs.getString(5));
				dto.setReportDate(rs.getDate(6));
				dto.setCountReport(rs.getInt(7));
				reportList.add(dto);
			}
		} catch (Exception e) {
			System.out.println("전체 신고내역 조회 중 오류 발생");
			e.printStackTrace();
		}
		return reportList;
	}

	// 정지 내역 삭제
	public int deleteReport(String reportedNickname, String reporterNickname, String reason) {
		int result = 0;
		String query = "DELETE FROM REPORTTB r WHERE reportedNickname=? AND reporterNickname =? AND reason=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, reportedNickname);
			psmt.setString(2, reporterNickname);
			psmt.setString(3, reason);
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

}