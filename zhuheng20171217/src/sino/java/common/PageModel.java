package sino.java.common;

public class PageModel {
	private int firstPage;
	
	private int totalPage;
	
	private int previousPageNo;
	
	private int nextPageNo;
	
	public int getFirstPage() {
		return firstPage;
	}
	
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPreviousPageNo() {
		return previousPageNo;
	}
	public void setPreviousPageNo(int previousPageNo) {
		this.previousPageNo = previousPageNo;
	}
	public int getNextPageNo() {
		return nextPageNo;
	}
	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}
}
