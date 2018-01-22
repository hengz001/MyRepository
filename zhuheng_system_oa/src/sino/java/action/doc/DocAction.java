package sino.java.action.doc;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import sino.java.po.doc.Document;
import sino.java.po.user.User;
import sino.java.po.workFlow.WorkFlow;
import sino.java.service.doc.DocumentService;
import sino.java.service.doc.DocumentServiceFind;
import sino.java.service.workFlow.WorkFlowServiceFinder;

public class DocAction {
	@Autowired
	private DocumentService documentService;
	
	@Autowired
	private DocumentServiceFind documentServiceFind;
	
	@Autowired
	private WorkFlowServiceFinder workFlowServiceFinder;
	
	private int workFlowId;
	
	private String doc_title;
	
	private String doc_desc;
	
	private File content;
	
	private String contentFileName;

	private int doc_id;
	
	//显示添加公文页面01
	public String addDoc(){
		HttpServletRequest request = ServletActionContext.getRequest();
		List<WorkFlow> wfs = workFlowServiceFinder.findAll(WorkFlow.class, 
				"FROM WorkFlow");
		request.setAttribute("wfs", wfs);
		return "addDoc";
	}
	
	//显示添加公文页面02
	public String addDoc02(){
		HttpServletRequest request = ServletActionContext.getRequest();
		WorkFlow workFlow = workFlowServiceFinder.findById(WorkFlow.class, workFlowId);
		request.setAttribute("workFlow",workFlow);
		return "addDoc02";
	}
	
	//添加公文
	public String addDoc03(){
		HttpServletRequest request = ServletActionContext.getRequest();
		//将公文信息添加进数据库
		//公文和流程进行绑定
		Document doc = new Document();
		doc.setCreateTime(new Date());
		doc.setDoc_title(doc_title);
		doc.setDoc_desc(doc_desc);
		doc.setLoadName(contentFileName);
		doc.setContent(getBytesFromFile(content));
		doc.setFlag(1);
		doc.setStatus(Document.STATUS_NEW);
		User user = (User)request.getSession().getAttribute("person");
		doc.setCreator(user);
		WorkFlow wf = workFlowServiceFinder.findById(WorkFlow.class, workFlowId);
		if(null != wf){
			documentService.addDocForProcess(doc, wf);
		}
		return "addDoc03";
	}
	
	//显示我的公文
	public String myDoc(){
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User)request.getSession().getAttribute("person");
		int u_id = user.getU_id();
		List<Document> myDocs = documentServiceFind.findAllKeys(Document.class, "from Document doc where doc.creator.u_id=?", new Object[]{u_id});
		request.setAttribute("myDocs", myDocs);
		return "myDoc";
	}
	
	//
	public String openSubmitDoc(){
		
		return "openSubmitDoc";
	}
	//下载 
	public String downloadDoc(){
		Document doc = documentServiceFind.findById(Document.class, doc_id);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.reset();
		String loadName = doc.getLoadName();
		response.setContentType("application/x-download;charset=utf-8");
		response.setHeader("content-Disposition", "attachment;filename="+loadName);
		try {
			OutputStream out = response.getOutputStream();
			out.write(doc.getContent());
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int getWorkFlowId() {
		return workFlowId;
	}

	public void setWorkFlowId(int workFlowId) {
		this.workFlowId = workFlowId;
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

	public File getContent() {
		return content;
	}

	public void setContent(File content) {
		this.content = content;
	}

	public String getContentFileName() {
		return contentFileName;
	}

	public void setContentFileName(String contentFileName) {
		this.contentFileName = contentFileName;
	}

	public int getDoc_id() {
		return doc_id;
	}

	public void setDoc_id(int doc_id) {
		this.doc_id = doc_id;
	}

	//文件转换为字节数组
	private byte[] getBytesFromFile(File file) {
		byte[] bte = null;
		try {
			if(file==null) {
				return null;
			}
			FileInputStream in = new FileInputStream(file);
			ByteArrayOutputStream out = new ByteArrayOutputStream(4000);
			byte[] b = new byte[4000];
			int n;
			while((n=in.read(b))!=-1) {
				out.write(b, 0, n);
			}
			in.close();
			out.close();
			bte = out.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bte;
	}
}
