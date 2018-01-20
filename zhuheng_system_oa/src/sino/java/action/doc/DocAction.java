package sino.java.action.doc;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

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
	

	public int getWorkFlowId() {
		return workFlowId;
	}

	public void setWorkFlowId(int workFlowId) {
		this.workFlowId = workFlowId;
	}
	
	
}
