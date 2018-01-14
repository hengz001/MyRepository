package sino.java.service.workFlow;

import sino.java.dao.base.BaseDAO;

public interface WorkFlowService extends BaseDAO {
   //部署流程
	public void deployProcess(byte[] processFile,byte[] processImg);
}
