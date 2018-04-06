package dev.mvc.domain;

import java.util.Date;

public class ApplyVO {

	private String usEmail; // use의 bno
	private Integer bsBno; // 스터디 bno
	private String status;
	private Date regdate;
	
	private int checked;

	public String getUsEmail() {
		return usEmail;
	}

	public void setUsEmail(String usEmail) {
		this.usEmail = usEmail;
	}

	public Integer getBsBno() {
		return bsBno;
	}

	public void setBsBno(Integer bsBno) {
		this.bsBno = bsBno;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}

	@Override
	public String toString() {
		return "ApplyVO [usEmail=" + usEmail + ", bsBno=" + bsBno + ", status=" + status + ", regdate=" + regdate
				+ ", checked=" + checked + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
}