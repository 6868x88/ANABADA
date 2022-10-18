package board.message;

public class MessageDTO {
	private int m_num;
	private int send_idx;
	private String send_nickname;
	private int receive_idx;

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public int getSend_idx() {
		return send_idx;
	}

	public void setSend_idx(int send_idx) {
		this.send_idx = send_idx;
	}

	public String getSend_nickname() {
		return send_nickname;
	}

	public void setSend_nickname(String send_nickname) {
		this.send_nickname = send_nickname;
	}

	public int getReceive_idx() {
		return receive_idx;
	}

	public void setReceive_idx(int receive_idx) {
		this.receive_idx = receive_idx;
	}

	public String getReceive_nickname() {
		return receive_nickname;
	}

	public void setReceive_nickname(String receive_nickname) {
		this.receive_nickname = receive_nickname;
	}

	public String getM_content() {
		return m_content;
	}

	public void setM_content(String m_content) {
		this.m_content = m_content;
	}

	private String receive_nickname;
	private String m_content;
}
