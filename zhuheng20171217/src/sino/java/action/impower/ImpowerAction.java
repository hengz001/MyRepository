package sino.java.action.impower;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import sino.java.po.group.Group;
import sino.java.po.impower.Impower;
import sino.java.po.module.Module;
import sino.java.po.user.User;
import sino.java.service.group.GroupServiceFinder;
import sino.java.service.impower.ImpowerService;
import sino.java.service.impower.ImpowerServiceFinder;
import sino.java.service.mod.ModServiceFind;
import sino.java.service.user.UserServiceFind;

public class ImpowerAction {

	@Autowired
	private ImpowerService impowerService;
	
	@Autowired
	private ImpowerServiceFinder impowerFind;
	
	@Autowired
	private ModServiceFind modFind;
	
	@Autowired
	private GroupServiceFinder groupFind;
	
	@Autowired
	private UserServiceFind userFind;
	
	private int mainBodyId;
	
	private String mainBodyType;
	
	private Impower impower = new Impower();
	
	private String str; 
	
	private int module_id;
	
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
	
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml;charaset=UTF-8");
		
		try {
			PrintWriter out = response.getWriter();
			Impower impower = impowerService.findImpower(mainBodyId, mainBodyType, module_id);
			out.println("<impower>");
			out.println("<impower-saveOption>"+(null!=impower?impower.getSaveOption():0)+"</impower-saveOption>");
			out.println("<impower-queryOption>"+(null!=impower?impower.getQueryOption():0)+"</impower-queryOption>");
			out.println("<impower-updateOption>"+(null!=impower?impower.getUpdateOption():0)+"</impower-updateOption>");
			out.println("<impower-deleteOption>"+(null!=impower?impower.getDeleteOption():0)+"</impower-deleteOption>");
			out.println("</impower>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public String showImpowerView(){
		HttpServletRequest request = ServletActionContext.getRequest();
		if(null!=mainBodyType){
			if("group".equals(mainBodyType)){
				Group group = groupFind.findById(Group.class, mainBodyId);
				request.setAttribute("group", group);
			}else if("user".equals(mainBodyType)){
				User user = userFind.findById(User.class, mainBodyId);
				request.setAttribute("user", user);
			}
		}
		List<Module> modules = modFind.findAll(Module.class, 
				"FROM Module m WHERE m.flag=1");
		request.setAttribute("modules", modules);
		return "showImpowerView";
	}
	
	public String impower(){
		impowerService.impower(mainBodyId, mainBodyType, str, module_id);
		return "impower";
	}
	
	public String getUserModules(){
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User)request.getSession().getAttribute("person");
		int uid = user.getU_id();
		List<Module> modules = impowerFind.findByUser(uid);
		request.setAttribute("mods",modules);
		return "getUserModules";
	}

	public Impower getImpower() {
		return impower;
	}

	public void setImpower(Impower impower) {
		this.impower = impower;
	}

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	public int getModule_id() {
		return module_id;
	}

	public void setModule_id(int module_id) {
		this.module_id = module_id;
	}

	public int getMainBodyId() {
		return mainBodyId;
	}

	public void setMainBodyId(int mainBodyId) {
		this.mainBodyId = mainBodyId;
	}

	public String getMainBodyType() {
		return mainBodyType;
	}

	public void setMainBodyType(String mainBodyType) {
		this.mainBodyType = mainBodyType;
	}
}
