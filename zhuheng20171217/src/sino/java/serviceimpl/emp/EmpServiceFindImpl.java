package sino.java.serviceimpl.emp;

import java.io.Serializable;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sino.java.dao.emp.EmpDAOFind;
import sino.java.po.common.PageView;
import sino.java.po.emp.Employee;
import sino.java.service.emp.EmpServiceFind;

@Service
public class EmpServiceFindImpl implements EmpServiceFind{
	
	@Autowired
	private EmpDAOFind empDAOFind;
	
	public Employee findById(Class<Employee> entityClass, Serializable id) {
		return empDAOFind.findById(entityClass, id);
	}

	public List<Employee> findAll(Class<Employee> entityClass, String sql) {
		return empDAOFind.findAll(entityClass, sql);
	}

	public PageView<Employee> findByPage(Class<Employee> entityClass, String sql, int pageNo, int pageSize) {
		return empDAOFind.findByPage(entityClass, sql, pageNo, pageSize);
	}

	public PageView<Employee> findByPage(Class<Employee> entityClass, String sql, Object key, int pageNo,
			int pageSize) {
		return empDAOFind.findByPage(entityClass, sql, key, pageNo, pageSize);
	}

	public PageView<Employee> findByPage(Class<Employee> entityClass, String sql, Object[] keys, int pageNo,
			int pageSize) {
		return empDAOFind.findByPage(entityClass, sql, keys, pageNo, pageSize);
	}

}
