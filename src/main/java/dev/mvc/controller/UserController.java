package dev.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import dev.mvc.domain.PageMakerStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;
import dev.mvc.domain.UserVO;
import dev.mvc.persistence.UserDAO;
import dev.mvc.service.BookmarkService;
import dev.mvc.service.LoginService;
import dev.mvc.service.StudyService;
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
	
	@Inject
	private StudyService studyService;

	@Inject
	private BookmarkService bookservice;
	
	@Inject
	private LoginService lservice;
	
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
		
		System.out.println("=============vo ����========");
		System.out.println(vo);
		return "/mypage/profile";
	}
	
		@RequestMapping(value = "/profile", method = RequestMethod.POST)
		public String update(UserVO vo, Model model) throws Exception {

			logger.info("========������ post................");
			service.update(vo);
			String email = vo.getEmail();
			service.read(email);
			model.addAttribute("vo", service.read(email));
			model.addAttribute("result11","�����Ǿ����ϴ�.");
			
			return "/mypage/profile";			

		}
		
				
	// 	profile ����÷�� ��Ʈ�ѷ�(Ajax)
		/*@RequestMapping(value = "/insertImg", method = RequestMethod.GET)
		public void insertImg(){
			
		}*/
		
//		@RequestMapping(value = "/insertImg", method = RequestMethod.POST)
//		public void insertImg(@RequestParam("data") String data) throws Exception{
//			
//			System.out.println("======������========");
//			System.out.println(data);
//		}
		
	@RequestMapping(value = "/insertImgUrl", method = RequestMethod.POST)
	public ResponseEntity<String> insertImg(UserVO vo) throws Exception{
// �׳� void�� �ص� ��
		
		System.out.println("==========�μ�Ʈ�̹���==========");
		
		ResponseEntity<String> entity = null;
		System.out.println("vo=ddd"+vo);
		service.insertImg(vo);
		System.out.println("vo="+vo);

		return entity;
			
/*			������.jsp���� data�� imgAddr�� ���.
			imgAddrParam�� �� imgAddr�� ���
			imgAddrParam�� �Ķ����� �޾Ƽ�. imgName���� �Ű�������
			@RequestMapping(value = "/insertImg", method = RequestMethod.POST)
			public ResponseEntity<String> insertImg(@RequestParam("imgAddrParam") String imgName, UserVO vo) throws Exception{
				
				System.out.println("������="+imgName);
				System.out.println("�����ʻ���="+service.insertImg(data));
				
				ResponseEntity<String> entity = null;
				System.out.println("vo=ddd"+vo);
				service.insertImg(vo);
				System.out.println("vo="+vo);
*/
			
		}
	
				
		
	// �г��� �ߺ�Ȯ��
