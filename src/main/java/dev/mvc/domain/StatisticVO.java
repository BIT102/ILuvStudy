package dev.mvc.domain;

public class StatisticVO {
	private int toDMember;  //���� �����ڼ�
	private int yesterDMember;  //���� �����ڼ�
	
	
	public int getToDMember() {
		return toDMember;
	}
	public void setToDMember(int toDMember) {
		this.toDMember = toDMember;
	}
	public int getYesterDMember() {
		return yesterDMember;
	}
	public void setYesterDMember(int yesterDMember) {
		this.yesterDMember = yesterDMember;
	}

	@Override
	public String toString() {
		return "StatisticVO [toDMember=" + toDMember + ", yesterDMember=" + yesterDMember + "]";
	}
	
}
