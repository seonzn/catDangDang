package cdd.model.dto;

public class ReportsDTO {
	private Integer report_num;
	private String reporterId;
	private String repotedId;
	private String reportCate;
	private String reportContent;
	private String reportRink;
	private Integer reportState;
	
	public Integer getReport_num() {
		return report_num;
	}
	public void setReport_num(Integer report_num) {
		this.report_num = report_num;
	}
	public String getReporterId() {
		return reporterId;
	}
	public void setReporterId(String reporterId) {
		this.reporterId = reporterId;
	}
	public String getRepotedId() {
		return repotedId;
	}
	public void setRepotedId(String repotedId) {
		this.repotedId = repotedId;
	}
	public String getReportCate() {
		return reportCate;
	}
	public void setReportCate(String reportCate) {
		this.reportCate = reportCate;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public String getReportRink() {
		return reportRink;
	}
	public void setReportRink(String reportRink) {
		this.reportRink = reportRink;
	}
	public Integer getReportState() {
		return reportState;
	}
	public void setReportState(Integer reportState) {
		this.reportState = reportState;
	}
}
