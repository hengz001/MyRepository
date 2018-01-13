package sino.java.service.group;

import sino.java.dao.base.BaseDAO;

public interface GroupService extends BaseDAO{
	public void deleteGroup(int g_id);
	
	public void updateGroup(int u_id,int g_id);
}
