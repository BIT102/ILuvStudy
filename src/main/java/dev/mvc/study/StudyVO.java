package dev.mvc.study;

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
	private Integer bsVct;
	private Integer bsRct;
	private Date bsRegdate;
	private Date bsEnddate;
	
	
	//지역이랑 카테고리는 이름으로 가져올께요
	private String rgDName;
	private String rgSName;
	private String scDName;
	private String scSName;
	
	// 작성자는 닉네임으로 표시
	private String nickname;
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	//파일을 엄로드합니다
	private Integer baNo;
	private String baName;
	private Integer baBsBno;
	private Date baRegdate;
	private char baStatus;
	
	private String[] files;
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
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
	public Integer getBsVct() {
		return bsVct;
	}
	public void setBsVct(Integer bsVct) {
		this.bsVct = bsVct;
	}
	public Integer getBsRct() {
		return bsRct;
	}
	public void setBsRct(Integer bsRct) {
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
	public String getRgDName() {
		return rgDName;
	}
	public void setRgDName(String rgDName) {
		this.rgDName = rgDName;
	}
	public String getRgSName() {
		return rgSName;
	}
	public void setRgSName(String rgSName) {
		this.rgSName = rgSName;
	}
	public String getScDName() {
		return scDName;
	}
	public void setScDName(String scDName) {
		this.scDName = scDName;
	}
	public String getScSName() {
		return scSName;
	}
	public void setScSName(String scSName) {
		this.scSName = scSName;
	}
	public Integer getBaNo() {
		return baNo;
	}
	public void setBaNo(Integer baNo) {
		this.baNo = baNo;
	}
	public String getBaName() {
		return baName;
	}
	public void setBaName(String baName) {
		this.baName = baName;
	}
	public Integer getBaBsBno() {
		return baBsBno;
	}
	public void setBaBsBno(Integer baBsBno) {
		this.baBsBno = baBsBno;
	}
	public Date getBaRegdate() {
		return baRegdate;
	}
	public void setBaRegdate(Date baRegdate) {
		this.baRegdate = baRegdate;
	}
	public char getBaStatus() {
		return baStatus;
	}
	public void setBaStatus(char baStatus) {
		this.baStatus = baStatus;
	}
	
	@Override
	public String toString() {
		return "StudyVO [bsBno=" + bsBno + ", bsTitle=" + bsTitle + ", bsWriter=" + bsWriter + ", bsCategoryD="
				+ bsCategoryD + ", bsCategoryS=" + bsCategoryS + ", bsNow=" + bsNow + ", bsMax=" + bsMax + ", bsRDId="
				+ bsRDId + ", bsRSId=" + bsRSId + ", bsAge=" + bsAge + ", bsSc=" + bsSc + ", bsSd=" + bsSd + ", bsSt="
				+ bsSt + ", bsEt=" + bsEt + ", bsContent=" + bsContent + ", bsVct=" + bsVct + ", bsRct=" + bsRct
				+ ", bsRegdate=" + bsRegdate + ", bsEnddate=" + bsEnddate + ", rgDName=" + rgDName + ", rgSName="
				+ rgSName + ", scDName=" + scDName + ", scSName=" + scSName + ", nickname=" + nickname + ", baNo="
				+ baNo + ", baName=" + baName + ", baBsBno=" + baBsBno + ", baRegdate=" + baRegdate + ", baStatus="
				+ baStatus + ", files=" + Arrays.toString(files) + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}

}