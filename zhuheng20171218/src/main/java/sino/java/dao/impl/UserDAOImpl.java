package sino.java.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sino.java.dao.UserDAO;
import sino.java.po.User;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return this.sessionFactory.getCurrentSession();
	} 
	
	public void save(User user) {
		System.out.println("UserDAO");
		getSession().save(user);
	}

}
