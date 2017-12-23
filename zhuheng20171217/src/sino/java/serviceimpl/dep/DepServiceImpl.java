package sino.java.serviceimpl.dep;

import org.springframework.stereotype.Service;

import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.dep.Department;
import sino.java.service.dep.DepService;
@Service("depService")
public class DepServiceImpl extends AbstractFinder<Department>  implements DepService{

}
