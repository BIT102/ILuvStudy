package dev.mvc.domain;

import com.google.gson.Gson;

public class MessageVO {
	
	private int bno;			//�޽��� ��ȣ
	private String message;		//�޽��� ����
	private String type;		//all, to ��ü, �ӼӸ�
	private String receiver;	//�ӼӸ� ��� (�⺻ : admin)
	private String email;		//�޽��� ���� �̸���
	private String msgRegist;	//�޽��� ������
	
	
	
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
