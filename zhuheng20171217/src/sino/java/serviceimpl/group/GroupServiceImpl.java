package sino.java.serviceimpl.group;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sino.java.daoimpl.base.AbstractDAO;
import sino.java.po.group.Group;
import sino.java.po.user.User;
import sino.java.service.group.GroupService;
import sino.java.service.group.GroupServiceFinder;
import sino.java.service.user.UserServiceFind;

@Service("groupService")
public class GroupServiceImpl extends AbstractDAO implements GroupService{	
	
	@Autowired
	private GroupServiceFinder groupFind;
	
	@Autowired
	private UserServiceFind userFind ;
	
	public void deleteGroup(int g_id){
		Group group = groupFind.findById(Group.class, g_id); 
		int gid = 0;
		if(null!=group && group.getG_name().equals("公共组")){
			gid = group.getG_id();
//			System.out.println("不允许删除公共组");
		}else{
			Set<User> users =group.getUsers();
			for(User user : users){
				user.setGroup(groupFind.findById(Group.class, gid));
			}
		}
	}
	
	public void updateGroup(int u_id,int g_id){
		User user = userFind.findById(User.class, u_id);
		Group group = groupFind.findById(Group.class, g_id);
		user.setGroup(group);
		update(user);
	}
}
