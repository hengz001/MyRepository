package sino.java.daoimpl.user;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;
import sino.java.dao.user.UserDAO;
import sino.java.po.user.User;

@Service
public class UserDAOImpl extends HibernateDaoSupport implements UserDAO{

	private Session session;
	
	public void save(User user) {
		session.save(user);
	}
	
	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
		session = sessionFactory.openSession();
	}
}
