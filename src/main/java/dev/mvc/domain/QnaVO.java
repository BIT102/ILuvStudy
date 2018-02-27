package dev.mvc.domain;

import java.util.Date;

public class QnaVO {

  /*
   	BNO			��ȣ		int(11)		PK/AI	NN	
	TITLE		����		varchar(50)			NN	
	WRITER		�۾���		varchar(50)			NN	
	CATEGORYD	��з� 		VARCHAR(20)			
	CATEGORYS	�Һз�		VARCHAR(20)			
	CONTENT		����		text		NN	
	RCT			��ۼ�		int(11)				0
	REGDATE		�ø���¥	DATETIME			CURRENT_TIMESTAMP
	TYPE		FAQ����	int(2)		NN		0
  */
	
	// +��ȸ�� QNA_VCT �� �ʿ��Ѱ�?

	
	
	private int bno; //Integer �� �ȵȴ�...!
	
	private String title;
	
	private String writer;
	
	private String categoryD;
	
	private int categoryS;
	
	private String content;
	
	private int rct;
	
	private Date regdate;
	
	private int type;
	
	
	//getter, setter ,toString
	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCategoryD() {
		return categoryD;
	}

	public void setCategoryD(String categoryD) {
		this.categoryD = categoryD;
	}

	public int getCategoryS() {
		return categoryS;
	}

	public void setCategoryS(int categoryS) {
		this.categoryS = categoryS;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRct() {
		return rct;
	}

	public void setRct(int rct) {
		this.rct = rct;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "QnaVO [bno=" + bno + ", title=" + title + ", writer=" + writer + ", categoryD=" + categoryD
				+ ", categoryS=" + categoryS + ", content=" + content + ", rct=" + rct + ", regdate=" + regdate
				+ ", type=" + type + "]";
	}

	
	
	
}
