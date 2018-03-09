package dev.mvc.admin;

public class Criteria {
	
	private int page;
	private int perPageNum;
	
	//admin ���� ���� �˻�ó��
	private String idKeyword;  //������ ���̵� �˻�
	private String nameKeyword;  //�����ڸ� �˻�
	private String statusType;  //������ ���� ��� ���� �˻�
	
	//user �˻�ó��
	private String isDelType;  //ȸ������ �Ǵ�
	private String emailKeyword;  //�̸��� �˻�
	private String nickNameKeyword;  //�г��� �˻�
	
	//study �˻�ó��
	private String stStatusType;  //���͵� ����
	private String titleKeyword;  //���͵��
	private String writerKeyword;  //���͵� �ۼ���
	
	//���͵� ��� ���� �˻�ó��
	private String bsBnoKeyword;   //���͵� ��ȣ �˻�
	
	//qna ���� �˻�ó��
	private String faqType;  //faq ���� �˻�
	
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
