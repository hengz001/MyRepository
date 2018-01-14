package sino.java.serviceimpl.workFlow;


import java.io.ByteArrayInputStream;
import org.jbpm.graph.def.ProcessDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sino.java.daoimpl.base.AbstractDAO;
import sino.java.po.workFlow.WorkFlow;
import sino.java.service.workFlow.WorkFlowService;
import sino.java.service.workFlow.WorkFlowServiceFinder;


@Service("workFlowService")
public class WorkFlowServiceImpl extends AbstractDAO implements WorkFlowService {
	
	@Autowired
	private WorkFlowServiceFinder wsf;
	
	public void deployProcess(byte[] processFile,byte[] processImg) {
		//将文件部署到数据库中
		ProcessDefinition pd = ProcessDefinition.parseXmlInputStream(new ByteArrayInputStream(processFile));
		getContext().deployProcessDefinition(pd);
		//把数据存储在对应的tb_workFlow中
		//去到对应的WorkFlow (根据名称取出对象)
		WorkFlow wf = wsf.findByKeys(WorkFlow.class, "from WorkFlow wf where wf.wf_name=?",new Object[]{pd.getName()});
		if(wf==null) {
			wf = new WorkFlow();
			wf.setProcessFile(processFile);
			wf.setProcessImg(processImg);
			wf.setWf_name(pd.getName());
			wf.setFlag(1);
			save(wf);
			return;
		} 
		wf.setProcessFile(processFile);
		wf.setProcessImg(processImg);
		wf.setWf_name(pd.getName());
		update(wf);
	}
}
