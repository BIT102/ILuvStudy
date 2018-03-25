package dev.mvc.domain;


public class StatisticVO {
	private int toDMember;  	//���� �����ڼ�
	private int yesterDMember;  //���� �����ڼ�
	private int weekMember; 	//�ֱ� 8�� �����ڼ�
	private String day; 		//�ֱ� 8�� ��¥
	
	private int totalMember; 		//�� ȸ����
	private int totalWithdrawal ;	//�� Ż��ȸ����
	
	private int totalVisit;		//�� �湮�ڼ�
	private int toDVisit;		//���� �湮�ڼ�
	private int yesterDVisit;	//���� �湮�ڼ�
	private int weekVisit;		//�ֱ� 8�� �湮�� �� 
	
	private int weekStudy;		//�ֱ� 8�� ���͵� ��� ��
	private int weekApply;		//�ֱ� 8�� ���͵� ��û ��
	private int totalStudy;		//�� ���͵� ��� ��
	private int totalApply;		//�� ���͵� ��û ��
	
	
	
	public int getWeekStudy() {
		return weekStudy;
	}
	public void setWeekStudy(int weekStudy) {
		this.weekStudy = weekStudy;
	}
	public int getWeekApply() {
		return weekApply;
	}
	public void setWeekApply(int weekApply) {
		this.weekApply = weekApply;
	}
	public int getTotalStudy() {
		return totalStudy;
	}
	public void setTotalStudy(int totalStudy) {
		this.totalStudy = totalStudy;
	}
	public int getTotalApply() {
		return totalApply;
	}
	public void setTotalApply(int totalApply) {
		this.totalApply = totalApply;
	}
	public int getYesterDVisit() {
		return yesterDVisit;
	}
	public void setYesterDVisit(int yesterDVisit) {
		this.yesterDVisit = yesterDVisit;
	}
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
				+ ", totalVisit=" + totalVisit + ", toDVisit=" + toDVisit + ", yesterDVisit=" + yesterDVisit
				+ ", weekVisit=" + weekVisit + ", weekStudy=" + weekStudy + ", weekApply=" + weekApply + ", totalStudy="
				+ totalStudy + ", totalApply=" + totalApply + "]";
	}
	
}
