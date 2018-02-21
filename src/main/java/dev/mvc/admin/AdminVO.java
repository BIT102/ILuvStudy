package dev.mvc.admin;

import java.util.Date;

public class AdminVO {
	private	String	adminid;			//	���̵�
	private	String	adminpw;			//	��й�ȣ
	private	String	name;				//	�̸�
	private	Date	registDate;			//	������
	private	String	registUser;			//	������
	private	Date	lastModifyDate;		//	������ ������
	private	Date	lastLoginDate;		//	������ ������
	private	char status;				//	����(V:Ȱ��, D:������)
	private int bno;					// ��ȣ

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getAdminpw() {
		return adminpw;
	}
	public void setAdminpw(String adminpw) {
		this.adminpw = adminpw;
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
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "AdminVO [adminid=" + adminid + ", adminpw=" + adminpw + ", name=" + name + ", registDate=" + registDate
				+ ", registUser=" + registUser + ", lastModifyDate=" + lastModifyDate + ", lastLoginDate="
				+ lastLoginDate + ", status=" + status + ", bno=" + bno + "]";
	}
	
}
