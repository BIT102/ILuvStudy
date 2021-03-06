package dev.mvc.domain;

public class CriteriaStudy {

	private int page;
	private int perPageNum;
	

	
	//admin 拌沥 包府 八祸贸府
	private String idKeyword;
	private String nameKeyword;
	
	//user 八祸贸府
	private String isDelType;
	private String emailKeyword;
	private String nickNameKeyword;
	
	public CriteriaStudy(){
		this.page = 1;
		this.perPageNum = 9;

	}
	public void setPage(int page){
		if(page <= 0){
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public void setPerPageNum(int perPageNum){
		if(perPageNum <= 0 || perPageNum > 9){
			this.perPageNum = 9;
			return;
		}
		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}
	public int getPageStart(){
		return (this.page - 1)*perPageNum;
	}
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public String getIdKeyword() {
		return idKeyword;
	}
	public void setIdKeyword(String idKeyword) {
		this.idKeyword = idKeyword;
	}
	public String getNameKeyword() {
		return nameKeyword;
	}
	public void setNameKeyword(String nameKeyword) {
		this.nameKeyword = nameKeyword;
	}
	
	public String getIsDelType() {
		return isDelType;
	}
	public void setIsDelType(String isDelType) {
		this.isDelType = isDelType;
	}
	public String getEmailKeyword() {
		return emailKeyword;
	}
	public void setEmailKeyword(String emailKeyword) {
		this.emailKeyword = emailKeyword;
	}
	public String getNickNameKeyword() {
		return nickNameKeyword;
	}
	public void setNickNameKeyword(String nickNameKeyword) {
		this.nickNameKeyword = nickNameKeyword;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", idKeyword=" + idKeyword + ", nameKeyword="
				+ nameKeyword + ", isDelType=" + isDelType + ", emailKeyword=" + emailKeyword + ", nickNameKeyword="
				+ nickNameKeyword + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
}
