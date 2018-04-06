package dev.mvc.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

//User테이블 VO
public class UserVO {

	private String email; 				// 이메일
	private String password;			 // 비밀번호
	private String name; 				// 이름
	private String nickName;			 // 닉네임
	private int gender; 				// 성별 (1: 남자, 2: 여자)
	private String phoneNum;			 // 전화번호
	private int birth;  				// 생년월일
	private String photo; 				// 사용자 사진
//	private MultipartFile photo;
	private String homepage;			// 사용자 홈페이지
	private String introduction;		// 자기소개
	private Date registDate;			// 회원가입일
	private Date modifyDate;			// 회원 정보 수정일
	private Date quitDate;				// 회원 탈퇴일
	private int isDel;					// 탈퇴값 (0: 사용회원, 1: 탈퇴회원)
	private int bno;					// 번호
	private int emailConf;				// 이메일 인증 (0 : 미인증 , 1: 인증)
	private String social;				// 소셜 로그인인 경우
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public Date getQuitDate() {
		return quitDate;
	}
	public void setQuitDate(Date quitDate) {
		this.quitDate = quitDate;
	}
	public int getIsDel() {
		return isDel;
	}
	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getEmailConf() {
		return emailConf;
	}
	public void setEmailConf(int emailConf) {
		this.emailConf = emailConf;
	}
	public String getSocial() {
		return social;
	}
	public void setSocial(String social) {
		this.social = social;
	}
	
	@Override
	public String toString() {
		return "UserVO [email=" + email + ", password=" + password + ", name=" + name + ", nickName=" + nickName
				+ ", gender=" + gender + ", phoneNum=" + phoneNum + ", birth=" + birth + ", photo=" + photo
				+ ", homepage=" + homepage + ", introduction=" + introduction + ", registDate=" + registDate
				+ ", modifyDate=" + modifyDate + ", quitDate=" + quitDate + ", isDel=" + isDel + ", bno=" + bno
				+ ", emailConf=" + emailConf + ", social=" + social + "]";
	}
	
}
