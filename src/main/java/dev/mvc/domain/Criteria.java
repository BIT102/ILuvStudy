package dev.mvc.domain;


public class Criteria {
	private int page;
	private int perPageNum;
	
	//�⺻�� ��������ȣ = 1 , ����Ʈ�� �������� ���� 10���� ����
	public Criteria(){
		this.page=1;
		this.perPageNum=10;
	}
	
	public void setPage(int page) {
		if(page <= 0){
			this.page = 1;
			return;
		}
		this.page=page;
	}
	
	public void setPerPageNum(int perPageNum){
		
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage(){
		return page;
	}
	
	//method for MyBatis SQL Mapper-
	public int getPageStart(){            //limit�������� ������ġ ���� (3������ 10���� ����� ��� limit 20,10 ���⼭ 20�� �Ǳ����� ����)
		return(this.page - 1)*perPageNum; //���۵����͹�ȣ = (��������ȣ-1)*�������� �������� ����
	}
	
	public int getPerPageNum(){			  //limit�������� ���� ���ڸ� �ǹ� =���������� �������� ����.
		return this.perPageNum;
	}
	
	@Override
	public String toString(){
		return "Criteria[page="+page+","+"perPageNum="+perPageNum+"]";
	}
}
