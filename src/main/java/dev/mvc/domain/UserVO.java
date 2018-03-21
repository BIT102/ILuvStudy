package dev.mvc.domain;

import java.util.Date;

//UserÅ×ÀÌºí VO
public class UserVO {

	private String email;
	private String password;
	private String name;
	private String nickName;
	private int gender;
	private String phoneNum;
	private int birth;
	private String photo;
	private String homepage;
	private String introduction;
	private Date registDate;
	private Date modifyDate;
	private Date quitDate;
	private int isDel;
	private int bno;
	private int emailConf;
	
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
	@Override
	public String toString() {
		return "UserVO [email=" + email + ", password=" + password + ", name=" + name + ", nickName=" + nickName
				+ ", gender=" + gender + ", phoneNum=" + phoneNum + ", birth=" + birth + ", photo=" + photo
				+ ", homepage=" + homepage + ", introduction=" + introduction + ", registDate=" + registDate
				+ ", modifyDate=" + modifyDate + ", quitDate=" + quitDate + ", isDel=" + isDel + ", bno=" + bno
				+ ", emailConf=" + emailConf + "]";
	}
	
	
}
