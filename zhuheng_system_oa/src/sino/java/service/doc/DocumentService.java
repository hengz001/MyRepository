package sino.java.service.doc;

import java.util.List;

import sino.java.dao.base.BaseDAO;
import sino.java.po.doc.Document;
import sino.java.po.user.User;
import sino.java.po.workFlow.WorkFlow;

public interface DocumentService extends BaseDAO{
	// 添加公文 并绑定流程
	public void addDocForProcess(Document doc,WorkFlow wf);
	//根据公文对应的流程实例ID 找到对应的路由集合
	public List<String> findNextStepTransition(long processInstanceId);
	//提交公文（提交申请）
	public void applyDoc(String uname,Document doc,String transitionName);
	//根据用户取得待审的公文信息
	public List<Document> findApproveingDoc(User user);

}
