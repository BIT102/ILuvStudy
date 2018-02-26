package dev.mvc.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.admin.Criteria;
import dev.mvc.admin.PageMaker;
import dev.mvc.admin.TestControllerAdmin;
import dev.mvc.domain.AdminVO;
import dev.mvc.dto.AdminDTO;
import dev.mvc.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(TestControllerAdmin.class);
	
	@Inject
	private AdminService service;
	
	//admin/adminLogin.jsp
	@RequestMapping(value="/adminLogin", method=RequestMethod.GET)
	public void loginGET(@ModelAttribute("vo") AdminVO vo){
		logger.info("adminLogin get...");
	}
	
	//admin/adminLoginPost.jsp
	@RequestMapping(value="/adminLoginPost", method=RequestMethod.POST)
	public void loginPOST(AdminDTO dto, HttpSession session, Model model)throws Exception{
		logger.info("loginPOST post...");
		
		AdminVO vo = service.login(dto);
		
		if(vo == null){
			return;
		}
		
		model.addAttribute("AdminVO", vo);
	}
	
	//admin/userList.jsp
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String userList(Locale locale, Model model) {
		logger.info("userList get...");
		return "admin/userList";
	}
	
	//admin/adminList.jsp
	@RequestMapping(value = "/adminList", method = RequestMethod.GET)
	public void adminList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info("adminList get...");
		logger.info(cri.toString());
		model.addAttribute("list", service.adminList(cri));  //페이징 처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.adminCountPaging(cri));  //totalCount 반환
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//admin/adminDetail.jsp
	@RequestMapping(value="/adminDetail", method = RequestMethod.GET)
	public void adminDetail(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, 
						Model model) throws Exception{
		logger.info("adminDetail get...");
		logger.info(cri.toString());
		model.addAttribute(service.adminDetail(bno));
	}
	
	//admin/adminDetail.jsp 에서 계정 정보 수정 시
	@RequestMapping(value="/adminDetail", method = RequestMethod.POST)
	public String adminUpdate(AdminVO vo, Criteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("adminDetail post...");
		logger.info(cri.toString());
		service.adminUpdate(vo);
		
		//페이징 정보 유지
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		//검색 정보 유지
		rttr.addAttribute("idKeyword", cri.getIdKeyword());
		rttr.addAttribute("nameKeyword", cri.getNameKeyword());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/admin/adminList";
	}
	
	//admin/adminRegister.jsp 페이지 이동
	@RequestMapping(value="/adminRegister", method = RequestMethod.GET)
	public void adminRegister(AdminVO vo, Model model) throws Exception{
		logger.info("adminRegister get...");
	}
	
	//admin/adminRegister.jsp 패아자애서 계정 등록
	@RequestMapping(value="/adminRegister", method = RequestMethod.POST)
	public String adminRegisterPOST(AdminVO vo, Model model) throws Exception{
		logger.info("adminRegister post...");
		logger.info(vo.toString());
		
		service.adminRegister(vo);
		
		model.addAttribute("result", "SUCCESS");
		
		return "redirect:/admin/adminList";
	}
	

}
