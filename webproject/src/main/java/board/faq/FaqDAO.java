package board.faq;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import board.free.FreeBoardDTO;
import common.DBConnPool;

public class FaqDAO extends DBConnPool {
	public FaqDAO() {
		super();
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SELECT COUNT(*) FROM faqTB ";

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

	public List<FaqDTO> selectListPage(Map<String, Object> map) {
		List<FaqDTO> faq = new Vector<FaqDTO>();
		String query = " " + "SELECT * FROM ( " + " SELECT * FROM FaqTB where q_category=?";
		if (map.get("searchWord") != null) {
				query += " AND q_category=2 AND q_category=3 AND q_category=4 OR " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
			
		}
		query += " ORDER BY q_num DESC )";

		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, (String) map.get("category"));
			rs = psmt.executeQuery();

			// 반환된 게시물 목록을 List 컬렉션에 추가
			while (rs.next()) {
				FaqDTO dto = new FaqDTO();

				dto.setQ_num(rs.getInt(1));
				dto.setQ_category(rs.getInt(2));
				dto.setQ_title(rs.getString(3));
				dto.setQ_content(rs.getString(4));

				faq.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		System.out.println(query);
		return faq; // 목록 반환
	}
//
//	public List<FaqDTO> select_title(String category_title) {
//		List<FaqDTO> title_list = new Vector<FaqDTO>();
//		String query = " SELECT * FROM FaqTB where q_category=" + category_title;
//
//		try {
//			psmt = con.prepareStatement(query);
//
//			rs = psmt.executeQuery();
//
//			// 반환된 게시물 목록을 List 컬렉션에 추가
//			while (rs.next()) {
//				FaqDTO dto = new FaqDTO();
//
//				dto.setQ_category(rs.getInt(1));
//
//				title_list.add(dto);
//
//			}
//		} catch (Exception e) {
//			System.out.println("게시물 조회 중 예외 발생");
//			e.printStackTrace();
//		}
//		return title_list; // 목록 반환
//	}

}