package sino.java.action.dep;

import javax.annotation.Resource;
import sino.java.common.PageModel;
import sino.java.common.PageView;
import sino.java.po.user.User;
import sino.java.service.user.UserService;
import sino.java.service.user.UserServiceFind;

public class UserAction{

	private String name;
	
	private String password;
	
	private PageView<User> pv;
	
	private PageModel pm;
	
	private String page;

	@Resource(name="userServiceImpl")
	private UserService ud;
	
	@Resource(name="userServiceFindImpl")
	private UserServiceFind udf;
	
	public String execute(){
		User user = new User();
		user.setName(name);
		user.setPassword(password);
		ud.save(user);
		return "success";
	}
	
	public String findByPage(){
		int pageNo=1;
		int pageSize=3;
		if(page!=null){
			pageNo = Integer.parseInt(page);
		}
		
		pv = udf.findByPage(User.class, "from User u", pageNo, pageSize);
		pv.setPageNo(pageNo);
		pv.setPageSize(pageSize);;
		pm = new PageModel();
		pm.setFirstPage(1);
		pm.setTotalPage(pv.getTotalPage());
		pm.setPreviousPageNo(pv.getProviousPageNo());
		pm.setNextPageNo(pv.getNextPageNo());
		return "findByPage";
	}
	
	public String show(){
		return "show";
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public PageView<User> getPv() {
		return pv;
	}

	public void setPv(PageView<User> pv) {
		this.pv = pv;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}
	
	public UserService getUd() {
		return ud;
	}

	public void setUd(UserService ud) {
		this.ud = ud;
	}

	public UserServiceFind getUdf() {
		return udf;
	}

	public void setUdf(UserServiceFind udf) {
		this.udf = udf;
	}

	public PageModel getPm() {
		return pm;
	}

	public void setPm(PageModel pm) {
		this.pm = pm;
	}
}
