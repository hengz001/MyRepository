package sino.java.serviceimpl.dep;

import java.io.Serializable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sino.java.dao.dep.DepDAO;
import sino.java.po.dep.Department;
import sino.java.service.dep.DepService;

@Service("depService")
public class DepServiceImpl implements DepService{

	@Autowired
	private DepDAO depDAO;

	@Autowired
	private DepServiceImplFind depServiceFind;

	
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

	public <T> void remove(Class<T> entity, Serializable id) {
		depDAO.remove(entity, id);
	}

	public <T> void deleteByLogic(Class<T> entity, Serializable[] ids, String id, String flag) {
		depDAO.deleteByLogic(entity, ids, id, flag);
	}

	public void addDep(Department dep) {
		int pid = dep.getDep_id();
		if(0 != pid){
			Department obj = depServiceFind.findById(Department.class, pid);
			dep.setParent(obj);
		}
		dep.setFlag(1);
		depDAO.save(dep);
	}

	@Override
	public void updateDep(int id, Department dep) {
		depDAO.updateDep(id, dep);
	}
}
