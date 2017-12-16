package sino.java.dao.impl;

import sino.java.dao.UserDao;
import sino.java.po.User;

public class UserDaoImpl implements UserDao{

	public int save(User user) {
		System.out.println("hello zhuheng["+user.toString()+"]");	
		return 0;
	}

}
