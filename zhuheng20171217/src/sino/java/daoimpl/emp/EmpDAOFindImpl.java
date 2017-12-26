package sino.java.daoimpl.emp;

import org.springframework.stereotype.Repository;

import sino.java.dao.emp.EmpDAOFind;
import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.emp.Employee;

@Repository("empDAOFind")
public class EmpDAOFindImpl extends AbstractFinder<Employee>  implements EmpDAOFind{

}
