package dev.mvc.study.domain;

import java.util.Date;

public class QnaVO {

  /*QNA_BNO			번호		int(11)		PK/AI	NN	
	QNA_TITLE		제목		varchar(50)			NN	
	QNA_WRITER		글쓴이		varchar(50)			NN	
	QNA_CATEGORY_D	대분류 		VARCHAR(20)			
	QNA_CATEGORY_S	소분류		VARCHAR(20)			
	QNA_CONTENT		내용		text		NN	
	QNA_RCT			댓글수		int(11)				0
	QNA_REGDATE		올린날짜	DATETIME			CURRENT_TIMESTAMP
	QNA_TYPE		FAQ여부	int(2)		NN		0
  */
	
	// +조회수 QNA_VCT 는 필요한가?

	
	//getter, setter ,toString
	private int qnaBno; //Integer 는 안된다...!
	
	private String qnaTitle;
	
	private String qnaWriter;
	
	private String qnaCategoryD;
	
	private int qnaCategoryS;
	
	private String qnaContent;
	
	private int qnaRct;
	
	private Date qnaRegdate;
	
	private int qnaType;

	public int getQnaBno() {
		return qnaBno;
	}

	public void setQnaBno(int qnaBno) {
		this.qnaBno = qnaBno;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public String getQnaCategoryD() {
		return qnaCategoryD;
	}

	public void setQnaCategoryD(String qnaCategoryD) {
		this.qnaCategoryD = qnaCategoryD;
	}

	public int getQnaCategoryS() {
		return qnaCategoryS;
	}

	public void setQnaCategoryS(int qnaCategoryS) {
		this.qnaCategoryS = qnaCategoryS;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public int getQnaRct() {
		return qnaRct;
	}

	public void setQnaRct(int qnaRct) {
		this.qnaRct = qnaRct;
	}

	public Date getQnaRegdate() {
		return qnaRegdate;
	}

	public void setQnaRegdate(Date qnaRegdate) {
		this.qnaRegdate = qnaRegdate;
	}

	public int getQnaType() {
		return qnaType;
	}

	public void setQnaType(int qnaType) {
		this.qnaType = qnaType;
	}

	@Override
	public String toString() {
		return "QnaVO [qnaBno=" + qnaBno + ", qnaTitle=" + qnaTitle + ", qnaWriter=" + qnaWriter + ", qnaCategoryD="
				+ qnaCategoryD + ", qnaCategoryS=" + qnaCategoryS + ", qnaContent=" + qnaContent + ", qnaRct=" + qnaRct
				+ ", qnaRegdate=" + qnaRegdate + ", qnaType=" + qnaType + "]";
	}

	
	
}
