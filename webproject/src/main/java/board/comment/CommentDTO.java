package board.comment;

public class CommentDTO {
	private int comm_num;
	private int idx;
	private int board_num;
	private int title_num;
	private String comm;
	private String nickname;
	private java.sql.Date comm_date;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getTitle_num() {
		return title_num;
	}

	public void setTitle_num(int title_num) {
		this.title_num = title_num;
	}

	public String getComm() {
		return comm;
	}

	public void setComm(String comm) {
		this.comm = comm;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public java.sql.Date getComm_date() {
		return comm_date;
	}

	public void setComm_date(java.sql.Date comm_date) {
		this.comm_date = comm_date;
	}

	public int getComm_num() {
		return comm_num;
	}

	public void setComm_num(int comm_num) {
		this.comm_num = comm_num;
	}
}
