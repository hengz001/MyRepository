package sino.java.service.impower;

import java.util.List;

import sino.java.dao.base.BaseFinder;
import sino.java.po.impower.Impower;
import sino.java.po.module.Module;

public interface ImpowerServiceFinder extends BaseFinder<Impower>{
	
	//获取权限
	public Impower findImpower(int mainBody_id,String mainBody_type,int module_id);
	
	//认证
	public boolean hasOptionAt(int u_id,String m_name,String str);
	
	//辅助认证 
	public boolean hasOption(int u_id,int m_id,String str);
	
	//获取用户可访问模块
	public List<Module> findByUser(int u_id);
	//获取用户权限
	public List<Impower> findByUserId(int u_id);
	
	//获取分组权限
	public List<Impower> findByGroupId(int g_id);
}
