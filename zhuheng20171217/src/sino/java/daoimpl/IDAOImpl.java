package sino.java.daoimpl;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;

import sino.java.dao.IDAO;

@Service
public class IDAOImpl extends HibernateDaoSupport implements IDAO{

	private Session session;
	
	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
		session = sessionFactory.openSession();
	}
	
	public void save(Object obj) {
		session.save(obj);
	}

	public void delete(Object obj) {
		session.delete(obj);
	}

	public void update(Object obj) {
		session.update(obj);
	}

	public void saveOrUpdate(Object obj) {
		session.saveOrUpdate(obj);
	}

}
