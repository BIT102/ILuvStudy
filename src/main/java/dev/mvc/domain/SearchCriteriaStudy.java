package dev.mvc.domain;

public class SearchCriteriaStudy extends CriteriaStudy{
	
	//정렬방법을 선택할 때요
	private String pallType;
	
	
	//카테고리 선택식
	private String cateType;
	
	private String searchType;
	private String keyword;
	public String getPallType() {
		return pallType;
	}
	public void setPallType(String pallType) {
		this.pallType = pallType;
	}
	public String getCateType() {
		return cateType;
	}
	public void setCateType(String cateType) {
		this.cateType = cateType;
	}
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
		return "SearchCriteriaStudy [pallType=" + pallType + ", cateType=" + cateType + ", searchType=" + searchType
				+ ", keyword=" + keyword + ", getPage()=" + getPage() + ", getPageStart()=" + getPageStart()
				+ ", getPerPageNum()=" + getPerPageNum() + ", getIdKeyword()=" + getIdKeyword() + ", getNameKeyword()="
				+ getNameKeyword() + ", getIsDelType()=" + getIsDelType() + ", getEmailKeyword()=" + getEmailKeyword()
				+ ", getNickNameKeyword()=" + getNickNameKeyword() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
}
