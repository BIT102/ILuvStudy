package dev.mvc.controller;

import java.util.List;

import javax.inject.Inject;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.domain.CriteriaStudy;
import dev.mvc.domain.PageMakerStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;
import dev.mvc.service.StudyService;
  
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
		
		model.addAttribute("catlist", service.catList()); //BigCat 
		model.addAttribute("rglist", service.rgList()); //BigCAT(region)
	}
	
	//JSON small카테고리(study)  //URL /category/추가
	@RequestMapping(value="/register1/category/{csId}", method = RequestMethod.GET)
	  public ResponseEntity<List<StudyVO>> list2(@PathVariable("csId") String csId) throws Exception {

	    ResponseEntity<List<StudyVO>> entity = null;

	    try {
	    	
	      entity = new ResponseEntity<>(service.catList2(csId), HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }

	    return entity;
	  }
	
//JSON small카테고리(region)  //URL /region/추가  (겹치지않게)
	@RequestMapping(value="/register1/region/{rSId}",method = RequestMethod.GET)
		public ResponseEntity<List<StudyVO>> rglist(@PathVariable("rSId") String rsId) {
		
			ResponseEntity<List<StudyVO>> entity = null;
			try{
				entity = new ResponseEntity<>(service.rgList2(rsId), HttpStatus.OK);
			}   catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
			return entity;
	}
	
	
	//스터디 등록건네주기
	@RequestMapping(value = "/register1", method = RequestMethod.POST)
	public String registPOST(StudyVO vo, RedirectAttributes rttr, Model model) throws Exception {
		
		logger.info("regist post......");
		logger.info(vo.toString());
		
		service.regist(vo);
		

		rttr.addFlashAttribute("msg", "success");
		
		//return "redirect:/study/listAll";
		return "/join";
	
	}
	
	//스터디 목록 불러오기
	@RequestMapping(value="/listAll", method = RequestMethod.GET)
	public void readStudy(@ModelAttribute("cri") SearchCriteriaStudy cri, Model model) throws Exception {
		
		logger.info("show list..........");
	
		model.addAttribute("list", service.studyList());
		//model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("list", service.listSearchCriteria(cri));

		PageMakerStudy pageMakerStudy = new PageMakerStudy();
		
		pageMakerStudy.setCri(cri);
		//pageMakerStudy.setTotalCount(service.listCountCriteria(cri));
		pageMakerStudy.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMakerStudy", pageMakerStudy);

		
	}
	
	//main화면 맵핑
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public void mainStudy(@ModelAttribute("cri") SearchCriteriaStudy cri, Model model) throws Exception {
		
		logger.info("show list..........");
		
		List<StudyVO> studyList = service.studyList().subList(0, 6);
				
		model.addAttribute("list", studyList);
		
		model.addAttribute("list", service.listSearchCriteria(cri));

		PageMakerStudy pageMakerStudy = new PageMakerStudy();
		
		pageMakerStudy.setCri(cri);
		
		pageMakerStudy.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMakerStudy", pageMakerStudy);
		
	}

	//상세페이지
	@RequestMapping(value="/board", method = RequestMethod.GET)
	public void readBoard(@RequestParam("bno") int bno,
			              @ModelAttribute("cri") CriteriaStudy cri, 
			              Model model) throws Exception {
		
		model.addAttribute(service.read(bno));
	}
	
	//상세페이지 제거
	@RequestMapping(value="/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno,
						 CriteriaStudy cri,
	   	                 RedirectAttributes rttr) throws Exception {
		
		service.remove(bno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/study/listAll";
	}
	
	//파일가져오기
	@RequestMapping("/getFile/{bsBno}")
	@ResponseBody
	public List<String> getFile(@PathVariable("bsBno") Integer bsBno) throws Exception {
		return service.getFile(bsBno);
	}
}



