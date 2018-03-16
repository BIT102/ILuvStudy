package dev.mvc.domain;

/*Criteria를 상속받아 page와 perPageNum를 쓸수있다.
     새로운 SearchQnaController를 만든다.
*/
public class SearchCriteria extends Criteria { 
	private String searchType;
	private String keyword;

	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}
