package board.trade;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class SellBoardDAO extends DBConnPool {

	// 검색 - 게시물 갯수 반환
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "select count(*) from sellTB";

		if (map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " " + " like '%" + map.get("searchWord") + "%'";
		}
		System.out.println(map.get("category") + ":페이지");

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

//일련번호에 해당하는 게시물을 DTO 에 담아 반환하기(글 상세보기)
	public SellBoardDTO selectView(String exc_num) {
		SellBoardDTO dto = new SellBoardDTO();
		String query = "select * from sellTB where sell_num = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, exc_num);
			rs = psmt.executeQuery();

			if (rs.next()) {

				dto.setIdx(rs.getInt(1));
				dto.setSell_num(rs.getInt(2));
				dto.setSell_title(rs.getString(3));
				dto.setSell_contents(rs.getString(4));
				dto.setSell_category(rs.getInt(5));
				dto.setSell_price(rs.getInt(6));
				dto.setUser_picture(rs.getString(7));
				dto.setBoard_num(rs.getInt(8));
				dto.setSell_condition(rs.getInt(9));
				dto.setNickname(rs.getString(10));

			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

//게시글 DB에 저장하기
	public int insertWrite(SellBoardDTO dto) {
		int result = 0;
		try {
			String query = "insert into sellTB ("
					+ "idx, sell_num, sell_title, sell_contents, sell_category, sell_price, user_picture, board_num, sell_condition, nickname)"
					+ " values (?, seq_board_num.NEXTVAL, ?,?,?,?,?,1,?,?)";

			psmt = con.prepareStatement(query);
			psmt.setInt(1, dto.getIdx());
			psmt.setString(2, dto.getSell_title());
			psmt.setString(3, dto.getSell_contents());
			psmt.setInt(4, dto.getSell_category());
			psmt.setInt(5, dto.getSell_price());
			psmt.setString(6, dto.getUser_picture());
			psmt.setInt(7, dto.getSell_condition());
			psmt.setString(8, dto.getNickname());

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

//카테고리별 게시물 반환
	public List<SellBoardDTO> selectListPage(Map<String, Object> map) {
		List<SellBoardDTO> board = new Vector<SellBoardDTO>();
		String query = "";

		// 전체보기
		if (map.get("category").toString().equals("7")) {
			query = " " + "select * from(" + "		select Tb.*, rownum rNum from(" + "		select * from sellTB ";

			// 검색조건
			if (map.get("searchWord") != null) {
				query += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
			}
			query += "		order by sell_num desc " + "		)Tb " + " ) " + " where rNum between ? and ? ";
		}

		// 카테고리 분류 보기
		else {
			query = " " + "select * from( select Tb.*, rownum rNum from( select * from sellTB  "
					+ "where sell_category=?";

			if (map.get("searchWord") != null) {
				query += " AND " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";

				System.out.println(map.get("searchWord"));
			}
			query += " ORDER BY sell_num DESC )" + "		Tb " + " ) " + " where rNum between ? and ? ";
		}

		try {

			psmt = con.prepareStatement(query);

			if (map.get("category").toString().equals("7")) {
				psmt.setString(1, map.get("start").toString());
				psmt.setString(2, map.get("end").toString());
			} else {
				psmt.setString(1, (String) map.get("category"));
				psmt.setString(2, map.get("start").toString());
				psmt.setString(3, map.get("end").toString());
			}

			rs = psmt.executeQuery();

			while (rs.next()) {
				SellBoardDTO dto = new SellBoardDTO();

				dto.setIdx(rs.getInt(1));
				dto.setSell_num(rs.getInt(2));
				dto.setSell_title(rs.getString(3));
				dto.setSell_contents(rs.getString(4));
				dto.setSell_category(rs.getInt(5));
				dto.setSell_price(rs.getInt(6));
				dto.setUser_picture(rs.getString(7));
				dto.setBoard_num(rs.getInt(8));
				dto.setSell_condition(rs.getInt(9));
				dto.setNickname(rs.getString(10));

				board.add(dto);
			}

		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}

//글 수정하기
	public int updateEdit(SellBoardDTO dto) {
		int result = 0;
		try {
			String sql = "update sellTB set "
					+ " sell_title=?, sell_contents=?, sell_category=?, sell_price=?, user_picture=?, sell_condition=? "
					+ " where sell_num=? ";

			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getSell_title());
			psmt.setString(2, dto.getSell_contents());
			psmt.setInt(3, dto.getSell_category());
			psmt.setInt(4, dto.getSell_price());
			psmt.setString(5, dto.getUser_picture());
			psmt.setInt(6, dto.getSell_condition());
			psmt.setInt(7, dto.getSell_num());

			result = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시물 수정 중 예외 발생");
		}

		return result;
	}

//글 삭제하기
	public int deletePost(SellBoardDTO dto) {
		int result = 0;
		try {
			String sql = "delete from sellTB where sell_num=?";

			psmt = con.prepareStatement(sql);
			psmt.setInt(1, dto.getSell_num());

			result = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시글 삭제 중 오류");
		}

		return result;
	}

}
