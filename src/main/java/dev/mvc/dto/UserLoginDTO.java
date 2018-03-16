package dev.mvc.dto;

public class UserLoginDTO {
	
	private String email;		//회원 이메일
	private String password; 	//패스워드
	private boolean useCookies; // 쿠키
	
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
