package dev.mvc.admin;

import java.util.Date;

public class AdminVO {
	private	String	adminId;			//	���̵�
	private	String	adminPw;			//	��й�ȣ
	private	String	name;				//	�̸�
	private	Date	registDate;			//	������
	private	String	registUser;			//	������
	private	Date	lastModifyDate;		//	������ ������
	private	Date	lastLoginDate;		//	������ ������
	private	String status;				//	����(V:Ȱ��, D:������)
	private int bno;					// ��ȣ

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
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
		return "AdminVO [adminId=" + adminId + ", adminPw=" + adminPw + ", name=" + name + ", registDate=" + registDate
				+ ", registUser=" + registUser + ", lastModifyDate=" + lastModifyDate + ", lastLoginDate="
				+ lastLoginDate + ", status=" + status + ", bno=" + bno + "]";
	}

	
}
