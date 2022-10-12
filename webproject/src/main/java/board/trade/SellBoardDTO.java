package board.trade;

public class SellBoardDTO {
	private int idx;
	private int sell_num;
	private String sell_title;
	private String sell_contents;
	private int sell_category;
	private int sell_price;
	private String user_picture;
	private int board_num;
	private int sell_condition;
	private String nickname;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getSell_num() {
		return sell_num;
	}
	public void setSell_num(int sell_num) {
		this.sell_num = sell_num;
	}
	public String getSell_title() {
		return sell_title;
	}
	public void setSell_title(String sell_title) {
		this.sell_title = sell_title;
	}
	public String getSell_contents() {
		return sell_contents;
	}
	public void setSell_contents(String sell_contents) {
		this.sell_contents = sell_contents;
	}
	public int getSell_category() {
		return sell_category;
	}
	public void setSell_category(int sell_category) {
		this.sell_category = sell_category;
	}
	public int getSell_price() {
		return sell_price;
	}
	public void setSell_price(int sell_price) {
		this.sell_price = sell_price;
	}
	public String getUser_picture() {
		return user_picture;
	}
	public void setUser_picture(String user_picture) {
		this.user_picture = user_picture;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getSell_condition() {
		return sell_condition;
	}
	public void setSell_condition(int sell_condition) {
		this.sell_condition = sell_condition;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
