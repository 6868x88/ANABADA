package board.report;

public class ReportDTO {
	private int idx;
	private String reportedNickname;
	private String reporterNickname;
	private String reason;
	private java.sql.Date reportDate;
	private int reportCount;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
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

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
}
