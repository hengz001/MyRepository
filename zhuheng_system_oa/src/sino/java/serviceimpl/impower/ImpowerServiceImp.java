package sino.java.serviceimpl.impower;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sino.java.daoimpl.base.AbstractDAO;
import sino.java.po.impower.Impower;
import sino.java.service.impower.ImpowerService;
import sino.java.service.impower.ImpowerServiceFinder;

@Service("impowerService")
public class ImpowerServiceImp extends AbstractDAO implements ImpowerService{
	@Autowired
	private ImpowerServiceFinder impowerFind;
	
	public void impower(int mainBody_id,String mainBody_type,String str,int module_id){
		Impower impower = findImpower(mainBody_id, mainBody_type, module_id);
		if(null == impower){
			impower = new Impower();
			impower.setMainBody_id(mainBody_id);
			impower.setMainBody_type(mainBody_type);
			impower.setModule_id(module_id);
			impower.setOption(str);
			save(impower);
			return;
		}
		impower.setOption(str);
		update(impower);
		return ;
	}
	
	public Impower findImpower(int mainBody_id,String mainBody_type,int module_id){
		List<Object> lists = new ArrayList<Object>();
		lists.add(mainBody_id);
		lists.add(mainBody_type);
		lists.add(module_id);
		
		return impowerFind.findByKeys(Impower.class, 
				"FROM Impower i WHERE i.mainBody_id=? AND mainBody_type=? AND module_id=?",
				lists.toArray());
	}
}
