package sino.java.serviceimpl.dep;

import java.io.Serializable;
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

}
