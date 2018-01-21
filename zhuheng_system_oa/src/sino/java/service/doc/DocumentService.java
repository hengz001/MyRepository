package sino.java.service.doc;

import sino.java.dao.base.BaseDAO;
import sino.java.po.doc.Document;
import sino.java.po.workFlow.WorkFlow;

public interface DocumentService extends BaseDAO{
	// 添加公文 并绑定流程
	public void addDocForProcess(Document doc,WorkFlow wf);
}
