package sino.java.daoimpl;

import java.io.Serializable;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sino.java.dao.IDAO;

@Service
public class IDAOImpl implements IDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
//	private Session session = sessionFactory.openSession();
//	@Resource(name = "sessionFactory")
//	public void setSuperSessionFactory(SessionFactory sessionFactory) {
//		super.setSessionFactory(sessionFactory);
//		session = sessionFactory.openSession();
//	}
	

	public void save(Object obj) {
//		session.save(obj);
		sessionFactory.openSession().save(obj);
	}

	public void delete(Object obj) {
//		session.delete(obj);
		sessionFactory.openSession().delete(obj);
	}

	public void update(Object obj) {
//		session.update(obj);
		sessionFactory.openSession().update(obj);
	}

	public void saveOrUpdate(Object obj) {
//		session.saveOrUpdate(obj);
		sessionFactory.openSession().saveOrUpdate(obj);
	}

	public <T> void remove(Class<T> entity, Serializable id) {
//		session.delete(session.load(entity, id));
		sessionFactory.openSession().delete(sessionFactory.openSession().load(entity, id));
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
