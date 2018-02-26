package dev.mvc.commons;

//������ ������ ���� ��üó��
public class Criteria {

	private int page; 
	private int perPageNum; //9�����̿�
	
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
	//������ ���� ���� limit start, 9��
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
