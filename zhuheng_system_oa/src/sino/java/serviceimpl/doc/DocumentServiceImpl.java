package sino.java.serviceimpl.doc;

import java.util.ArrayList;
import java.util.List;

import org.jbpm.JbpmContext;
import org.jbpm.graph.def.ProcessDefinition;
import org.jbpm.graph.def.Transition;
import org.jbpm.graph.exe.ProcessInstance;
import org.jbpm.taskmgmt.exe.TaskInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sino.java.daoimpl.base.AbstractDAO;
import sino.java.po.doc.Document;
import sino.java.po.user.User;
import sino.java.po.workFlow.WorkFlow;
import sino.java.service.doc.DocumentService;
import sino.java.service.doc.DocumentServiceFind;

@Service("documentService")
@Transactional
public class DocumentServiceImpl extends AbstractDAO implements DocumentService{

	@Autowired
	private DocumentServiceFind documentServiceFind;
	
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
	
	public List<String> findNextStepTransition(long processInstanceId){
		List<String> transitions = new ArrayList<String>();
		JbpmContext context = getContext();
		ProcessInstance pe = context.getProcessInstance(processInstanceId);
		List<Transition> nextSteps = pe.getRootToken().getNode().getLeavingTransitions();
		for(Transition transition:nextSteps){
			transitions.add(transition.getName());
		}
		return transitions;
	}

	//提交公文
	//uname 得到当前用户的工作列表
	//dom_id 取得Doc对象 得到流程实例ID 得到流程实例
	//transitionName 路由名称
	public void applyDoc(String uname,Document doc,String transitionName) {
		String status = getStatus(uname, doc.getProcessInstanceId(), transitionName);
		doc.setStatus(status);
		update(doc);
	}
	//辅助方法 提交公文后得到对应的公文状态
	private String getStatus(String uname,long processInstanceId,String transitionName) {
		JbpmContext context = getContext();
		String status = null;
		//得到流程实例
		ProcessInstance pi = context.getProcessInstance(processInstanceId);
		//得到当前的节点
		String currentNodeName = pi.getRootToken().getNode().getName();
		//得到起始节点
		String startNodeName = pi.getProcessDefinition().getStartState().getName();
		
		if(currentNodeName.equals(startNodeName)) {
			//是开始节点 通过signal()来触发流程向下一步流动
			pi.getRootToken().signal(transitionName);
		} else {
			//首先找出当前用户的当前任务
			List<TaskInstance> tasks = context.getTaskMgmtSession().findTaskInstances(uname);
			for(TaskInstance task : tasks) {
				if(task.getProcessInstance().getId()==processInstanceId) {
					task.end(transitionName);
					break;
				}
			}
		}
		//将公文当前所处的节点作为状态信息返回
		status = pi.getRootToken().getNode().getName();
		//判断当前的状态是否结束
		if(pi.hasEnded()) {
			status = Document.STATUS_END;
		}
		return status;
	}
	
	// 通过用户ID得到对应的待审公文
		public List<Document> findApproveingDoc(User user) {
			String u_name = user.getU_name();
			//取得对应的公文ID集合
			List<Integer> docIds = findApproveingByname(u_name);
			if(docIds.size()!=0) {
				String hql = "from Document d where d.dom_id in (:ids)";
				return documentServiceFind.findAllByCollection(Document.class, hql, docIds);
			} else {
				return new ArrayList<Document>();
			}
		}

		// 通过用户名取得对应的公文ID集
		public List<Integer> findApproveingByname(String u_name) {
			// 通过用户名得到任务列表
			JbpmContext context = getContext();
			List<Integer> docIds = new ArrayList<Integer>();
			List<TaskInstance> tasks = context.getTaskMgmtSession()
					.findTaskInstances(u_name);
			for (TaskInstance task : tasks) {
				Integer docId = (Integer) task.getProcessInstance()
						.getContextInstance().getVariable("document");
				docIds.add(docId);
			}
			return docIds;
		}
}


