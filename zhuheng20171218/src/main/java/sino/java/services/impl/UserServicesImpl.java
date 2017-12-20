package sino.java.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sino.java.dao.UserDAO;
import sino.java.po.User;
import sino.java.services.UserServices;

@Service("userServices")
public class UserServicesImpl implements UserServices{

	@Autowired
	private UserDAO userDAO;
	public void save(User user) {
		userDAO.save(user);
	}

}
