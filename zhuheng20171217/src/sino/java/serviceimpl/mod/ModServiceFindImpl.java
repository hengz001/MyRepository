package sino.java.serviceimpl.mod;

import org.springframework.stereotype.Service;
import sino.java.daoimpl.base.AbstractFinder;
import sino.java.po.common.PageView;
import sino.java.po.module.Module;
import sino.java.service.mod.ModServiceFind;

@Service("modServiceFind")
public class ModServiceFindImpl extends AbstractFinder<Module> implements ModServiceFind{
	
	public  PageView<Module> findByPage(int mid, int pageNo, int pageSize){
		if(mid == 0){
			return  super.findByPage(Module.class, "FROM Module m WHERE m.flag=1 and m.parent=null", pageNo, pageSize);
		}else{
			return  super.findByPage(Module.class, "FROM Module m WHERE m.flag=1 and m.parent.m_id="+mid, pageNo, pageSize);
		}
	}
}
