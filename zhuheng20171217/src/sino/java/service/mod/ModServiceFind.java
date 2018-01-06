package sino.java.service.mod;

import sino.java.common.PageView;
import sino.java.dao.base.BaseFinder;
import sino.java.po.module.Module;

public interface ModServiceFind extends BaseFinder<Module>{
	
	public  PageView<Module> findByPage(int mid, int pageNo, int pageSize);
	
}
