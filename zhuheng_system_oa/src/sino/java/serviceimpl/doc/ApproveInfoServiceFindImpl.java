package sino.java.serviceimpl.doc;

import org.springframework.stereotype.Service;

import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.doc.ApproveInfo;
import sino.java.service.doc.ApproveInfoServiceFind;

@Service("approveInfoServiceFind")
public class ApproveInfoServiceFindImpl extends AbstractFinder<ApproveInfo> implements ApproveInfoServiceFind{

}
