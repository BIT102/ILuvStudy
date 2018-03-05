package dev.mvc.domain;
 
import java.util.Arrays;
import java.util.Date;
 
public class StudyVO {
//	BS_BNO	번호
//	BS_TITLE	제목
//	BS_WRITER	글쓴이 (USER.EMAIL)
//	BS_CATEGORY_D	카테고리 대분류
//	BS_CATEGORY_S	카테고리 소분류
//	BS_NOW	현재인원
//	BS_MAX	최대인원
//	BS_R_D_ID	지역(대분류)
//	BS_R_S_ID	지역(소분류)
//	BS_AGE	연령
//	BS_SC	일정(요일별)(sc=스케줄)
//	BS_SD	시작날짜(start Date)
//	BS_ST	시작시간
//	BS_ET	끝나는 시간
//	BS_CONTENT	내용
//	BS_VCT	방문수
//	BS_RCT	댓글수
//	BS_REGDATE	올린 날짜
//	BS_ENDDATE	스터디완료일
	//우아아앙아아아아아아아아앙
	//우우우우우우우우우아아아아아아아아아아아아아아아아아아앙
	private int bno; 
	private String title; 
	private String writer; 
	private String categoryD; 
	private int categoryS; 
	private int now;
	private int max;
	private String rDId;
	private int rSId;
	private String age;
	private String sc;
	private String sd;
	private String st;
	private String et;
	private String content;
	private int vct;
	private int rct;
	private Date regdate;
	private Date enddate;
	
	//지역이랑 카테고리는 이름으로 가져올께요
	private String rDName;
	private String rSName;
	private String cDName;
	private String cSName;
	private int cSId;
	
	// 작성자는 닉네임으로 표시
	private String nickname;
	
	//파일을 엄로드합니다
	private int no;
	private String name;
	private String[] files;
	
	//관리자에서 회원조회
	private String status;  //스터디 신청자 상태값

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
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

	public int getCategoryS() {
		return categoryS;
	}

	public void setCategoryS(int categoryS) {
		this.categoryS = categoryS;
	}

	public int getNow() {
		return now;
	}

	public void setNow(int now) {
		this.now = now;
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public String getrDId() {
		return rDId;
	}

	public void setrDId(String rDId) {
		this.rDId = rDId;
	}

	public int getrSId() {
		return rSId;
	}

	public void setrSId(int rSId) {
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

	public int getVct() {
		return vct;
	}

	public void setVct(int vct) {
		this.vct = vct;
	}

	public int getRct() {
		return rct;
	}

	public void setRct(int rct) {
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

	public int getcSId() {
		return cSId;
	}

	public void setcSId(int cSId) {
		this.cSId = cSId;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "StudyVO [bno=" + bno + ", title=" + title + ", writer=" + writer + ", categoryD=" + categoryD
				+ ", categoryS=" + categoryS + ", now=" + now + ", max=" + max + ", rDId=" + rDId + ", rSId=" + rSId
				+ ", age=" + age + ", sc=" + sc + ", sd=" + sd + ", st=" + st + ", et=" + et + ", content=" + content
				+ ", vct=" + vct + ", rct=" + rct + ", regdate=" + regdate + ", enddate=" + enddate + ", rDName="
				+ rDName + ", rSName=" + rSName + ", cDName=" + cDName + ", cSName=" + cSName + ", cSId=" + cSId
				+ ", nickname=" + nickname + ", no=" + no + ", name=" + name + ", files=" + Arrays.toString(files)
				+ ", status=" + status + ", getBno()=" + getBno() + ", getTitle()=" + getTitle() + ", getWriter()="
				+ getWriter() + ", getCategoryD()=" + getCategoryD() + ", getCategoryS()=" + getCategoryS()
				+ ", getNow()=" + getNow() + ", getMax()=" + getMax() + ", getrDId()=" + getrDId() + ", getrSId()="
				+ getrSId() + ", getAge()=" + getAge() + ", getSc()=" + getSc() + ", getSd()=" + getSd() + ", getSt()="
				+ getSt() + ", getEt()=" + getEt() + ", getContent()=" + getContent() + ", getVct()=" + getVct()
				+ ", getRct()=" + getRct() + ", getRegdate()=" + getRegdate() + ", getEnddate()=" + getEnddate()
				+ ", getrDName()=" + getrDName() + ", getrSName()=" + getrSName() + ", getcDName()=" + getcDName()
				+ ", getcSName()=" + getcSName() + ", getcSId()=" + getcSId() + ", getNickname()=" + getNickname()
				+ ", getNo()=" + getNo() + ", getName()=" + getName() + ", getFiles()=" + Arrays.toString(getFiles())
				+ ", getStatus()=" + getStatus() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
}