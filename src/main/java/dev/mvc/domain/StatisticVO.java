package dev.mvc.domain;


public class StatisticVO {
	private int toDMember;  	//오늘 가입자수
	private int yesterDMember;  //어제 가입자수
	private int weekMember; 	//최근 7일 가입자수
	private String day; 		//최근 7일 날짜
	

	
	
	
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
