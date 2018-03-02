package dev.mvc.controller;

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

import dev.mvc.domain.AdminVO;
import dev.mvc.domain.Criteria;
import dev.mvc.domain.PageMaker;
import dev.mvc.domain.UserVO;
import dev.mvc.dto.AdminDTO;
import dev.mvc.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService service;
	
//�α��� ó��
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
//�α��� ó�� ��
	
//admin���� > ��������
	//admin/adminList.jsp
	@RequestMapping(value = "/adminList", method = RequestMethod.GET)
	public void adminList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info("adminList get...");
		logger.info(cri.toString());
		model.addAttribute("list", service.adminList(cri));  //����¡ ó��
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.adminCountPaging(cri));  //totalCount ��ȯ
		
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
	
	//admin/adminDetail.jsp ���� ���� ���� ���� ��
	@RequestMapping(value="/adminDetail", method = RequestMethod.POST)
	public String adminUpdate(AdminVO vo, Criteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("adminDetail post...");
		logger.info(cri.toString());
		service.adminUpdate(vo);
		
		//����¡ ���� ����
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		//�˻� ���� ����
		rttr.addAttribute("idKeyword", cri.getIdKeyword());
		rttr.addAttribute("nameKeyword", cri.getNameKeyword());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/admin/adminList";
	}
	
	//admin/adminRegister.jsp ������ �̵�
	@RequestMapping(value="/adminRegister", method = RequestMethod.GET)
	public void adminRegister(AdminVO vo, Model model) throws Exception{
		logger.info("adminRegister get...");
	}
	
	//admin/adminRegister.jsp �о��ھּ� ���� ���
	@RequestMapping(value="/adminRegister", method = RequestMethod.POST)
	public String adminRegisterPOST(AdminVO vo, Model model) throws Exception{
		logger.info("adminRegister post...");
		logger.info(vo.toString());
		
		service.adminRegister(vo);
		
		model.addAttribute("result", "SUCCESS");
		
		return "redirect:/admin/adminList";
	}
//admin���� > �������� ��

//ȸ������ > ȸ����ȸ
	//admin/userList.jsp
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public void userList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("userList get...");
		logger.info(cri.toString());
		model.addAttribute("list", service.userList(cri));  //����¡ ó��
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.userCountPaging(cri));  //totalCount ��ȯ
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//admin/userDetail.jsp
	@RequestMapping(value="/userDetail", method = RequestMethod.GET)
	public void userDetail(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, 
						Model model) throws Exception{
		logger.info("userDetail get...");
		logger.info(cri.toString());
		model.addAttribute(service.userDetail(bno));
	}
	
	//admin/userDetail.jsp ���� ���� ���� ���� ��
	@RequestMapping(value="/userDetail", method = RequestMethod.POST)
	public String userUpdate(UserVO vo, Criteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("userDetail post...");
		logger.info(cri.toString());
		service.userUpdate(vo);
		
		//����¡ ���� ����
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		//�˻� ���� ����
		rttr.addAttribute("isDelType", cri.getIsDelType());
		rttr.addAttribute("emailKeyword", cri.getEmailKeyword());
		rttr.addAttribute("nickNameKeyword", cri.getNickNameKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/admin/userList";
	}
	
}
