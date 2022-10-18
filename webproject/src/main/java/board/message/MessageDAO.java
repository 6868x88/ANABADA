package board.message;

import java.util.List;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.DBConnPool;

public class MessageDAO extends DBConnPool{
	public MessageDAO(ServletContext application) {
		super();
	}


	//쪽지 보내기(작성하기)
	public int sendMessage(MessageDTO dto) {
		int result = 0;
		try {
			String sql = "insert into MessageTB("
					+" m_num, send_idx, send_nickname, receive_idx, receive_nickname, m_content) "
					+" values("
					+" seq_message_num.NEXTVAL,?,?,?,?,?)";

			psmt = con.prepareStatement(sql);
			psmt.setInt(1, dto.getSend_idx());
			psmt.setString(2, dto.getSend_nickname());
			psmt.setInt(3, dto.getReceive_idx());
			psmt.setString(4, dto.getReceive_nickname());
			psmt.setString(5, dto.getM_content());

			result = psmt.executeUpdate();
			System.out.println(result);

		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("쪽지 작성 중 오류");
		}
		return result;
	}

	//서로가 보낸 쪽지 목록 
	public List<MessageDTO> select_Message(int send_idx, int receive_idx){
		List<MessageDTO> list = new Vector<MessageDTO>();
		String sql = "select * from MessageTB where (send_idx="+send_idx + " and receive_idx="+receive_idx+") or"
				+" (send_idx="+receive_idx+" and receive_idx="+send_idx+") order by m_num asc";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {

				MessageDTO dto = new MessageDTO();

				dto.setM_num(rs.getInt("m_num"));
				dto.setSend_idx(rs.getInt("send_idx"));
				dto.setSend_nickname(rs.getString("send_nickname"));
				dto.setReceive_idx(rs.getInt("receive_idx"));
				dto.setReceive_nickname(rs.getString("receive_nickname"));
				dto.setM_content(rs.getString("m_content"));

				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();

			System.out.println(send_idx+":보내는사람");
			System.out.println(receive_idx+":받는사람");

			System.out.println("내가 보낸 쪽지 조회 중 오류");
		}

		return list;
	}

	//내가 보낸 쪽지
	public List<MessageDTO> send_Message(int send_idx, int receive_idx){
		List<MessageDTO> list = new Vector<MessageDTO>();
		String sql = "select * from MessageTB where send_idx="+send_idx + " and receive_idx="+receive_idx+" order by m_num asc";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {

				MessageDTO dto = new MessageDTO();

				dto.setM_num(rs.getInt("m_num"));
				dto.setSend_idx(rs.getInt("send_idx"));
				dto.setSend_nickname(rs.getString("send_nickname"));
				dto.setReceive_idx(rs.getInt("receive_idx"));
				dto.setReceive_nickname(rs.getString("receive_nickname"));
				dto.setM_content(rs.getString("m_content"));

				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();

			System.out.println(send_idx+":보내는사람");
			System.out.println(receive_idx+":받는사람");

			System.out.println("내가 보낸 쪽지 조회 중 오류");
		}

		return list;
	}

	//나한테 온 쪽지 목록
	public List<MessageDTO> myListMessage(int idx){
		List<MessageDTO> list = new Vector<MessageDTO>();

		String sql = "select * from messageTB where receive_idx="+idx +"order by m_num desc";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				MessageDTO dto = new MessageDTO();

				dto.setM_num(rs.getInt("m_num"));
				dto.setSend_idx(rs.getInt("send_idx"));
				dto.setSend_nickname(rs.getString("send_nickname"));
				dto.setReceive_idx(rs.getInt("receive_idx"));
				dto.setReceive_nickname(rs.getString("receive_nickname"));
				dto.setM_content(rs.getString("m_content"));

				list.add(dto);


			}
		} catch (Exception e) {
			e.printStackTrace();

			System.out.println(idx+":받는사람");

			System.out.println("나한테 온 쪽지 조회 중 오류");
		}

		return list;
	}
	
}
