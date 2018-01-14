package sino.java.action.workFlow;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
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
}
