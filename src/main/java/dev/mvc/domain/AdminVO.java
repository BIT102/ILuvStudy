package dev.mvc.domain;

import java.util.Date;

public class AdminVO {
	private	String	id;					//	���̵�
	private	String	pw;					//	��й�ȣ
	private	String	name;				//	�̸�
	private	Date	registDate;			//	������
	private	String	registUser;			//	������
	private	Date	lastModifyDate;		//	������ ������
	private	Date	lastLoginDate;		//	������ ������
	private	String status;				//	����(V:Ȱ��, D:������)
	private int bno;					// ��ȣ
	
	private String email;			//ä��
	private String msgRegist;		//ä�� �����
	
	public String getMsgRegist() {
		return msgRegist;
	}
	public void setMsgRegist(String msgRegist) {
		this.msgRegist = msgRegist;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public String getRegistUser() {
		return registUser;
	}
	public void setRegistUser(String registUser) {
		this.registUser = registUser;
	}
	public Date getLastModifyDate() {
		return lastModifyDate;
	}
	public void setLastModifyDate(Date lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}
	public Date getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "AdminVO [id=" + id + ", pw=" + pw + ", name=" + name + ", registDate=" + registDate + ", registUser="
				+ registUser + ", lastModifyDate=" + lastModifyDate + ", lastLoginDate=" + lastLoginDate + ", status="
				+ status + ", bno=" + bno + ", email=" + email + ", msgRegist=" + msgRegist + "]";
	}
}
