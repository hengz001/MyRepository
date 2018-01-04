package sino.java.serviceimpl.user;

import org.springframework.stereotype.Service;

import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.user.User;
import sino.java.service.user.UserServiceFind;

@Service("userServiceFind")
public class UserServiceFindImpl extends AbstractFinder<User> implements UserServiceFind{
	
	public User login(User user){
		User obj = null;
		obj = super.findByKeys(User.class, 
				"FROM User u WHERE u.u_name=? AND u.u_pwd=?",new Object[]{user.getU_name(),user.getU_pwd()});
		return obj;
	}
}
