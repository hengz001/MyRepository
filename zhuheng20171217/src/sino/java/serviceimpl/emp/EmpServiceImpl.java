package sino.java.serviceimpl.emp;

import java.io.Serializable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sino.java.dao.emp.EmpDAO;
import sino.java.service.emp.EmpService;

@Service
public class EmpServiceImpl implements EmpService{

	@Autowired
	private EmpDAO empDAO;
	
	public void save(Object obj) {
		empDAO.save(obj);
	}

	public void delete(Object obj) {
		empDAO.delete(obj);
	}

	public void update(Object obj) {
		empDAO.update(obj);
	}

	public void saveOrUpdate(Object obj) {
		empDAO.saveOrUpdate(obj);		
	}

	public <T> void remove(Class<T> entity, Serializable id) {
		empDAO.remove(entity, id);
	}

	public <T> void deleteByLogic(Class<T> entity, Serializable[] ids, String id, String flag) {
		empDAO.deleteByLogic(entity, ids, id, flag);
	}

}
