package dev.mvc.domain;


public class StatisticVO {
	private int toDMember;  	//오늘 가입자수
	private int yesterDMember;  //어제 가입자수
	private int weekMember; 	//최근 8일 가입자수
	private String day; 		//최근 8일 날짜
	
	private int totalMember; 		//총 회원수
	private int totalWithdrawal ;	//총 탈퇴회원수
	
	private int totalVisit;		//총 방문자수
	private int toDVisit;		//오늘 방문자수
	private int weekVisit;		//최근 8일 방문자 수 
	
	
	
	
	public int getTotalVisit() {
		return totalVisit;
	}
	public void setTotalVisit(int totalVisit) {
		this.totalVisit = totalVisit;
	}
	public int getToDVisit() {
		return toDVisit;
	}
	public void setToDVisit(int toDVisit) {
		this.toDVisit = toDVisit;
	}
	public int getWeekVisit() {
		return weekVisit;
	}
	public void setWeekVisit(int weekVisit) {
		this.weekVisit = weekVisit;
	}
	public int getTotalMember() {
		return totalMember;
	}
	public void setTotalMember(int totalMember) {
		this.totalMember = totalMember;
	}
	public int getTotalWithdrawal() {
		return totalWithdrawal;
	}
	public void setTotalWithdrawal(int totalWithdrawal) {
		this.totalWithdrawal = totalWithdrawal;
	}
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
				+ ", day=" + day + ", totalMember=" + totalMember + ", totalWithdrawal=" + totalWithdrawal
				+ ", totalVisit=" + totalVisit + ", toDVisit=" + toDVisit + ", weekVisit=" + weekVisit + "]";
	}
	
}
