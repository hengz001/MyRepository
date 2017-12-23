package sino.java.daoimpl.base;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sino.java.dao.IDAO;

@Service
public class IDAOImpl implements IDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return this.sessionFactory.openSession();
	}

	public void save(Object obj) {
//		session.save(obj);
		getSession().save(obj);
	}

	public void delete(Object obj) {
//		session.delete(obj);
		getSession().delete(obj);
	}

	public void update(Object obj) {
//		session.update(obj);
		getSession().update(obj);
	}

	public void saveOrUpdate(Object obj) {
//		session.saveOrUpdate(obj);
		getSession().saveOrUpdate(obj);
	}

	public <T> void remove(Class<T> entity, Serializable id) {
//		session.delete(session.load(entity, id));
		getSession().delete(getSession().load(entity, id));
	}

}
