package sino.java.serviceimpl.workFlow;

import org.springframework.stereotype.Service;
import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.workFlow.WorkFlow;
import sino.java.service.workFlow.WorkFlowServiceFind;

@Service("workFlowServiceFind")
public class WorkFlowServiceImpFind extends AbstractFinder<WorkFlow> implements WorkFlowServiceFind{

}
