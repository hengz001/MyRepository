package sino.java.action.workFlow;


import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;

import com.sun.org.apache.xalan.internal.xsltc.trax.OutputSettings;

import sino.java.po.workFlow.WorkFlow;
import sino.java.service.workFlow.WorkFlowService;
import sino.java.service.workFlow.WorkFlowServiceFinder;


public class WorkFlowAction {
	@Autowired
	private WorkFlowServiceFinder wsf;
	
	@Autowired
	private WorkFlowService ws;
	
	//上传的文件
	private File processFile;
	
	private File processImg;
	
	//工作流
	private int wf_id;
	
	//显示流程(打开显示流程页面)
	public String showwf() {
		HttpServletRequest request = ServletActionContext.getRequest();
		List<WorkFlow> wfs = wsf.findAll(WorkFlow.class, "from WorkFlow");
		request.setAttribute("wfs", wfs);
		return "showwf";
	}
	//部署流程
	public String deployProcess() {
		//把数据放在数据库中
		//把XML文件部署到数据库中
		if(null != processFile && null != processImg){
			ws.deployProcess(getBytesFromFile(processFile), getBytesFromFile(processImg));
		}
		return "deployProcess";
	}
	
	//文件转换为字节数组
	private byte[] getBytesFromFile(File file) {
		byte[] bte = null;
		try {
			if(file==null) {
				return null;
			}
			FileInputStream in = new FileInputStream(file);
			ByteArrayOutputStream out = new ByteArrayOutputStream(4000);
			byte[] b = new byte[4000];
			int n;
			while((n=in.read(b))!=-1) {
				out.write(b, 0, n);
			}
			in.close();
			out.close();
			bte = out.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bte;
	}
	
	//查看流程页面
	public String swf(){
		HttpServletRequest request = ServletActionContext.getRequest();
		List<WorkFlow> wfs = wsf.findAll(WorkFlow.class, "from WorkFlow");
		request.setAttribute("wfs", wfs);
		return "swf";
	}
	
	//查看文件
	public String execute(){
		PrintWriter out = null;
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			//清缓存
			response.setDateHeader("Expires", 0);
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			out = response.getWriter();
			WorkFlow wf = wsf.findById(WorkFlow.class, wf_id);
			byte[] defs = wf.getProcessFile();
			String wfmString = new SAXReader().read(new ByteArrayInputStream(defs)).asXML();
			out.print(wfmString);
			out.flush();
			out.close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	//查看图片
	public String showImg(){
		HttpServletResponse response = ServletActionContext.getResponse();
	    response.reset();   
		WorkFlow wf = wsf.findById(WorkFlow.class, wf_id);
		OutputStream out = null;
		try {
			out = response.getOutputStream();
			out.write(wf.getProcessImg());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(null != out){
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	public File getProcessFile() {
		return processFile;
	}
	public void setProcessFile(File processFile) {
		this.processFile = processFile;
	}
	public File getProcessImg() {
		return processImg;
	}
	public void setProcessImg(File processImg) {
		this.processImg = processImg;
	}
	
	public int getWf_id() {
		return wf_id;
	}
	public void setWf_id(int wf_id) {
		this.wf_id = wf_id;
	}
}
