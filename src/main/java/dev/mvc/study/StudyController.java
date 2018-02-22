package dev.mvc.study;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/study/*")
public class StudyController {
	
	private static final Logger logger = LoggerFactory.getLogger(StudyController.class);

	@Inject
	private StudyService service;
	
	@RequestMapping(value = "/register1", method = RequestMethod.GET) 
	public void registerGET(StudyVO vo, Model model) throws Exception {
		
		logger.info("register1 get.........");
	}		
	
	@RequestMapping(value = "/register1", method = RequestMethod.POST)
	public String registPOST(StudyVO vo, Model model) throws Exception {
		
		logger.info("regist post......");
		logger.info(vo.toString());
		
		service.regist(vo);
		
		return "/home";
	}
}

