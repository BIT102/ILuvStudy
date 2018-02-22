package dev.mvc.study;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/study/*")
public class StudyController {
	
	private static final Logger logger = LoggerFactory.getLogger(StudyController.class);

	@Inject
	private StudyService service;
	
	//스터디 등록화면
	@RequestMapping(value = "/register1", method = RequestMethod.GET) 
	public void registerGET(StudyVO vo, Model model) throws Exception {
		
		logger.info("register1 get.........");
	}		
	
	//스터디 등록건네주기
	@RequestMapping(value = "/register1", method = RequestMethod.POST)
	public String registPOST(StudyVO vo, RedirectAttributes rttr) throws Exception {
		
		logger.info("regist post......");
		logger.info(vo.toString());
		
		service.regist(vo);
	
	//	rttr.addFlashAttribute("msg", "success");
		return "/listAll";
	}
	
	//스터디 목록 불러오기
	@RequestMapping(value="/listAll", method = RequestMethod.GET)
	public void readStudy(Model model) throws Exception {
		
		logger.info("show notice..........");
		model.addAttribute("list", service.studyList());
	}
}

