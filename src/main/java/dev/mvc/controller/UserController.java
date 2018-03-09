package dev.mvc.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import dev.mvc.domain.UserVO;
import dev.mvc.dto.UserLoginDTO;
import dev.mvc.persistance.UserDAO;
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
	

	
	
	//�α��� ��Ʈ�ѷ�
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto")  UserLoginDTO dto){
		
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(UserLoginDTO dto, HttpSession session, Model model) throws Exception{
		
		UserVO vo = service.login(dto);
		System.out.println("=================vovo=========");
		System.out.println(vo);
		System.out.println("=================vovo=========");
		if(vo==null){
			return ;
		}
		
		model.addAttribute("userVO", vo);
		
		if(dto.isUseCookies()){
			int amount = 60 * 60 * 24 * 7;
			Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
			System.out.println("=============���� getid==============");
			System.out.println(session.getId());
			service.keepLogin(vo.getEmail(), session.getId(), sessionLimit);
		}
	}
	
	
	
	
	
	
	//�α׾ƿ� ��Ʈ�ѷ�
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		Object obj = session.getAttribute("login");
		
		if(obj != null){
			UserVO vo = (UserVO) obj;
			
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null){
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getEmail(), session.getId(), new Date());
			}
		}
				
		return "/mypage/logout";
	}
	
	
	
	//ȸ������ ��Ʈ�ѷ�
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinUserGET(UserVO vo, Model model) {
		
		return "join";
	}
	
	
	@RequestMapping(value = "/joinUser", method = RequestMethod.POST)
	public String joinUserPOST(UserVO vo, Model model) {
		
		try {
			service.joinUser(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "join";
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

//	//ajax ��� ����
//	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
//	public ResponseEntity<String> changePw(@RequestParam("nowPw")String nowPw,
//									@RequestParam("newPw1") String newPw1, 
//									@RequestParam("newPw2") String newPw2, 
//									HttpServletRequest request) throws Exception{
//	
//		
//		System.out.println("======nowPw ����Pw=============");
//		System.out.println(nowPw);
//		System.out.println(newPw1);
//		System.out.println(newPw2);
//		
//		HttpSession session = request.getSession();
//		UserVO sUser = (UserVO)session.getAttribute("login");
//		String email = sUser.getEmail();
//		
//		UserVO vo = service.read(email);
//		vo.getPassword();
//		
//		System.out.println("======���н�����==========");
//		System.out.println(vo.getPassword());
//		
//		
//		
//		
//		ResponseEntity<String> entity = null;
//		
//		try{
//			if(nowPw.equals(vo.getPassword())){
//			//entity = new ResponseEntity<String>("pw equal", HttpStatus.OK); // "" �� �ȿ� ���� jsp���Ͽ� result���� ��
//			System.out.println("============pw1pw2 ����??=============");
//		}else{
//			entity = new ResponseEntity<String>("DB pass != Enter pass", HttpStatus.OK);
//		}
//			
//		}catch(Exception e){
//			entity =  new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//		
//	}

	
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
	
}
