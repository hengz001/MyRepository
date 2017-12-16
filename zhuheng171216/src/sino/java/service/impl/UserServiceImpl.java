package sino.java.service.impl;

import sino.java.dao.UserDao;
import sino.java.dao.impl.UserDaoImpl;
import sino.java.po.User;
import sino.java.service.UserService;

public class UserServiceImpl implements UserService{

	UserDao userDao = new UserDaoImpl();
	public int  save(User user) {
		return userDao.save(user);
	}

}
