package sino.java.serviceimpl;

import org.springframework.stereotype.Service;
import sino.java.base.AbstractFinder;
import sino.java.po.dep.Department;
import sino.java.service.DepService;

@Service("depService")
public class DepServiceImpl extends AbstractFinder<Department>  implements DepService{

}
