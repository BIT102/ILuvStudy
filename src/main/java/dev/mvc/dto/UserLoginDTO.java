package dev.mvc.dto;

public class UserLoginDTO {
	
	private String email;		//ȸ�� �̸���
	private String password; 	//�н�����
	private boolean useCookies; // ��Ű
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isUseCookies() {
		return useCookies;
	}
	public void setUseCookies(boolean useCookies) {
		this.useCookies = useCookies;
	}
	
	@Override
	public String toString() {
		return "UserLoginDTO [email=" + email + ", password=" + password + ", useCookies=" + useCookies + "]";
	}
	
	
	

	
	
}
