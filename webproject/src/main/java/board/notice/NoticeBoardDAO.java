package board.notice;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import board.free.FreeBoardDTO;
import common.DBConnPool;

public class NoticeBoardDAO extends DBConnPool {
	public NoticeBoardDAO() {
		super();
	}

	// 조건에 맞는 게시물의 개수 반환
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SELECT COUNT(*) FROM noticeTB ";

		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}

	public List<NoticeBoardDTO> selectListPage(Map<String, Object> map) {
		List<NoticeBoardDTO> board = new Vector<NoticeBoardDTO>();

		String query = " " + "SELECT * FROM ( " + " SELECT Tb.*, ROWNUM rNum FROM ( " + " SELECT * FROM NOTICETB ";

		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
		}

		query += " ORDER BY n_num DESC " + " )Tb " + " ) " + " WHERE rNum BETWEEN ? AND ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();

			while (rs.next()) {
				NoticeBoardDTO dto = new NoticeBoardDTO();
				dto.setIdx(rs.getInt(1));
				dto.setN_num(rs.getInt(2));
				dto.setN_title(rs.getString(3));
				dto.setN_date(rs.getDate(4));
				dto.setN_count(rs.getInt(5));
				dto.setN_content(rs.getString(6));

				board.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}

	// 주어진 일련번호에 해당하는 게시물을 DTO에 담아 반환
	public NoticeBoardDTO selectView(String n_num) {
		NoticeBoardDTO dto = new NoticeBoardDTO();
		String query = "SELECT * FROM noticetb where n_num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, n_num);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setIdx(rs.getInt(1));
				dto.setN_num(rs.getInt(2));
				dto.setN_title(rs.getString(3));
				dto.setN_date(rs.getDate(4));
				dto.setN_count(rs.getInt(5));
				dto.setN_content(rs.getString(6));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	// 주어진 일련번호에 해당하는 게시물의 조회수를 1 증가시킴.
	public void updateVisitCount(String n_num) {
		String query = "UPDATE noticeTB SET " + " n_count= n_count+1 " + " where n_num=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, n_num);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}

	public int deletePost(NoticeBoardDTO dto) {
		int result = 0;

		try {
			String query = "DELETE FROM NoticeTB where n_num=?";

			psmt = con.prepareStatement(query);
			psmt.setInt(1, dto.getN_num());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	public int insertWrite(NoticeBoardDTO dto) {
		int result = 0;
		try {
			String query = "INSERT INTO NoticeTb ( " + "idx, n_num, n_title, n_date, n_count, n_content) " + "VALUES ( "
					+ "?, seq_board_num.NEXTVAL,?,sysdate,0,?)";
			psmt = con.prepareStatement(query);
			psmt.setInt(1, dto.getIdx());
			psmt.setString(2, dto.getN_title());
			psmt.setString(3, dto.getN_content());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	public int updateEdit(NoticeBoardDTO dto) {
		int result = 0;

		try {
			String query = "UPDATE NoticeTB SET n_title=?, n_content=? where n_num=?";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getN_title());
			psmt.setString(2, dto.getN_content());
			psmt.setInt(3, dto.getN_num());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
			System.out.println(dto.getN_title());
			System.out.println(dto.getN_content());
			System.out.println(dto.getN_num());
		}
		return result;
	}
}