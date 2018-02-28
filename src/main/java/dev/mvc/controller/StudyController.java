package dev.mvc.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.domain.StudyVO;
import dev.mvc.service.StudyService;
  
@Controller
@RequestMapping("/study/*")
public class StudyController {
	
	private static final Logger logger = LoggerFactory.getLogger(StudyController.class);

	@Inject
	private StudyService service;
	
	//���͵� ���ȭ��
	@RequestMapping(value = "/register1", method = RequestMethod.GET) 
	public void registerGET(StudyVO vo, Model model) throws Exception {
		
		logger.info("register1 get.........");
	}		
	
	//���͵� ��ϰǳ��ֱ�
	@RequestMapping(value = "/register1", method = RequestMethod.POST)
	public String registPOST(StudyVO vo, RedirectAttributes rttr) throws Exception {
		
		logger.info("regist post......");
		logger.info(vo.toString());
		
		service.regist(vo);
	
	//	rttr.addFlashAttribute("msg", "success");
		return "redirect:/study/listAll";
	}
	
	//���͵� ��� �ҷ�����
	@RequestMapping(value="/listAll", method = RequestMethod.GET)
	public void readStudy(Model model) throws Exception {
		
		logger.info("show list..........");
		model.addAttribute("list", service.studyList());

	}

	//��������
	@RequestMapping(value="/board", method = RequestMethod.GET)
	public void readBoard(@RequestParam("bno") int bno, Model model) throws Exception {
		
		model.addAttribute(service.read(bno));
	}
}

