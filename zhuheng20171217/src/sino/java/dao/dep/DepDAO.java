package sino.java.dao.dep;


import sino.java.dao.base.BaseDAO;
import sino.java.po.dep.Department;

public interface DepDAO extends BaseDAO{
	
	public void updateDep(int id,Department dep);
	
}
