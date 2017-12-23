package sino.java.daoimpl.dep;

import org.springframework.stereotype.Repository;
import sino.java.dao.dep.DepDAO;
import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.dep.Department;

@Repository("depDAO")
public class DepDAOImpl extends AbstractFinder<Department>  implements DepDAO{
	
}
