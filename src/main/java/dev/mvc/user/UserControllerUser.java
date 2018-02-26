package dev.mvc.user;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
//@RequestMapping(value = "/mypage/")
public class UserControllerUser {
	
	private static final Logger logger = LoggerFactory.getLogger(UserControllerUser.class);
	
	@Inject
	UserDAO dao;
	
	
	//ȸ������ ��Ʈ�ѷ�
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinUserGET(UserVO vo, Model model) {
		
	}
	
	@RequestMapping(value = "/joinUser", method = RequestMethod.POST)
	public String joinUser(UserVO vo, Model model) {
		
		try {
			dao.joinUser(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "join";
	}
	
	
	// profile ��Ʈ�ѷ�
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(UserVO vo, Model model) {
		
		return "/mypage/profile";
	}
	
	// �ΰ�����(addinfo) ��Ʈ�ѷ�
	@RequestMapping(value = "/addInfo", method = RequestMethod.GET)
	public String addInfo(UserVO vo, Model model) {
		
		return "/mypage/addInfo";
	}
	
	// ��й�ȣ ����(changePw) ��Ʈ�ѷ�
	@RequestMapping(value = "/changePw", method = RequestMethod.GET)
	public String changePw(UserVO vo, Model model) {
		
		return "/mypage/changePw";
	}
	
	// ȸ�� Ż��(quit) ��Ʈ�ѷ�
	@RequestMapping(value = "/quit", method = RequestMethod.GET)
	public String quit(UserVO vo, Model model) {
		
		return "/mypage/quit";
	}
	
	// �ϸ�ũ (bookmark) ��Ʈ�ѷ�
	@RequestMapping(value = "/bookmark", method = RequestMethod.GET)
	public String bookmark(UserVO vo, Model model) {
		
		return "/mypage/bookmark";
	}
	
	// ���� (recruit) ��Ʈ�ѷ�
	@RequestMapping(value = "/recruit", method = RequestMethod.GET)
	public String recruit(UserVO vo, Model model) {
		
		return "/mypage/recruit";
	}
	
	// ��û (application) ��Ʈ�ѷ�
		@RequestMapping(value = "/application", method = RequestMethod.GET)
		public String application(UserVO vo, Model model) {
			
			return "/mypage/application";
		}
		
	// 	�Ϸ�(completed) ��Ʈ�ѷ�
		@RequestMapping(value = "/completed", method = RequestMethod.GET)
		public String completed(UserVO vo, Model model) {
			
			return "/mypage/completed";
		}
	
}
