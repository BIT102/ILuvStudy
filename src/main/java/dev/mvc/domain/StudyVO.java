package dev.mvc.domain;

import java.util.Arrays;
import java.util.Date;

public class StudyVO {
//	BS_BNO	��ȣ
//	BS_TITLE	����
//	BS_WRITER	�۾��� (USER.EMAIL)
//	BS_CATEGORY_D	ī�װ��� ��з�
//	BS_CATEGORY_S	ī�װ��� �Һз�
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
	private Integer bno; 
	private String title; 
	private String writer; 
	private String categoryD; 
	private String categoryS; 
	private Integer now;
	private Integer max;
	private String rDId;
	private String rSId;
	private String age;
	private String sc;
	private String sd;
	private String st;
	private String et;
	private String content;
	private Integer vct;
	private Integer rct;
	private Date regdate;
	private Date enddate;
	

	//�����̶� ī�װ����� �̸����� �����ò���
	private String rDName;
	private String rSName;
	
	
	private String cdId;
	private String csId;
	private String cDName;
	private String cSName;
	
	// �ۼ��ڴ� �г������� ǥ��
	private String nickname;
	

	//������ ���ε��մϴ�
	private int no;
	private String name;
	private String status;

	//���� ���ε�
	private String[] files;

	
	
	public String getCdId() {
		return cdId;
	}

	public void setCdId(String cdId) {
		this.cdId = cdId;
	}

	public String getCsId() {
		return csId;
	}

	public void setCsId(String csId) {
		this.csId = csId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCategoryD() {
		return categoryD;
	}

	public void setCategoryD(String categoryD) {
		this.categoryD = categoryD;
	}

	public String getCategoryS() {
		return categoryS;
	}

	public void setCategoryS(String categoryS) {
		this.categoryS = categoryS;
	}

	public Integer getNow() {
		return now;
	}

	public void setNow(Integer now) {
		this.now = now;
	}

	public Integer getMax() {
		return max;
	}

	public void setMax(Integer max) {
		this.max = max;
	}

	public String getrDId() {
		return rDId;
	}

	public void setrDId(String rDId) {
		this.rDId = rDId;
	}

	public String getrSId() {
		return rSId;
	}

	public void setrSId(String rSId) {
		this.rSId = rSId;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getSc() {
		return sc;
	}

	public void setSc(String sc) {
		this.sc = sc;
	}

	public String getSd() {
		return sd;
	}

	public void setSd(String sd) {
		this.sd = sd;
	}

	public String getSt() {
		return st;
	}

	public void setSt(String st) {
		this.st = st;
	}

	public String getEt() {
		return et;
	}

	public void setEt(String et) {
		this.et = et;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getVct() {
		return vct;
	}

	public void setVct(Integer vct) {
		this.vct = vct;
	}

	public Integer getRct() {
		return rct;
	}

	public void setRct(Integer rct) {
		this.rct = rct;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getrDName() {
		return rDName;
	}

	public void setrDName(String rDName) {
		this.rDName = rDName;
	}

	public String getrSName() {
		return rSName;
	}

	public void setrSName(String rSName) {
		this.rSName = rSName;
	}

	public String getcDName() {
		return cDName;
	}

	public void setcDName(String cDName) {
		this.cDName = cDName;
	}

	public String getcSName() {
		return cSName;
	}

	public void setcSName(String cSName) {
		this.cSName = cSName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "StudyVO [bno=" + bno + ", title=" + title + ", writer=" + writer + ", categoryD=" + categoryD
				+ ", categoryS=" + categoryS + ", now=" + now + ", max=" + max + ", rDId=" + rDId + ", rSId=" + rSId
				+ ", age=" + age + ", sc=" + sc + ", sd=" + sd + ", st=" + st + ", et=" + et + ", content=" + content
				+ ", vct=" + vct + ", rct=" + rct + ", regdate=" + regdate + ", enddate=" + enddate + ", rDName="
				+ rDName + ", rSName=" + rSName + ", cdId=" + cdId + ", csId=" + csId + ", cDName=" + cDName
				+ ", cSName=" + cSName + ", nickname=" + nickname + ", no=" + no + ", name=" + name + ", status="
				+ status + ", files=" + Arrays.toString(files) + "]";
	}




	
}