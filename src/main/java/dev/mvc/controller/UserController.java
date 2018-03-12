package dev.mvc.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import dev.mvc.domain.UserVO;
import dev.mvc.persistence.UserDAO;
import dev.mvc.service.UserService;


/**
 * Handles requests for the application home page.
 */
@Controller
//@RequestMapping(value = "/mypage/")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserDAO dao;

	@Inject
	private UserService service;
	
	//ȸ������ ��Ʈ�ѷ�
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinUserGET(UserVO vo, Model model) {
		System.out.println("YWTEST................");
		return "join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinUserPOST(UserVO vo, Model model) {
		
		try {
			service.joinUser(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "login";
	}
	
	// profile ��Ʈ�ѷ�
		@RequestMapping(value = "/profile", method = RequestMethod.GET)

		public String profileGET(Model model,HttpServletRequest request) throws Exception {
			logger.info("========������ get................");
			
			// 1. HttpSession Ŭ������ ��ü�� �������ش�.
			// 2. ���� ��ü�� ���ǿ� ������ ���� ����ش�.
			// 3. ������ ���� �α����� ������� ������ ����ش�.
			// 4. �ش� ���� �̸��� ���� ������ email ������ ����ִ�.
			// 5. �Ʒ��� �ִ� read �Լ��� email�� ����ش�.
			
			HttpSession session = request.getSession();
			UserVO sUser = (UserVO)session.getAttribute("login");
			String email = sUser.getEmail();
			
			UserVO vo = service.read(email);
			model.addAttribute("vo", vo);
			
			return "/mypage/profile";
		}
	
		@RequestMapping(value = "/profile", method = RequestMethod.POST)
		public String update(UserVO vo, Model model) throws Exception {

			logger.info("========������ post................");
			service.update(vo);
			model.addAttribute("vo", vo);
			model.addAttribute("result","�����Ǿ����ϴ�.");
			
			return "/mypage/profile";			

		}
		
		
	// �ΰ�����(addinfo) ��Ʈ�ѷ�
		@RequestMapping(value = "/addInfo", method = RequestMethod.GET)
		public String addInfo(Model model, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			UserVO sUser = (UserVO)session.getAttribute("login");
			String email = sUser.getEmail();
			
			UserVO vo = service.read(email);
			model.addAttribute("vo", vo);
			
			return "/mypage/addInfo";
		}
		
		@RequestMapping(value = "/addInfo", method = RequestMethod.POST)
		public String updateaddInfo(UserVO vo, Model model) throws Exception {
			
			service.updateAddInfo(vo);
			model.addAttribute("vo", vo);
			model.addAttribute("result", "�����Ǿ����ϴ�.");
			
			return "/mypage/addInfo";
		}
	
	
	// ��й�ȣ ����(changePw) ��Ʈ�ѷ�

	@RequestMapping(value = "/changePw", method = RequestMethod.GET)
	public String changePwGET(Model model) throws Exception {
		
		return "/mypage/changePw";
	}
	

	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
	public String changePwPOST(Model model, String nowPw, String newPw1, String newPw2, HttpServletRequest request ) throws Exception {
		
		//1. �Է��� ��й�ȣ�� DB���� ��ġ�ϴ��� üũ
		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		String email = sUser.getEmail();
		
		UserVO vo = service.read(email);
		vo.getPassword();
		System.out.println("=================getpass");
		System.out.println(vo.getPassword());
		System.out.println("=================getpass");
		System.out.println("=================nowpass");
		System.out.println(nowPw);
		System.out.println("=================nowpass");
		
		if(nowPw.equals(vo.getPassword())){  // String�̴� equals�� ������� ��.
			System.out.println("==========if�� ���� ��� = �Է� ���============");
			
		}
			System.out.println("===========if�� ������2222==============");
		//2. �� ���1�� �� ���2�� ���� ���ϰ�
		if(newPw1.equals(newPw2)){
			System.out.println("=================pw1pw2�̰� ����.....?");
		}
		//3. ������ ��ȿ�� �˻�
		
		

		service.changePw(vo);
		model.addAttribute("vo", vo);
		
		return "/mypage/changePw";
	}


	// ȸ�� Ż��(quit) ��Ʈ�ѷ�
	@RequestMapping(value = "/quit", method = RequestMethod.GET)
	public String quit(Model model, String email) throws Exception {
		
		UserVO vo = service.read(email);
		model.addAttribute("vo", vo);
		
		return "/mypage/quit";
	}
	
	@RequestMapping(value = "/quit", method = RequestMethod.POST)
	public String quitget(Model model, UserVO vo) throws Exception {
		
		service.quit(vo);

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
		
// =====================================================================================================
// Sangwook
// =====================================================================================================
		
		// ȸ������
		// �̸����׽�Ʈ  Ajax �� �ʿ���.
		@RequestMapping(value = "/chkEmail", method = RequestMethod.POST)
		public String emailTest(HttpServletRequest request, Model model) throws Exception {
			
			logger.info("chkEmail.......................");
			
			String email = request.getParameter("email1")+"@"+request.getParameter("email2");
						
			if(service.chkEmail(email)==-1){
				model.addAttribute("result","��ȿ���� ���� �̸����Դϴ�.");
				System.out.println("��ȿ���� ���� �̸����Դϴ�.");
			}else if(service.chkEmail(email)==1){
				model.addAttribute("result","�̹� ���Ե� �̸����Դϴ�.");
				System.out.println("�̹̰��Ե��̸���");
			}else{
				model.addAttribute("result","������ȣ�� �Է��ϼ���.");
				// ������ȣ �̸��� ����
				service.sendEmail(email);
			}
			
			return "/mypage/completed";
		}
		
		
		@RequestMapping(value = "/chkEmailAjax", method = RequestMethod.POST)
		  public ResponseEntity<String> ajaxTest(@RequestParam("email1") String email1, @RequestParam("email2") String email2, Model model)throws Exception{
			
			logger.info("chkEmail.......................");
			
			String email = email1+"@"+email2;
			
			ResponseEntity<String> entity = null;
			
			try {
			 
				if(service.chkEmail(email)==-1){
					entity = new ResponseEntity<String>("unvaild", HttpStatus.OK);					
				}else if(service.chkEmail(email)==1){
					entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
				}else{
					entity = new ResponseEntity<String>("success", HttpStatus.OK);
					// ������ȣ �̸��� ����
					service.sendEmail(email);
				}
				  
				
			} catch (Exception e) {
				// TODO: handle exception
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			  
			  return entity;
			  
		  }
		
		@RequestMapping(value = "link", method = RequestMethod.GET)
		public void link(String aa, String bb, Model model)throws Exception{
			
			System.out.println("===============");
			System.out.println(aa+bb);
			System.out.println("===============");
			
			model.addAttribute("aa",aa);
			
		}
		
		@RequestMapping(value="/join/nickname",method = RequestMethod.POST)
		public ResponseEntity<String> chkNickname(@RequestParam("nickname") String nickname) throws Exception{
			
			System.out.println("nicknameChk.................");
			
			ResponseEntity<String> entity = null;
			
			try{
				if(service.chkNickname(nickname)==0){
					entity = new ResponseEntity<String>("success", HttpStatus.OK);
				}else{
					entity = new ResponseEntity<String>("dup", HttpStatus.BAD_REQUEST);
				}
				
			}catch (Exception e) {
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		} 

}
