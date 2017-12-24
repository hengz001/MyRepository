package sino.java.daoimpl.dep;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import sino.java.dao.dep.DepDAO;
import sino.java.daoimpl.base.AbstractDAO;
import sino.java.po.dep.Department;

@Repository("depDAO")
public class DepDAOImpl extends AbstractDAO implements DepDAO{
	
	@Autowired
	SessionFactory sessionFactory;
	
	public Session getSession(){
		return this.sessionFactory.openSession();
	}
	
	public void updateDep(int id, Department dep) {
			String sql = "UPDATE tb_dep SET dep_sn = ?,dep_name = ?,dep_desc = ? WHERE dep_id = ?";
			Query query = getSession().createQuery(sql);
			query.setParameter(0, dep.getDep_sn());
			query.setParameter(1, dep.getDep_name());
			query.setParameter(2, dep.getDep_desc());
			query.setParameter(3, id);
			query.executeUpdate();
	}

}
