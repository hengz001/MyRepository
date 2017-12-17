package sino.java.dao.impl;


import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;

import sino.java.dao.UserDao;
import sino.java.po.User;

@Service
public class UserDaoImpl extends HibernateDaoSupport implements UserDao{
	
	private Session session;

	public int save(User user) {
		System.out.println("hello zhuheng["+user.toString()+"]");	
		session.save(user);
		return 0;
	}

	public Session getSession() {
		return session;
	}
	
	public void setSession(Session session) {
		this.session = session;
	}
	
	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
		setSession(sessionFactory.openSession());
	}

}
