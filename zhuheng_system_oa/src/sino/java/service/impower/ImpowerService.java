package sino.java.service.impower;

import sino.java.dao.base.BaseDAO;
import sino.java.po.impower.Impower;

public interface ImpowerService extends BaseDAO{
	public void impower(int mainBody_id,String mainBody_type,String str,int module_id);

	public Impower findImpower(int mainBody_id,String mainBody_type,int module_id);
}
