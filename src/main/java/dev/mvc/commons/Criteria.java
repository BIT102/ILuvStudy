package dev.mvc.commons;

//페이지 관리를 위해 객체처리
public class Criteria {

	private int page; 
	private int perPageNum; //9개씩이용
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 9;
	}
	
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 99) {
			
			this.perPageNum = 9;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	//데이터 제한 두자 limit start, 9개
	public int getPageStart() {
		
		return (this.page-1)*perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
