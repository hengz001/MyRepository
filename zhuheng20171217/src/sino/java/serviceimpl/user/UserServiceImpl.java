package sino.java.serviceimpl.user;
import org.springframework.stereotype.Service;
import sino.java.daoimpl.base.AbstractDAO;
import sino.java.service.user.UserService;

@Service("userService")
public class UserServiceImpl extends AbstractDAO implements UserService{

}
