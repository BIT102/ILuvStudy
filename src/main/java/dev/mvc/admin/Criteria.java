package dev.mvc.admin;

public class Criteria {
	
	private int page;
	private int perPageNum;
	
	//admin 계정 관리 검색처리
	private String idKeyword;  //관리자 아이디 검색
	private String nameKeyword;  //관리자명 검색
	private String statusType;  //관리자 계정 사용 여부 검색
	
	//user 검색처리
	private String isDelType;  //회원인지 판단
	private String emailKeyword;  //이메일 검색
	private String nickNameKeyword;  //닉네임 검색
	
	//study 검색처리
	private String stStatusType;  //스터디 상태
	private String titleKeyword;  //스터디명
	private String writerKeyword;  //스터디 작성자
	
	//스터디 댓글 관리 검색처리
	private String bsBnoKeyword;   //스터디 번호 검색
	
	//qna 관리 검색처리
	private String faqType;  //faq 여부 검색
	
	public Criteria(){
		this.page = 1;
		this.perPageNum = 10;
	}
	public void setPage(int page){
		if(page <= 0){
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public void setPerPageNum(int perPageNum){
		if(perPageNum <= 0 || perPageNum > 100){
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public String getStatusType() {
		return statusType;
	}
	public void setStatusType(String statusType) {
		this.statusType = statusType;
	}
	public String getFaqType() {
		return faqType;
	}
	public void setFaqType(String faqType) {
		this.faqType = faqType;
	}
	public String getBsBnoKeyword() {
		return bsBnoKeyword;
	}
	public void setBsBnoKeyword(String bsBnoKeyword) {
		this.bsBnoKeyword = bsBnoKeyword;
	}
	public String getStStatusType() {
		return stStatusType;
	}
	public void setStStatusType(String stStatusType) {
		this.stStatusType = stStatusType;
	}
	public String getTitleKeyword() {
		return titleKeyword;
	}
	public void setTitleKeyword(String titleKeyword) {
		this.titleKeyword = titleKeyword;
	}
	public String getWriterKeyword() {
		return writerKeyword;
	}
	public void setWriterKeyword(String writerKeyword) {
		this.writerKeyword = writerKeyword;
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
				+ nameKeyword + ", statusType=" + statusType + ", isDelType=" + isDelType + ", emailKeyword="
				+ emailKeyword + ", nickNameKeyword=" + nickNameKeyword + ", stStatusType=" + stStatusType
				+ ", titleKeyword=" + titleKeyword + ", writerKeyword=" + writerKeyword + ", bsBnoKeyword="
				+ bsBnoKeyword + ", faqType=" + faqType + "]";
	}

}
