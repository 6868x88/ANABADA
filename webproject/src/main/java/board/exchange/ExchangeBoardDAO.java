package board.exchange;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import board.trade.SellBoardDTO;
import common.DBConnPool;

public class ExchangeBoardDAO extends DBConnPool{
	
	//검색 - 게시물 갯수 반환
		public int selectCount(Map<String, Object> map) {
			int totalCount = 0;

			String query = "select count(*) from exchangeTB";
			if(map.get("searchWord") != null) {
				query += " where " + map.get("searchField")+" "+" like '%"+map.get("searchWord")+"%'";
			}
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				rs.next();
				totalCount = rs.getInt(1);

			} catch(Exception e) {
				System.out.println("게시물 카운트 중 예외 발생");
				e.printStackTrace();
			}
			return totalCount;
		}

		
		// 검색 - 게시물 목록 반환(페이징)
		public List<ExchangeBoardDTO> selectListPage(Map<String, Object> map){
			List<ExchangeBoardDTO> board = new Vector<ExchangeBoardDTO>();
			String query = " " + "select * from("
					+ "		select Tb.*, rownum rNum from("
					+"		select * from exchangeTB ";

			//검색조건
			if(map.get("searchWord") != null) {
				query += " where "+map.get("searchField")+" like '%"+map.get("searchWord")+"%'";
			}
			query += "		order by exc_num desc "
					+"		)Tb "
					+" ) "
					+" where rNum between ? and ? ";		

			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, map.get("start").toString());
				psmt.setString(2, map.get("end").toString());
				rs = psmt.executeQuery();

				while(rs.next()) {
					ExchangeBoardDTO dto = new ExchangeBoardDTO();

					dto.setIdx(rs.getInt(1));
					dto.setExc_num(rs.getInt(2));
					dto.setExc_title(rs.getString(3));
					dto.setExc_contents(rs.getString(4));
					dto.setExc_condition(rs.getInt(5));
					dto.setExc_diff(rs.getInt(6));
					dto.setExc_wish(rs.getString(7));
					dto.setUser_picture(rs.getString(8));
					dto.setBoard_num(rs.getInt(9));
					dto.setNickname(rs.getString(10));
					
					board.add(dto);
				}
				System.out.println(map.get("searchWord"));
			} catch(Exception e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			} return board;
		}

		//일련번호에 해당하는 게시물을 DTO 에 담아 반환하기(글 상세보기)
		public ExchangeBoardDTO selectView(String exc_num) {
			ExchangeBoardDTO dto = new ExchangeBoardDTO();
			String query = "select * from exchangeTB where exc_num = ?";

			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1,exc_num);
				rs = psmt.executeQuery();

				if(rs.next()) {
					
					dto.setIdx(rs.getInt(1));
					dto.setExc_num(rs.getInt(2));
					dto.setExc_title(rs.getString(3));
					dto.setExc_contents(rs.getString(4));
					dto.setExc_condition(rs.getInt(5));
					dto.setExc_diff(rs.getInt(6));
					dto.setExc_wish(rs.getString(7));
					dto.setUser_picture(rs.getString(8));
					dto.setBoard_num(rs.getInt(9));
					dto.setNickname(rs.getString(10));
					
				}
			} catch(Exception e) {
				System.out.println("게시물 상세보기 중 예외 발생");
				e.printStackTrace();
			}
			return dto;
		}
		
		//게시글 DB에 저장하기 
		public int insertWrite(ExchangeBoardDTO dto) {
			int result = 0;
			try {
				String query = "insert into exchangeTB ("
						+"idx, exc_num, exc_title, exc_contents, exc_condition, exc_diff, exc_wish, user_picture, board_num, nickname)"
						+" values (?, seq_board_num.NEXTVAL, ?,?,?,?,?,?,0,?)";

				psmt = con.prepareStatement(query);
				psmt.setInt(1, dto.getIdx());
				psmt.setString(2, dto.getExc_title());
				psmt.setString(3, dto.getExc_contents());
				psmt.setInt(4, dto.getExc_condition());
				psmt.setInt(5, dto.getExc_diff());
				psmt.setString(6, dto.getExc_wish());
				psmt.setString(7, dto.getUser_picture());
				psmt.setString(8, dto.getNickname());
				
				result = psmt.executeUpdate();
			}catch(Exception e) {
				System.out.println("게시물 입력 중 예외 발생");
				e.printStackTrace();
			}return result;
		}
		
		
		
		//글 수정하기
		public int updateEdit(ExchangeBoardDTO dto) {
			int result = 0;
			try {
				String sql = "update exchangeTB set "
						+" exc_title=?, exc_contents=?, exc_condition=?, exc_diff=?, exc_wish=?, user_picture=? "
						+" where exc_num=?";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, dto.getExc_title());
				psmt.setString(2, dto.getExc_contents());
				psmt.setInt(3, dto.getExc_condition());
				psmt.setInt(4, dto.getExc_diff());
				psmt.setString(5, dto.getExc_wish());
				psmt.setString(6, dto.getUser_picture());
				psmt.setInt(7, dto.getExc_num());
				
				result = psmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("게시물 수정 중 예외 발생");
			}
			
			return result;
		}
		
		
		//글 삭제하기
		public int deletePost(ExchangeBoardDTO dto) {
			int result = 0;
			
			try {
				String sql = "delete from exchangeTB where exc_num=?";
				
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, dto.getExc_num());
				
				result = psmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("게시물 삭제 중 예외 발생");
			}
			return result;
		}
		
	

}
