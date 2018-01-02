package sino.java.po.impower;

import java.io.Serializable;

public class Impower implements Serializable{
	private static final long serialVersionUID = 5918432557961765851L;
	
	public static final String GROUP_TYPE = "group";
	
	public static final String USER_TYPE = "user";
	
	private int im_id;
	
	private int mainBody_id;
	
	private String mainBody_type;
	
	private int module_id;
	
	private int saveOption;
	
	private int queryOption;
	
	private int updateOption;
	
	private int deleteOption;

	//授权
	public void setOption(String str){
		this.saveOption = 0;
		this.queryOption = 0;
		this.updateOption = 0;
		this.deleteOption = 0;
		
		String strs[] = str.split(",");
		for(int i=0; i<strs.length; i++){
			if("a".contentEquals(strs[i])){
				this.saveOption=1;
			}else if("r".contentEquals(strs[i])){
				this.queryOption=1;
			}else if("u".contentEquals(strs[i])){
				this.updateOption=1;
			}else if("d".contentEquals(strs[i])){
				this.deleteOption=1;
			}
		}
	}

	public int getIm_id() {
		return im_id;
	}

	public void setIm_id(int im_id) {
		this.im_id = im_id;
	}

	public int getMainBody_id() {
		return mainBody_id;
	}

	public void setMainBody_id(int mainBody_id) {
		this.mainBody_id = mainBody_id;
	}

	public String getMainBody_type() {
		return mainBody_type;
	}

	public void setMainBody_type(String mainBody_type) {
		this.mainBody_type = mainBody_type;
	}

	public int getModule_id() {
		return module_id;
	}

	public void setModule_id(int module_id) {
		this.module_id = module_id;
	}

	public int getSaveOption() {
		return saveOption;
	}

	public void setSaveOption(int saveOption) {
		this.saveOption = saveOption;
	}

	public int getQueryOption() {
		return queryOption;
	}

	public void setQueryOption(int queryOption) {
		this.queryOption = queryOption;
	}

	public int getUpdateOption() {
		return updateOption;
	}

	public void setUpdateOption(int updateOption) {
		this.updateOption = updateOption;
	}

	public int getDeleteOption() {
		return deleteOption;
	}

	public void setDeleteOption(int deleteOption) {
		this.deleteOption = deleteOption;
	}
	
	
}
