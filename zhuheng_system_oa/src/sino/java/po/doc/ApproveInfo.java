package sino.java.po.doc;

import java.util.Date;

import sino.java.po.user.User;

public class ApproveInfo {
	private int ao_id;
	private String comment;
	private Date approveTime;
	private Document document;
	private User approver;
	public int getAo_id() {
		return ao_id;
	}
	public void setAo_id(int ao_id) {
		this.ao_id = ao_id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getApproveTime() {
		return approveTime;
	}
	public void setApproveTime(Date approveTime) {
		this.approveTime = approveTime;
	}
	public Document getDocument() {
		return document;
	}
	public void setDocument(Document document) {
		this.document = document;
	}
	public User getApprover() {
		return approver;
	}
	public void setApprover(User approver) {
		this.approver = approver;
	}
	
}
