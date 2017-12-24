package sino.java.service.dep;

import sino.java.dao.base.BaseDAO;
import sino.java.po.dep.Department;

public interface DepService extends BaseDAO{
	
	public void addDep(Department dep);
	
	public void updateDep(int id,Department dep);
}
