package dev.mvc.study;

import java.util.Date;

public class StudyVO {
//	BS_BNO	��ȣ
//	BS_TITLE	����
//	BS_WRITER	�۾��� (USER.EMAIL)
//	BS_CATEGORY_D	ī�װ� ��з�
//	BS_CATEGORY_S	ī�װ� �Һз�
//	BS_NOW	�����ο�
//	BS_MAX	�ִ��ο�
//	BS_R_D_ID	����(��з�)
//	BS_R_S_ID	����(�Һз�)
//	BS_AGE	����
//	BS_SC	����(���Ϻ�)(sc=������)
//	BS_SD	���۳�¥(start Date)
//	BS_ST	���۽ð�
//	BS_ET	������ �ð�
//	BS_CONTENT	����
//	BS_VCT	�湮��
//	BS_RCT	��ۼ�
//	BS_REGDATE	�ø� ��¥
//	BS_ENDDATE	���͵�Ϸ���
	//��ƾƾӾƾƾƾƾƾƾƾƾ�
	//����������ƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾƾ�
	private Integer bsBno; 
	private String bsTitle; 
	private String bsWriter; 
	private String bsCategoryD; 
	private Integer bsCategoryS; 
	private Integer bsNow;
	private Integer bsMax;
	private String bsRDId;
	private Integer bsRSId;
	private String bsAge;
	private String bsSc;
	private String bsSd;
	private String bsSt;
	private String bsEt;
	private String bsContent;
	private String bsVct;
	private String bsRct;
	private Date bsRegdate;
	private Date bsEnddate;
	public Integer getBsBno() {
		return bsBno;
	}
	public void setBsBno(Integer bsBno) {
		this.bsBno = bsBno;
	}
	public String getBsTitle() {
		return bsTitle;
	}
	public void setBsTitle(String bsTitle) {
		this.bsTitle = bsTitle;
	}
	public String getBsWriter() {
		return bsWriter;
	}
	public void setBsWriter(String bsWriter) {
		this.bsWriter = bsWriter;
	}
	public String getBsCategoryD() {
		return bsCategoryD;
	}
	public void setBsCategoryD(String bsCategoryD) {
		this.bsCategoryD = bsCategoryD;
	}
	public Integer getBsCategoryS() {
		return bsCategoryS;
	}
	public void setBsCategoryS(Integer bsCategoryS) {
		this.bsCategoryS = bsCategoryS;
	}
	public Integer getBsNow() {
		return bsNow;
	}
	public void setBsNow(Integer bsNow) {
		this.bsNow = bsNow;
	}
	public Integer getBsMax() {
		return bsMax;
	}
	public void setBsMax(Integer bsMax) {
		this.bsMax = bsMax;
	}
	public String getBsRDId() {
		return bsRDId;
	}
	public void setBsRDId(String bsRDId) {
		this.bsRDId = bsRDId;
	}
	public Integer getBsRSId() {
		return bsRSId;
	}
	public void setBsRSId(Integer bsRSId) {
		this.bsRSId = bsRSId;
	}
	public String getBsAge() {
		return bsAge;
	}
	public void setBsAge(String bsAge) {
		this.bsAge = bsAge;
	}
	public String getBsSc() {
		return bsSc;
	}
	public void setBsSc(String bsSc) {
		this.bsSc = bsSc;
	}
	public String getBsSd() {
		return bsSd;
	}
	public void setBsSd(String bsSd) {
		this.bsSd = bsSd;
	}
	public String getBsSt() {
		return bsSt;
	}
	public void setBsSt(String bsSt) {
		this.bsSt = bsSt;
	}
	public String getBsEt() {
		return bsEt;
	}
	public void setBsEt(String bsEt) {
		this.bsEt = bsEt;
	}
	public String getBsContent() {
		return bsContent;
	}
	public void setBsContent(String bsContent) {
		this.bsContent = bsContent;
	}
	public String getBsVct() {
		return bsVct;
	}
	public void setBsVct(String bsVct) {
		this.bsVct = bsVct;
	}
	public String getBsRct() {
		return bsRct;
	}
	public void setBsRct(String bsRct) {
		this.bsRct = bsRct;
	}
	public Date getBsRegdate() {
		return bsRegdate;
	}
	public void setBsRegdate(Date bsRegdate) {
		this.bsRegdate = bsRegdate;
	}
	public Date getBsEnddate() {
		return bsEnddate;
	}
	public void setBsEnddate(Date bsEnddate) {
		this.bsEnddate = bsEnddate;
	}
	
	@Override
	public String toString() {
		return "StudyVO [bsBno=" + bsBno + ", bsTitle=" + bsTitle + ", bsWriter=" + bsWriter + ", bsCategoryD="
				+ bsCategoryD + ", bsCategoryS=" + bsCategoryS + ", bsNow=" + bsNow + ", bsMax=" + bsMax + ", bsRDId="
				+ bsRDId + ", bsRSId=" + bsRSId + ", bsAge=" + bsAge + ", bsSc=" + bsSc + ", bsSd=" + bsSd + ", bsSt="
				+ bsSt + ", bsEt=" + bsEt + ", bsContent=" + bsContent + ", bsVct=" + bsVct + ", bsRct=" + bsRct
				+ ", bsRegdate=" + bsRegdate + ", bsEnddate=" + bsEnddate + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
}
	