package dev.mvc.user;

import java.sql.Date;

public class UserVO {

	private String EMAIL;
	private String PASSWORD;
	private String NAME;
	private String NICKNAME;
	private int GENDER;
	private int PHONE_NUM;
	private int BIRTH;
	private String PHOTO;
	private String HOMEPAGE;
	private String INTRODUCTION;
	private Date REGIST_DATE;
	private Date MODIFY_DATE;
	private Date QUIT_DATE;
	private int IS_DEL;
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getNICKNAME() {
		return NICKNAME;
	}
	public void setNICKNAME(String nICKNAME) {
		NICKNAME = nICKNAME;
	}
	public int getGENDER() {
		return GENDER;
	}
	public void setGENDER(int gENDER) {
		GENDER = gENDER;
	}
	public int getPHONE_NUM() {
		return PHONE_NUM;
	}
	public void setPHONE_NUM(int pHONE_NUM) {
		PHONE_NUM = pHONE_NUM;
	}
	public int getBIRTH() {
		return BIRTH;
	}
	public void setBIRTH(int bIRTH) {
		BIRTH = bIRTH;
	}
	public String getPHOTO() {
		return PHOTO;
	}
	public void setPHOTO(String pHOTO) {
		PHOTO = pHOTO;
	}
	public String getHOMEPAGE() {
		return HOMEPAGE;
	}
	public void setHOMEPAGE(String hOMEPAGE) {
		HOMEPAGE = hOMEPAGE;
	}
	public String getINTRODUCTION() {
		return INTRODUCTION;
	}
	public void setINTRODUCTION(String iNTRODUCTION) {
		INTRODUCTION = iNTRODUCTION;
	}
	public Date getREGIST_DATE() {
		return REGIST_DATE;
	}
	public void setREGIST_DATE(Date rEGIST_DATE) {
		REGIST_DATE = rEGIST_DATE;
	}
	public Date getMODIFY_DATE() {
		return MODIFY_DATE;
	}
	public void setMODIFY_DATE(Date mODIFY_DATE) {
		MODIFY_DATE = mODIFY_DATE;
	}
	public Date getQUIT_DATE() {
		return QUIT_DATE;
	}
	public void setQUIT_DATE(Date qUIT_DATE) {
		QUIT_DATE = qUIT_DATE;
	}
	public int getIS_DEL() {
		return IS_DEL;
	}
	public void setIS_DEL(int iS_DEL) {
		IS_DEL = iS_DEL;
	}
	
	@Override
	public String toString() {
		return "UserVO [EMAIL=" + EMAIL + ", PASSWORD=" + PASSWORD + ", NAME=" + NAME + ", NICKNAME=" + NICKNAME
				+ ", GENDER=" + GENDER + ", PHONE_NUM=" + PHONE_NUM + ", BIRTH=" + BIRTH + ", PHOTO=" + PHOTO
				+ ", HOMEPAGE=" + HOMEPAGE + ", INTRODUCTION=" + INTRODUCTION + ", REGIST_DATE=" + REGIST_DATE
				+ ", MODIFY_DATE=" + MODIFY_DATE + ", QUIT_DATE=" + QUIT_DATE + ", IS_DEL=" + IS_DEL + "]";
	}
	
	
	
}