/*		@RequestMapping(value= "/nickCheck", method = RequestMethod.POST)
		public ResponseEntity<String> nickCheck(@RequestParam("nickName") String nickName, UserVO vo) throws Exception{
			System.out.println("======�г���=====");
			System.out.println(nickName);
	
			service.nickCheck(nickName);
			System.out.println("========�ٺ��ٺ�=======");
			System.out.println("�����:"+service.nickCheck(nickName));
			
			ResponseEntity<String> entity = null;
			
		try{	
			if(service.nickCheck(nickName)==0){
				entity = new ResponseEntity<String>("success", HttpStatus.OK); 
			}else{
				entity = new ResponseEntity<String>("fail", HttpStatus.OK);
			}
		}catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	
			return entity;						
		}*/
		
		
		@RequestMapping(value="/nickCheck", method = RequestMethod.POST)
		public ResponseEntity<String> nickCheck(@RequestParam("nickName") String nickName) throws Exception{
			
			service.nickCheck(nickName);
			
			ResponseEntity<String> entity = null;
			
		try{	
			if(service.nickCheck(nickName)==0){
				entity = new ResponseEntity<String>("Available nickname.", HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>("Unavailable nickname.", HttpStatus.OK);
			}
		}catch (Exception e){
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}	
			
			return entity;
		}
		
	
	// �ΰ�����(addinfo) ��Ʈ�ѷ�
		@RequestMapping(value = "/addInfo", method = RequestMethod.GET)
		public String addInfo(Model model, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			UserVO sUser = (UserVO)session.getAttribute("login");
			String email = sUser.getEmail();
			
			UserVO vo = service.read(email);
			model.addAttribute("vo", vo);
			
			model.addAttribute("rglist", studyService.rgList()); 
			
			System.out.println("=====�ΰ�����====");
			System.out.println("�ΰ�����:"+studyService.rgList());
			
			return "/mypage/addInfo";
		}
		
		@RequestMapping(value = "/addInfo", method = RequestMethod.POST)
		public String updateaddInfo(UserVO vo, Model model) throws Exception {
			
			service.updateAddInfo(vo);
			model.addAttribute("vo", vo);
			model.addAttribute("result", "�����Ǿ����ϴ�.");
			
			return "/mypage/addInfo";
		}
		
		
		//JSON smallī�װ�(region)  //URL /region/�߰�  (��ġ���ʰ�)
		@RequestMapping(value="/register1/region/{rSId}",method = RequestMethod.GET)
			public ResponseEntity<List<StudyVO>> rglist(@PathVariable("rSId") String rsId) {
			
				ResponseEntity<List<StudyVO>> entity = null;
				try{
					entity = new ResponseEntity<>(studyService.rgList2(rsId), HttpStatus.OK);
				}   catch (Exception e) {
					e.printStackTrace();
					entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				}
				
				return entity;
		}

	
	// ��й�ȣ ����(changePw) ��Ʈ�ѷ�
	@RequestMapping(value = "/changePw", method = RequestMethod.GET)
	public String changePwGET(Model model) throws Exception {
		
		return "/mypage/changePw";
	}
	

//	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
//	public String changePwPOST(Model model, String nowPw, String newPw1, String newPw2, HttpServletRequest request) throws Exception {
//		
//		//1. �Է��� ��й�ȣ�� DB���� ��ġ�ϴ��� üũ
//		HttpSession session = request.getSession();
//		UserVO sUser = (UserVO)session.getAttribute("login");
//		String email = sUser.getEmail();
//		
//		UserVO vo = service.read(email);
//		vo.getPassword();
//		
//		System.out.println("���н�����="+vo.getPassword());
//		System.out.println("�����н�����="+nowPw);
//		
//		
//		if(nowPw.equals(vo.getPassword())){  // String�̴� equals�� ������� ��.
//			System.out.println("==========if�� ���� ��� = �Է� ���============");			
//		}
//			System.out.println("===========if�� ������2222==============");
//		//2. �� ���1�� �� ���2�� ���� ���ϰ�
//		if(newPw1.equals(newPw2)){
//			System.out.println("=================pw1pw2�̰� ����.....?");
//		}
//		//3. ������ ��ȿ�� �˻�
//		
//		service.changePw(vo);
//		model.addAttribute("vo", vo);
//		
//		return "/mypage/changePw";
//	}
	
	//ajax ��� ����
	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
	public ResponseEntity<String> changePw(@RequestParam("nowPw")String nowPw,
									@RequestParam("newPw1") String newPw1, 
									@RequestParam("newPw2") String newPw2, 
									HttpServletRequest request) throws Exception{
			
		System.out.println("======nowPw ����Pw=============");
		System.out.println(nowPw);
		System.out.println(newPw1);
		System.out.println(newPw2);
		
		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		String email = sUser.getEmail();
		
		UserVO vo = service.read(email);
		vo.getPassword();
		
		System.out.println("======���н�����==========");
		System.out.println(vo.getPassword());
		
		vo.setPassword(newPw1);
		
		ResponseEntity<String> entity = null;
		
		
		if(nowPw.equals(vo.getPassword())){
			entity = new ResponseEntity<String>("pw equal", HttpStatus.OK); // "" �� �ȿ� ���� jsp���Ͽ� result���� ��
			System.out.println("============pw1pw2 ����??=============");
			vo.setPassword(newPw1);
			System.out.println("���н�1:"+newPw1);
		}else{
			entity = new ResponseEntity<String>("Please Check your password", HttpStatus.OK);
		}
			
		
		return entity;
		
	}
	
	
	


	// ȸ�� Ż��(quit) ��Ʈ�ѷ�
	@RequestMapping(value = "/quit", method = RequestMethod.GET)
	public String quit(Model model, String email) throws Exception {
		
		UserVO vo = service.read(email);
		model.addAttribute("vo", vo);
		
		return "/mypage/quit";
		
	}
	
	@RequestMapping(value = "/quit", method = RequestMethod.POST)
	public String quitPost(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		logger.info("logout..........");
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
				lservice.keepLogin(vo.getEmail(), session.getId(), new Date());
			}
			
			service.quit(vo);
		}
				
		return "redirect:/study/main";
	}
	
	// �ϸ�ũ (bookmark) ��Ʈ�ѷ�  =��=
	@RequestMapping(value = "/bookmark", method = RequestMethod.GET)
	public String bookmark(@ModelAttribute("cri") SearchCriteriaStudy cri, Model model, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		String email = sUser.getEmail();
		model.addAttribute("list", bookservice.listBookmark(email));

		PageMakerStudy pageMakerStudy = new PageMakerStudy();

		pageMakerStudy.setCri(cri);

		model.addAttribute("pageMakerStudy", pageMakerStudy);

		return "/mypage/bookmark";
	}
	
	// ���� (recruit) ��Ʈ�ѷ�
	@RequestMapping(value = "/recruit", method = RequestMethod.GET)
	public String recruit(@ModelAttribute("cri") SearchCriteriaStudy cri, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		String email = sUser.getEmail();
		model.addAttribute("list", service.recruitList(email));
		
		PageMakerStudy pageMakerStudy = new PageMakerStudy();
		
		pageMakerStudy.setCri(cri);
		
		model.addAttribute("pageMakerStudy", pageMakerStudy);
		
		return "/mypage/recruit";
	}
	
	// ��û (application) ��Ʈ�ѷ�
	@RequestMapping(value = "/application", method = RequestMethod.GET)
	public String application(@ModelAttribute("cri") SearchCriteriaStudy cri, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		String email = sUser.getEmail();
		
		model.addAttribute("list", service.applyList(email));
		
		System.out.println("��û��û : " + service.applyList(email));
		
		PageMakerStudy pageMakerStudy = new PageMakerStudy();
		
		pageMakerStudy.setCri(cri);
			
		model.addAttribute("pageMakerStudy", pageMakerStudy);
		
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
		public ResponseEntity<String> emailTest(String email, Model model) throws Exception {
			
			logger.info("chkEmail.......................");
			ResponseEntity<String> entity = null;
			
			if(service.chkEmail(email)==1){
				entity = new ResponseEntity<String>("fail", HttpStatus.OK);
				System.out.println("�̹̰��Ե��̸���");
			}else{
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}
			
			return entity;
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
		
		@RequestMapping(value = "emailConf", method = RequestMethod.GET)
		public void emailConf(String email, Model model)throws Exception{
			
			logger.info("emailConf............");
			
			service.emailConf(email);
			
			
		}
		
		@RequestMapping(value="/join/nickname",method = RequestMethod.POST)
		public ResponseEntity<String> chkNickname(@RequestParam("nickname") String nickname) throws Exception{
			
			System.out.println("nicknameChk.................");
			
			ResponseEntity<String> entity = null;
			
			try{
				if(service.chkNickname(nickname)==0){
					entity = new ResponseEntity<String>("success", HttpStatus.OK);
				}else{
					entity = new ResponseEntity<String>("dup", HttpStatus.OK);
				}
				
			}catch (Exception e) {
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		} 

}
