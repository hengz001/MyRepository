package sino.java.po.doc;

import java.util.Date;

import sino.java.po.user.User;
import sino.java.po.workFlow.WorkFlow;

public class Document {
	private int dom_id;
	private String doc_title;
	private String doc_desc;
	private byte[] content;
	private User creator;
	private Date createTime;
	private WorkFlow workFLow;
	private long processInstanceId;
	private String status;
	private String  loadName;
	private int flag;
	
	public final static String STATUS_NEW = "新建";
	public final static String STATUS_ING = "审核中";
	public final static String STATUS_END = "结束";
	
	public int getDom_id() {
		return dom_id;
	}
	public void setDom_id(int dom_id) {
		this.dom_id = dom_id;
	}
	public String getDoc_title() {
		return doc_title;
	}
	public void setDoc_title(String doc_title) {
		this.doc_title = doc_title;
	}
	public String getDoc_desc() {
		return doc_desc;
	}
	public void setDoc_desc(String doc_desc) {
		this.doc_desc = doc_desc;
	}
	public byte[] getContent() {
		return content;
	}
	public void setContent(byte[] content) {
		this.content = content;
	}
	public User getCreator() {
		return creator;
	}
	public void setCreator(User creator) {
		this.creator = creator;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public WorkFlow getWorkFLow() {
		return workFLow;
	}
	public void setWorkFLow(WorkFlow workFLow) {
		this.workFLow = workFLow;
	}
	public long getProcessInstanceId() {
		return processInstanceId;
	}
	public void setProcessInstanceId(long processInstanceId) {
		this.processInstanceId = processInstanceId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLoadName() {
		return loadName;
	}
	public void setLoadName(String loadName) {
		this.loadName = loadName;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}

}
