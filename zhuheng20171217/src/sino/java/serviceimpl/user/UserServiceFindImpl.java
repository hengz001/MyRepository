package sino.java.serviceimpl.user;

import org.springframework.stereotype.Service;

import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.user.User;
import sino.java.service.user.UserServiceFind;

@Service("userServiceFind")
public class UserServiceFindImpl extends AbstractFinder<User> implements UserServiceFind{


}
