package dev.mvc.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dev.mvc.domain.UserVO;
import dev.mvc.persistance.UserDAO;

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
	public String joinUserGET(UserVO vo, Model model) {
		
		System.out.println("YWTEST................");
		return "join";
	}
	
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinUserPOST(UserVO vo, Model model) {
		
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
		public String profileGET(Model model, String email) throws Exception {
			
			UserVO vo = dao.read(email);
			//dao.read(email);
			//System.out.println(dao.read(email));
			//model.addAttribute(email);
			model.addAttribute("vo", vo);
			
			return "/mypage/profile";
		}
	
		@RequestMapping(value = "/profile", method = RequestMethod.POST)
		public String update(UserVO vo, Model model) throws Exception {
			
			dao.update(vo);
			model.addAttribute("vo", vo);
	
			return "/mypage/profile";
		}
		
	// �ΰ�����(addinfo) ��Ʈ�ѷ�
		@RequestMapping(value = "/addInfo", method = RequestMethod.GET)
		public String addInfo(Model model, String email) throws Exception {
			
			UserVO vo = dao.read("j");
			model.addAttribute("vo", vo);
			
			return "/mypage/addInfo";
		}
		
		@RequestMapping(value = "/addInfo", method = RequestMethod.POST)
		public String updateaddInfo(UserVO vo, Model model) throws Exception {
			
			dao.updateAddInfo(vo);
			model.addAttribute("vo", vo);
			
			return "/mypage/addInfo";
		}
	
	
	// ��й�ȣ ����(changePw) ��Ʈ�ѷ�
	@RequestMapping(value = "/changePw", method = RequestMethod.GET)
	public String changePwGET(Model model, String password) throws Exception {
		
		UserVO vo = dao.read(password);
		model.addAttribute("vo", vo);
		
		return "/mypage/changePw";
	}
	
	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
	public String changePwPOST(UserVO vo, Model model) throws Exception {
		

		dao.changePw(vo);
		model.addAttribute("vo", vo);
		
		
		
		
		return "/mypage/changePw";
		
		

	}
	
	
	// ȸ�� Ż��(quit) ��Ʈ�ѷ�
	@RequestMapping(value = "/quit", method = RequestMethod.GET)
	public String quit(Model model, String email) throws Exception {
		
		UserVO vo = dao.read(email);
		model.addAttribute("vo", vo);
		
		return "/mypage/quit";
	}
	
	@RequestMapping(value = "/quit", method = RequestMethod.POST)
	public String quitget(Model model, UserVO vo) throws Exception {
		
		dao.quit(vo);
		model.addAttribute("vo", vo);
		
		return "/mypage/quit";
	}
	
	// �ϸ�ũ (bookmark) ��Ʈ�ѷ�
	@RequestMapping(value = "/bookmark", method = RequestMethod.GET)
	public String bookmark() {
		
		return "/mypage/bookmark";
	}
	
	// ���� (recruit) ��Ʈ�ѷ�
	@RequestMapping(value = "/recruit", method = RequestMethod.GET)
	public String recruit() {
		
		return "/mypage/recruit";
	}
	
	// ��û (application) ��Ʈ�ѷ�
		@RequestMapping(value = "/application", method = RequestMethod.GET)
		public String application() {
			
			return "/mypage/application";
		}
		
	// 	�Ϸ�(completed) ��Ʈ�ѷ�
		@RequestMapping(value = "/completed", method = RequestMethod.GET)
		public String completed() {
			
			return "/mypage/completed";
		}
	
}
