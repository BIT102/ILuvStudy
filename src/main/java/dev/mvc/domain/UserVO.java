package dev.mvc.domain;

import java.util.Date;

//User테이블 VO
public class UserVO {

	private String email; // 이메일
	private String password; // 패스워드
	private String name; // 이름
	private String nickName; // 닉네임
	private int gender; // 성별 (1:남자, 2: 여자)
	private int phoneNum; // 전화번호
	private int birth; // 생년월일
	private String photo; // 프로필 사진
	private String homepage; // user 홈페이지 주소
	private String introduction;// 소개글
	private Date registDate; // 가입일
	private Date modifyDate; // 정보 수정일
	private Date quitDate; // 탈퇴일
	private int isDel; // 회원 탈퇴 관리 (0:회원, 1:탈퇴 회원)
	private int bno; // 회원 번호

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

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

	public int getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(int phoneNum) {
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

	@Override
	public String toString() {
		return "UserVO [email=" + email + ", password=" + password + ", name=" + name + ", nickName=" + nickName
				+ ", gender=" + gender + ", phoneNum=" + phoneNum + ", birth=" + birth + ", photo=" + photo
				+ ", homepage=" + homepage + ", introduction=" + introduction + ", registDate=" + registDate
				+ ", modifyDate=" + modifyDate + ", quitDate=" + quitDate + ", isDel=" + isDel + ", bno=" + bno + "]";
	}

}
