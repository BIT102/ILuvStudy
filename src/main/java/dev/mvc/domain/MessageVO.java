package dev.mvc.domain;

import com.google.gson.Gson;

public class MessageVO {
	
	private int bno;			//메시지 번호
	private String message;		//메시지 내용
	private String type;		//all, to 전체, 귓속말
	private String receiver;	//귓속말 대상 (기본 : admin)
	private String email;		//메시지 보낸 이메일
	private String msgRegist;	//메시지 전송일
	
	
	
	public static MessageVO converMessage(String source){
		MessageVO message = new MessageVO();
		Gson gson = new Gson();
		message = gson.fromJson(source, MessageVO.class);
		
		return message;
	}
	
	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getMsgRegist() {
		return msgRegist;
	}

	public void setMsgRegist(String msgRegist) {
		this.msgRegist = msgRegist;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	@Override
	public String toString() {
		return "MessageVO [bno=" + bno + ", message=" + message + ", type=" + type + ", receiver=" + receiver
				+ ", email=" + email + ", msgRegist=" + msgRegist + "]";
	}


}
