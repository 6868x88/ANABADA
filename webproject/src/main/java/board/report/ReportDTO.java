package board.report;

public class ReportDTO {
	private int idx;
	private String boardName;
	private String reportedNickname;
	private String reporterNickname;
	private String reason;
	private java.sql.Date reportDate;
	private int countReport;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public String getReportedNickname() {
		return reportedNickname;
	}

	public void setReportedNickname(String reportedNickname) {
		this.reportedNickname = reportedNickname;
	}

	public String getReporterNickname() {
		return reporterNickname;
	}

	public void setReporterNickname(String reporterNickname) {
		this.reporterNickname = reporterNickname;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public java.sql.Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(java.sql.Date reportDate) {
		this.reportDate = reportDate;
	}

	public int getCountReport() {
		return countReport;
	}

	public void setCountReport(int countReport) {
		this.countReport = countReport;
	}

}
