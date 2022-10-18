package board.notice;

public class NoticeBoardDTO {
	private int n_num;
	private String n_title;
	private java.sql.Date n_date;
	private int n_count;
	private String n_content;
	private int idx;

	public int getN_num() {
		return n_num;
	}

	public void setN_num(int n_num) {
		this.n_num = n_num;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public java.sql.Date getN_date() {
		return n_date;
	}

	public void setN_date(java.sql.Date n_date) {
		this.n_date = n_date;
	}

	public int getN_count() {
		return n_count;
	}

	public void setN_count(int n_count) {
		this.n_count = n_count;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

}
