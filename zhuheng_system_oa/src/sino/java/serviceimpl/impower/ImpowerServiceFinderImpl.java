package sino.java.serviceimpl.impower;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.impower.Impower;
import sino.java.po.module.Module;
import sino.java.po.user.User;
import sino.java.service.impower.ImpowerServiceFinder;
import sino.java.service.mod.ModServiceFind;
import sino.java.service.user.UserServiceFind;

@Service("impowerServiceFinder")
public class ImpowerServiceFinderImpl extends AbstractFinder<Impower> implements ImpowerServiceFinder{

	@Autowired
	private UserServiceFind userFind;
	
	@Autowired 
	private ModServiceFind moduleFind;
	
	public boolean hasOptionAt(int u_id,String m_name,String str){
		int m_id=-1;
		Module module = moduleFind.findByKeys(Module.class,
												"FROM Module mod WHERE mod.m_name=?",
												new Object[]{m_name});
		if(null != module){
			m_id = module.getM_id();
		}
	
		return hasOption(u_id, m_id, str);
	}
	
	public Impower findImpower(int mainBody_id,String mainBody_type,int module_id){
		Impower impower = null;
		impower = findByKeys(Impower.class, 
				"FROM Impower i WHERE i.mainBody_id=?"
				+ "AND i.mainBody_type=?"
				+ "AND i.module_id=?",
				new Object[]{mainBody_id,mainBody_type,module_id});
		return impower;
	}
	
	public boolean hasOption(int u_id,int m_id,String str){
		boolean flag = false;
		Impower impower = findImpower(u_id, Impower.USER_TYPE, m_id);
		if(null != impower){
			if("a".equals(str)){
				int index = impower.getSaveOption();
				if(index == 1){
					flag = true;
				}
			}
			if("r".equals(str)){
				int index = impower.getQueryOption();
				if(index == 1){
					flag = true;
				}
			}
			if("u".equals(str)){
				int index = impower.getUpdateOption();
				if(index == 1){
					flag = true;
				}
			}
			if("d".equals(str)){
				int index = impower.getDeleteOption();
				if(index == 1){
					flag = true;
				}
			}
			if("e".equals(str)){
				int index = impower.getExtOption();
				if(index == 1){
					flag = true;
				}
			}
			
		}
		
		User user = userFind.findById(User.class, u_id);
		if(null==user){
			return flag;
		}
		if(null == user.getGroup()){
			return flag;
		}
		
		int gId = user.getGroup().getG_id();
		Impower imp = findImpower(gId, Impower.GROUP_TYPE, m_id);
		if(null != imp){
			if("a".equals(str)){
				int index = imp.getSaveOption();
				if(index == 1){
					flag = true;
				}
			}
			if("r".equals(str)){
				int index = imp.getQueryOption();
				if(index == 1){
					flag = true;
				}
			}
			if("u".equals(str)){
				int index = imp.getUpdateOption();
				if(index == 1){
					flag = true;
				}
			}
			if("d".equals(str)){
				int index = imp.getDeleteOption();
				if(index == 1){
					flag = true;
				}
			}
			if("e".equals(str)){
				int index = imp.getExtOption();
				if(index == 1){
					flag = true;
				}
			}
			
		}
		return flag;
	}
	
	public List<Module> findByUser(int u_id){
		Map<Integer, Impower> maps = new HashMap<Integer, Impower>();
		
		//获取用户组
		User user = userFind.findById(User.class, u_id);
		
		//获取用户组权限
		if(null != user){
			if(null != user.getGroup()){
				int g_id = user.getGroup().getG_id();
				List<Impower> g_impowers = findByGroupId(g_id);
				for (Impower impower : g_impowers) {
					maps.put(impower.getModule_id(),impower);
				}
			}
		}
		
		//获取用户权限
		List<Impower> u_imps = findByUserId(u_id,0);
		for (Impower impower : u_imps) {
			maps.put(impower.getModule_id(),impower);
		}
		
		//判断权限
		List<Integer> nrID = new ArrayList<Integer>();
		Set<Map.Entry<Integer,Impower>> entrys = maps.entrySet();
		for (Map.Entry<Integer, Impower> entry : entrys) {
			Impower imp = entry.getValue();
			if(imp.getQueryOption()==0){
				nrID.add(entry.getKey());
			}
		}
		
		//删除没有查看权限的模块
		for (Integer key : nrID) {
			maps.remove(key);
		}
		
		//是否存在模块
		if(maps.isEmpty()){
			return new ArrayList<Module>();
		}
		
		List<Module> mods = moduleFind.findAllByCollection(Module.class,
				"FROM Module m WHERE m.m_id in (:ids)",maps.keySet());
		
		return mods;
	}
	
	public List<Impower> findByUserId(int u_id, int ext_id){
		return findAllKeys(Impower.class, 
				"FROM Impower imp WHERE imp.mainBody_id=? AND imp.mainBody_type=? AND imp.extOption=?", 
				new Object[]{u_id,Impower.USER_TYPE,ext_id});
	}
	
	public List<Impower> findByUserId(int u_id){
		return findAllKeys(Impower.class, 
				"FROM Impower imp WHERE imp.mainBody_id=? AND imp.mainBody_type=?", 
				new Object[]{u_id,Impower.USER_TYPE});
	}
	
	public List<Impower> findByGroupId(int g_id){
		return findAllKeys(Impower.class, 
				"FROM Impower imp WHERE imp.mainBody_id=? AND imp.mainBody_type=?", 
				new Object[]{g_id,Impower.GROUP_TYPE});
	}
}
