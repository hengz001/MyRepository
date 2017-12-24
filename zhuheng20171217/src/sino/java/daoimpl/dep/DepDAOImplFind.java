package sino.java.daoimpl.dep;

import org.springframework.stereotype.Repository;
import sino.java.dao.dep.DepDAOFind;
import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.dep.Department;

@Repository("depDAOFind")
public class DepDAOImplFind extends AbstractFinder<Department>  implements DepDAOFind{
	
}
