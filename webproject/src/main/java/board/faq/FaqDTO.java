package board.faq;

public class FaqDTO {
	private int q_num;
	private int q_category;
	private String q_title;
	private String q_content;

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public int getQ_category() {
		return q_category;
	}

	public void setQ_category(int q_category) {
		this.q_category = q_category;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

}
