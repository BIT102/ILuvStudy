package dev.mvc.study;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		return "redirect:/listAll";
	}
	
	//스터디 목록 불러오기
	@RequestMapping(value="/listAll", method = RequestMethod.GET)
	public void readStudy(Criteria cri, Model model) throws Exception {
		
		logger.info("show list..........");
		model.addAttribute("list", service.studyList());
		
		logger.info(cri.toString());
		
//		model.addAttribute("list", service.listCriteria(cri));
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(131);
//		
//		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	//상세페이지
	@RequestMapping(value="/board", method = RequestMethod.GET)
	public void readBoard(@RequestParam("bsBno") int bsBno, Model model) throws Exception {
		
		logger.info("show board.........");
		model.addAttribute(service.read(bsBno));
	}
	
	
//	//연습
//	@RequestMapping(value="/listCri", method = RequestMethod.GET)
//	public void readBoard(Criteria cri, Model model) throws Exception {
//		
//		
//		logger.info(cri.toString());
//		
//		model.addAttribute("list", service.listCriteria(cri));
//		logger.info("show board.........");
//		PageMaker page = new PageMaker();
//		page.setCri(cri);
//		page.setTotalCount(131);
//		
//		model.addAttribute("pageMaker", page);
//	}
}

