package sino.java.serviceimpl.workFlow;


import org.springframework.stereotype.Service;
import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.workFlow.WorkFlow;
import sino.java.service.workFlow.WorkFlowServiceFinder;

@Service("workFlowServiceFinder")
public class WorkFlowServiceFinderImpl extends AbstractFinder<WorkFlow> implements WorkFlowServiceFinder {
	
}
