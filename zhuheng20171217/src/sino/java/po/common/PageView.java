package sino.java.po.common;

import java.util.List;

public class PageView<T> {
	
	private List<T> pageList;
	
	private int totalNo;

	private int pageNo;
	
	private int pageSize;
	
	//总页数
	public int getTotalPage(){
		int totalPage = 0;
		if(totalNo%pageSize==0){
			totalPage = totalNo/pageSize;
		}else{
			totalPage = (totalNo/pageSize)+1;
		}
		return totalPage;
	}
	
	//前一页
	public int getProviousPageNo(){
		if(pageNo<=1){
			return 1;
		}else{
			return pageNo-1;
		}
	}
	
	//后一页
	public int getNextPageNo(){
		if(pageNo>=getTotalPage()){
			return pageNo;
		}else{
			return pageNo+1;
		}
	}
	
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<T> getPageList() {
		return pageList;
	}

	public void setPageList(List<T> pageList) {
		this.pageList = pageList;
	}

	public int getTotalNo() {
		return totalNo;
	}

	public void setTotalNo(int totalNo) {
		this.totalNo = totalNo;
	}
	
	
}
