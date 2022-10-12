package board.free;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import board.notice.NoticeBoardDTO;
import common.DBConnPool;

public class FreeBoardDAO extends DBConnPool {
	public FreeBoardDAO() {
		super();
	}

	// 조건에 맞는 게시물의 개수 반환
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SELECT COUNT(*) FROM freeTB ";

		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement(); // 쿼리문 생성
			rs = stmt.executeQuery(query); // 실행
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount; // 게시물 개수 서블릿으로 반환
	}

	public List<FreeBoardDTO> selectListPage(Map<String, Object> map) {
		List<FreeBoardDTO> board = new Vector<FreeBoardDTO>();

		String query = " " + "SELECT * FROM ( " + " SELECT Tb.*, ROWNUM rNum FROM ( " + " SELECT * FROM FreeTB ";

		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
		}

		query += " ORDER BY free_num DESC " + " )Tb " + " ) " + " WHERE rNum BETWEEN ? AND ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();

			// 반환된 게시물 목록을 List 컬렉션에 추가
			while (rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
				
				dto.setIdx(rs.getInt(1));
				dto.setFree_num(rs.getInt(2));
				dto.setFree_date(rs.getDate(3));
				dto.setFree_title(rs.getString(4));
				dto.setFree_contents(rs.getString(5));
				dto.setFree_count(rs.getInt(6));
				dto.setNickname(rs.getString(7));

				board.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board; // 목록 반환
	}

	
	public FreeBoardDTO selectViewEdit(String free_num) {
		FreeBoardDTO dto = new FreeBoardDTO();
		
		String query = "SELECT F.*, M.idx "
				+" FROM memberTB M INNER JOIN FREETB F "
				+" ON M.idx=F.idx "
				+" WHERE free_num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, free_num);
			rs = psmt.executeQuery(); // 쿼리문 실행

			if (rs.next()) {
				dto.setIdx(rs.getInt(1));
				dto.setFree_num(rs.getInt(2));
				dto.setFree_date(rs.getDate(3));
				dto.setFree_title(rs.getString(4));
				dto.setFree_contents(rs.getString(5));
				dto.setFree_count(rs.getInt(6));
				dto.setNickname(rs.getString(7));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}


	// 주어진 일련번호에 해당하는 게시물의 조회수를 1 증가시킴.

	public void updateVisitCount(String free_num) {
		String query = "UPDATE FreeTB SET " + " free_count= free_count+1 " + " where free_num=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, free_num);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}

	public int insertWrite(FreeBoardDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO freeTB( " + " idx, free_num, free_date, free_title, free_contents, free_count, nickname) "
					+ " VALUES (" + "?, seq_board_num.nextval,sysdate,?,?,0,?)";
			psmt = con.prepareStatement(query);
			psmt.setInt(1, dto.getIdx());
			psmt.setString(2, dto.getFree_title());
			psmt.setString(3, dto.getFree_contents());
			psmt.setString(4, dto.getNickname());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int deletePost(FreeBoardDTO dto) {
		int result=0;
		
		try {
			String query="DELETE FROM freeTB where free_num=?";
			
			psmt = con.prepareStatement(query);
			psmt.setInt(1, dto.getFree_num());
			result=psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int updateEdit(FreeBoardDTO dto) {
		int result=0;
		
		try {
			String query="UPDATE freeTB SET free_title=?, free_contents=? where free_num=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getFree_title());
			psmt.setString(2, dto.getFree_contents());
			psmt.setInt(3, dto.getFree_num());
			result=psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			System.out.println(dto.getFree_title());
			System.out.println(dto.getFree_contents());
			System.out.println(dto.getFree_num());
		}
		return result;
	}
}
