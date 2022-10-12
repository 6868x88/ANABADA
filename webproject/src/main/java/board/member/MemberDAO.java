package board.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import board.free.FreeBoardDTO;
import board.report.ReportDAO;
import common.DBConnPool;

public class MemberDAO extends DBConnPool {

	public MemberDAO() {
		super();
	}

	// 명시한 아이디/패스워드와 일치하는 회원 정보를 반환합니다.
	public MemberDTO getMemberDTO(String user_id, String user_passwd) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM MEMBERTB WHERE user_id=? AND user_passwd=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, user_id);
			psmt.setString(2, user_passwd);
			rs = psmt.executeQuery();
			System.out.println(query);

			if (rs.next()) {
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setNickname(rs.getString(3));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_passwd(rs.getString("user_passwd"));
				dto.setEmail(rs.getString(6));
				dto.setPhone_num(rs.getString(7));
				dto.setReport(rs.getInt(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 중 오류 발생");
		}

		return dto;
	}

	// 아이디 중복확인
	public boolean IDCheck(String user_id) {
		boolean check = false;
		try {
			String query = "SELECT * FROM MEMBERTB WHERE user_id=?";

			psmt = con.prepareStatement(query);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();

			check = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("아이디 중복확인 오류");

		} finally {
			close();
		}
		return check;
	}

	// 닉네임 중복확인
	public boolean NickNameCheck(String nickname) {
		boolean check = false;
		try {
			String query = "SELECT * FROM MEMBERTB WHERE nickname=?";

			psmt = con.prepareStatement(query);
			psmt.setString(1, nickname);
			rs = psmt.executeQuery();

			check = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("닉네임 중복확인 오류");

		} finally {
			close();
		}
		return check;
	}

	// 회원가입

	public int signUp(MemberDTO dto) {
		int result = 0;

		String query = "INSERT INTO memberTB ( " + " idx, name, nickname, user_id, user_passwd, email, phone_num) "
				+ " VALUES ( " + " seq_board_num.NEXTVAL,?,?,?,?,?,?)";

		try {

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getNickname());
			psmt.setString(3, dto.getUser_id());
			psmt.setString(4, dto.getUser_passwd());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getPhone_num());
			result = psmt.executeUpdate();

			System.out.println(query);
		} catch (Exception e) {
			System.out.println("signUp 회원가입 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	// 회원정보 불러오기
	public MemberDTO PersonalInfo(String user_id) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM MEMBERTB WHERE user_id=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();

			if (rs.next()) {

				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setNickname(rs.getString(3));
				dto.setUser_id(rs.getString(4));
				dto.setUser_passwd(rs.getString(5));
				dto.setEmail(rs.getString(6));
				dto.setPhone_num(rs.getString(7));
				dto.setReport(rs.getInt(8));
				System.out.println(query);

			}
		} catch (Exception e) {
			System.out.println("회원 정보 불러오기 오류");
			e.printStackTrace();
		}
		return dto;
	}

	// 회원정보 수정
	public int UpdatePersonalnfo(MemberDTO dto) {
		int result = 0;
		String query = "UPDATE MEMBERTB SET name=?, NICKNAME=?, USER_PASSWD=?, EMAIL=?, PHONE_NUM=? WHERE user_id=?";
		try {

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getNickname());
			psmt.setString(3, dto.getUser_passwd());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getPhone_num());
			psmt.setString(6, dto.getUser_id());
			result = psmt.executeUpdate();
			System.out.println(query);
		} catch (Exception e) {
			System.out.println("개인정보 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	// 탈퇴하기
	public int SignOut(int idx, String user_passwd) {
		int result = 0;
		String query = "DELETE FROM MEMBERTB WHERE idx=? and user_passwd=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, idx);
			psmt.setString(2, user_passwd);
			result = psmt.executeUpdate();
			rs = psmt.executeQuery();
			System.out.println(query);

		} catch (Exception e) {
			System.out.println("탈퇴 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	// ***************** 관리자 ******************//

	// 모든 회원 리스트

	public List<MemberDTO> AllMemberListPage(Map<String, Object> map) {
		List<MemberDTO> memberList = new Vector<MemberDTO>();

		String query = "SELECT *FROM memberTB where user_id not in('admin') ";

		if (map.get("searchWord") != null) {
			query += " and " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
		}

		query += " ORDER BY REPORT ";
		System.out.println(query);
		try {
			psmt = con.prepareStatement(query);
			stmt = con.createStatement();
			rs = psmt.executeQuery();

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setNickname(rs.getString(3));
				dto.setUser_id(rs.getString(4));
				dto.setUser_passwd(rs.getString(5));
				dto.setEmail(rs.getString(6));
				dto.setPhone_num(rs.getString(7));
				dto.setReport(rs.getInt(8));

				ReportDAO reportDao = new ReportDAO();
				dto.setReportCount(reportDao.reportCount(dto.getIdx()));
				reportDao.close();

				memberList.add(dto);
			}
		} catch (Exception e) {
			System.out.println("전체 회원 조회 중 예외 발생");
			e.printStackTrace();
		}
		return memberList; // 목록 반환
	}

	// 회원 정지 시키기
	public int MembershipSuspension(String user_id) {
		int result = 0;
		String query = "UPDATE MEMBERTB SET REPORT = 1 WHERE USER_ID =?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, user_id);
			result = psmt.executeUpdate();
			rs = psmt.executeQuery();
			System.out.println(query);

		} catch (Exception e) {
			System.out.println("관리자 권한 회원 정지 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	// 회원 정지 해제하기(기존 신고수 0으로 초기화 + reporttable 신고수 삭제)
	public int liftOff(String user_id) {
		int result = 0;
		String query = "UPDATE MEMBERTB SET REPORT = 0 WHERE USER_ID =?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, user_id);
			result = psmt.executeUpdate();
			rs = psmt.executeQuery();
			System.out.println(query);

		} catch (Exception e) {
			System.out.println("관리자 권한 회원 정지 해제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	// 회원 탈퇴 시키기
	public int manageSignOut(String user_id) {
		int result = 0;
		String query = "DELETE FROM MEMBERTB WHERE user_id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, user_id);
			result = psmt.executeUpdate();
			rs = psmt.executeQuery();
			System.out.println(query);

		} catch (Exception e) {
			System.out.println("관리자 권한으로 탈퇴 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

}
