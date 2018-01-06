package sino.java.serviceimpl.impower;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.impower.Impower;
import sino.java.po.module.Module;
import sino.java.po.user.User;
import sino.java.service.impower.ImpowerServiceFinder;
import sino.java.service.mod.ModServiceFind;
import sino.java.service.mod.ModuleService;
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
			
		}
		
		User user = userFind.findById(User.class, u_id);
		
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
			
		}
		return flag;
	}
}
