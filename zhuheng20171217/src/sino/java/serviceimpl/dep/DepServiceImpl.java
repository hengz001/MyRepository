package sino.java.serviceimpl.dep;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sino.java.dao.dep.DepDAO;
import sino.java.po.common.PageView;
import sino.java.po.dep.Department;
import sino.java.service.dep.DepService;
@Service("depService")
public class DepServiceImpl implements DepService{

	@Autowired
	private DepDAO depDAO;
	
	public Department findById(Class<Department> entityClass, Serializable id) {
		return depDAO.findById(entityClass, id);
	}

	public List<Department> findAll(Class<Department> entityClass, String sql) {
		return depDAO.findAll(entityClass, sql);
	}

	public PageView<Department> findByPage(Class<Department> entityClass, String sql, int pageNo, int pageSize) {
		return depDAO.findByPage(entityClass, sql, pageNo, pageSize);
	}

	public PageView<Department> findByPage(Class<Department> entityClass, String sql, Object key, int pageNo,
			int pageSize) {
		return depDAO.findByPage(entityClass, sql, key, pageNo, pageSize);
	}

	public PageView<Department> findByPage(Class<Department> entityClass, String sql, Object[] keys, int pageNo,
			int pageSize) {
		return depDAO.findByPage(entityClass, sql, keys, pageNo, pageSize);
	}

	public void addDep(Department dep) {
		int pid = dep.getDep_id();
		if(0 != pid){
			dep.setParent(
					depDAO.findById(Department.class, pid)
					);
		}
		dep.setFlag("1");
		depDAO.save(dep);
	}

	public void save(Object obj) {
		depDAO.save(obj);
	}

	public void delete(Object obj) {
		depDAO.delete(obj);
	}

	public void update(Object obj) {
		depDAO.update(obj);
	}

	public void saveOrUpdate(Object obj) {
		depDAO.saveOrUpdate(obj);
	}

	public void deleteDep(Department dep) {
		dep.setFlag("0");
		depDAO.update(dep);
	}
	
	public <T> void remove(Class<T> entity, Serializable id){
		depDAO.remove(entity, id);
	}

	public void save(Object[] objs) {
		depDAO.save(objs);
	}

	public void delete(Object[] objs) {
		depDAO.delete(objs);
	}

	public void update(Object[] objs) {
		depDAO.update(objs);
	}

	public void saveOrUpdate(Object[] objs) {
		depDAO.saveOrUpdate(objs);
	}

	public <T> void save(Collection<T> objs) {
		depDAO.save(objs);
	}

	public <T> void delete(Collection<T> objs) {
		depDAO.delete(objs);
	}

	public <T> void update(Collection<T> objs) {
		depDAO.update(objs);
	}

	public <T> void saveOrUpdate(Collection<T> objs) {
		depDAO.saveOrUpdate(objs);
	}

	public <T> void deleteByLogic(Class<T> entity, Serializable[] ids, String id, String flag) {
		depDAO.deleteByLogic(entity, ids, id, flag);
	}
}
