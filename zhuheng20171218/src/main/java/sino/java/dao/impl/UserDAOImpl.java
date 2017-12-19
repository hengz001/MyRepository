package sino.java.dao.impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import sino.java.dao.UserDAO;
import sino.java.po.User;

@Repository
public class UserDAOImpl extends HibernateDaoSupport implements UserDAO{

	public void save(User user) {
			if(null == getHibernateTemplate()){
				System.out.println("hibernate null");
			}
	}

}
