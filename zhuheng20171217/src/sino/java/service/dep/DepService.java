package sino.java.service.dep;

import java.io.Serializable;

import sino.java.dao.base.BaseFinder;
import sino.java.po.dep.Department;

public interface DepService extends BaseFinder<Department>{
	public void addDep(Department dep);
	
	public void deleteDep(Department dep);
	
	public void save(Object obj);
	
	/*
	 * 
	 */
	public void delete(Object obj);
	
	/*
	 * 
	 */
	public void update(Object obj);
	
	/*
	 * 
	 */
	public void saveOrUpdate(Object obj);
	
	public <T> void remove(Class<T> entity, Serializable id);
	
}
