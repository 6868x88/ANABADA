package board.free;

public class FreeBoardDTO {

	private int idx;
	private int free_num;
	private java.sql.Date free_date;
	private String free_title;
	private String free_contents;
	private int free_count;
	private String nickname;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getFree_num() {
		return free_num;
	}
	public void setFree_num(int free_num) {
		this.free_num = free_num;
	}
	public java.sql.Date getFree_date() {
		return free_date;
	}
	public void setFree_date(java.sql.Date free_date) {
		this.free_date = free_date;
	}
	public String getFree_title() {
		return free_title;
	}
	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}
	public String getFree_contents() {
		return free_contents;
	}
	public void setFree_contents(String free_contents) {
		this.free_contents = free_contents;
	}
	public int getFree_count() {
		return free_count;
	}
	public void setFree_count(int free_count) {
		this.free_count = free_count;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



}
