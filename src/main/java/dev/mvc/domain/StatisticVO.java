package dev.mvc.domain;


public class StatisticVO {
	private int toDMember;  	//���� �����ڼ�
	private int yesterDMember;  //���� �����ڼ�
	private int weekMember; 	//�ֱ� 7�� �����ڼ�
	private String day; 		//�ֱ� 7�� ��¥
	

	
	
	
	public int getWeekMember() {
		return weekMember;
	}
	public void setWeekMember(int weekMember) {
		this.weekMember = weekMember;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
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
		return "StatisticVO [toDMember=" + toDMember + ", yesterDMember=" + yesterDMember + ", weekMember=" + weekMember
				+ ", day=" + day + "]";
	}
	
}
