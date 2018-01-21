package sino.java.serviceimpl.doc;

import org.jbpm.JbpmContext;
import org.jbpm.graph.def.ProcessDefinition;
import org.jbpm.graph.exe.ProcessInstance;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sino.java.daoimpl.base.AbstractDAO;
import sino.java.po.doc.Document;
import sino.java.po.workFlow.WorkFlow;
import sino.java.service.doc.DocumentService;

@Service("documentService")
@Transactional
public class DocumentServiceImpl extends AbstractDAO implements DocumentService{

	public void addDocForProcess(Document doc, WorkFlow wf) {
		save(doc);
		long processInstanceId = addProcessInstance(wf.getWf_name(), doc.getDom_id());
		doc.setProcessInstanceId(processInstanceId);
		doc.setWorkFLow(wf);
		update(doc);
	}

	//得到流程实例的ID (得到流程的实例 且返回实例的ID 将公文的ID 通过变量设置在上下文中)
	public long addProcessInstance(String wf_name,int documentId) {
		JbpmContext context = getContext();
		//通过流程名称得到流程定义
		ProcessDefinition pd = context.getGraphSession().findLatestProcessDefinition(wf_name);
		//通过流程定义取得流程实例
		ProcessInstance pe = new ProcessInstance(pd);
		//将公文的ID 通过变量设置在上下文中
		pe.getContextInstance().createVariable("document", documentId);
		//存储流程实例到数据库中
		context.save(pe);
		return pe.getId();
	}
}
