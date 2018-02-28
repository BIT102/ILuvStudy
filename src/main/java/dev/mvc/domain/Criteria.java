package dev.mvc.domain;


public class Criteria {
	private int page;
	private int perPageNum;
	
	//기본값 페이지번호 = 1 , 리스트당 데이터의 수는 10으로 지정
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
	public int getPageStart(){            //limit구문에서 시작위치 지정 (3페이지 10개씩 출력할 경우 limit 20,10 여기서 20이 되기위한 공식)
		return(this.page - 1)*perPageNum; //시작데이터번호 = (페이지번호-1)*페이지당 보여지는 개수
	}
	
	public int getPerPageNum(){			  //limit구문에서 뒤의 숫자를 의미 =한페이지당 보여지는 개수.
		return this.perPageNum;
	}
	
	@Override
	public String toString(){
		return "Criteria[page="+page+","+"perPageNum="+perPageNum+"]";
	}
}
