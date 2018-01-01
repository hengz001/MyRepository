package sino.java.action.mod;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import sino.java.po.common.PageView;
import sino.java.po.module.Module;
import sino.java.service.mod.ModServiceFind;
import sino.java.service.mod.ModuleService;

public class ModAction {
	
	@Autowired
	private ModServiceFind modServiceFind;
	
	@Autowired
	private ModuleService moduleService;
	
	private Module mod = new Module();
	
	private File imgC;
	
	private File imgN;
	
	private String imgCFileName;
	
	private String imgNFileName;
	
	public String showLeftModule(){
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Module> mods = modServiceFind.findAll(Module.class,
				"FROM Module m WHERE m.flag=1 AND m.parent=null");
		request.setAttribute("mods",mods);
		return "showLeftModule";
	}
	
	public String showRightModule(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String str_mid = request.getParameter("mid");
		int mid = 0;
		if(null != str_mid && !str_mid.equals("")){
			mid = Integer.parseInt(str_mid);
		}
		List<Module> subMod = modServiceFind.findAll(Module.class, 
				"FROM Module m WHERE m.flag=1 AND m.parent.m_id="+mid);
		request.setAttribute("subMod",subMod);
		return "showRightModule";
	}

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
	
	public String showAddModule(){
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Module> mods = modServiceFind.findAll(Module.class, 
					"FROM Module m WHERE m.parent=null");
		request.setAttribute("mods",mods);
		return "showAddModule";
	}
	
	public String addModule(){
		if(null!=imgC && null!=imgN){
			String realPath = ServletActionContext.getServletContext().getRealPath("/WEB/imgs/mod/");
			File saveFileC = new File(new File(realPath),imgCFileName);
			File saveFileN = new File(new File(realPath),imgNFileName);
			if(!saveFileC.getParentFile().exists() && !saveFileN.getParentFile().exists()){
				saveFileC.getParentFile().mkdirs();
				saveFileN.getParentFile().mkdirs();
			}
			try {
				FileUtils.copyFile(imgC, saveFileC);
				FileUtils.copyFile(imgN, saveFileN);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		if(mod.getM_id() != 0){
			mod.setParent(modServiceFind.findById(Module.class, mod.getM_id()));
		}
		mod.setM_path_c("WEB/imgs/mod/"+imgCFileName);
		mod.setM_path_n("WEB/imgs/mod/"+imgNFileName);
		mod.setFlag(1);
		moduleService.save(mod);
		return "addModule";
	}
	
	public Module getMod() {
		return mod;
	}

	public void setMod(Module mod) {
		this.mod = mod;
	}

	public File getImgC() {
		return imgC;
	}

	public void setImgC(File imgC) {
		this.imgC = imgC;
	}

	public File getImgN() {
		return imgN;
	}

	public void setImgN(File imgN) {
		this.imgN = imgN;
	}

	public ModServiceFind getModServiceFind() {
		return modServiceFind;
	}

	public void setModServiceFind(ModServiceFind modServiceFind) {
		this.modServiceFind = modServiceFind;
	}	public String getImgCFileName() {
		return imgCFileName;
	}

	public void setImgCFileName(String imgCFileName) {
		this.imgCFileName = imgCFileName;
	}

	public String getImgNFileName() {
		return imgNFileName;
	}

	public void setImgNFileName(String imgNFileName) {
		this.imgNFileName = imgNFileName;
	}
	

}
