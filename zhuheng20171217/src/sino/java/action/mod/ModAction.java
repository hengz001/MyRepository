package sino.java.action.mod;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import sino.java.po.common.PageView;
import sino.java.po.module.Module;
import sino.java.service.mod.ModServiceFind;

public class ModAction {
	
	@Autowired
	ModServiceFind modServiceFind;
	
	//分页显示模式
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		
		int mid = 0;
		String smid ;
		int pageNo = 0;
		int pageSize = 5;
		
		smid = request.getParameter("mid");
		if(null != smid && !smid.equals("")){
			mid = Integer.parseInt(smid);
		}
		
		PageView<Module> pv = modServiceFind.findByPage(mid, pageNo, pageSize);
		request.setAttribute("pv",pv);
		
		return "index";
	}
}
