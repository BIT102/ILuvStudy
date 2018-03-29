package dev.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.CriteriaStudy;
import dev.mvc.domain.PageMakerStudy;
import dev.mvc.domain.SearchCriteriaStudy;
import dev.mvc.domain.StudyVO;
import dev.mvc.domain.UserVO;
import dev.mvc.service.ReplyStudyService;
import dev.mvc.service.BookmarkService;
import dev.mvc.service.StudyService;

@Controller
@RequestMapping("/study/*")
public class StudyController {

	private static final Logger logger = LoggerFactory.getLogger(StudyController.class);

	@Inject
	private StudyService service;

	@Inject
	private ReplyStudyService replyService;

	@Inject
	private BookmarkService bookservice;
	
	// 스터디 등록 김상욱 수정
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET(Model model, HttpServletRequest request)throws Exception{
		
		logger.info("register get..........");

		// 카테고리 대분류값 보내기
		model.addAttribute("studyCategory", service.studyCategory());
		
		// 지역대분류값 보내기
		model.addAttribute("region", service.region());
		
		// session 으로 email 값 보내기
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("login");
		//model.addAttribute("email",user.getEmail());
		
		return "/study/register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(StudyVO vo, RedirectAttributes rttr)throws Exception{
		
		logger.info("register POST...........");
		System.out.println("vo = "+vo);
		
		
		if(vo.getTitle()==null||vo.getNow()==null||vo.getMax()==null||vo.getrDId()==null
				||vo.getAge()==null||vo.getSc()==null||vo.getSd()==null||vo.getSt()==null||vo.getEt()==null) {
			
			rttr.addFlashAttribute("msg", "no");
			return "redirect:/study/register";
		} else {
			service.regist(vo);
		}		
		return "redirect:/study/main";
	}

	// JSON small카테고리(study) //URL /category/추가
	@RequestMapping(value = "/register1/category/{csId}", method = RequestMethod.GET)
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

	// JSON small카테고리(region) //URL /region/추가 (겹치지않게)
	@RequestMapping(value = "/register1/region/{rSId}", method = RequestMethod.GET)
	public ResponseEntity<List<StudyVO>> rglist(@PathVariable("rSId") String rsId) {

		ResponseEntity<List<StudyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.rgList2(rsId), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 스터디 목록 불러오기

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void readStudy(@ModelAttribute("cri") SearchCriteriaStudy cri, Model model) throws Exception {

		logger.info("show list..........");
		System.out.println("=========================");
		System.out.println(cri);
		System.out.println("=========================");
		StudyVO vo = new StudyVO();

		
		PageMakerStudy pageMakerStudy = new PageMakerStudy();
		
		
		pageMakerStudy.setCri(cri);
		

				
		model.addAttribute("pageMakerStudy", pageMakerStudy);
		
		
		model.addAttribute("list", service.listSearchCriteria(cri));

		pageMakerStudy.setTotalCount(service.listSearchCount(cri));



//3월 25일 머지 주석 처리
		//model.addAttribute("list", service.studyList());
		//model.addAttribute("list", service.listSearchCriteria(cri));
		//model.addAttribute("rgList", service.rgList());
		//model.addAttribute("catList", service.catList());

		
		

	}


	// main화면 맵핑
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainStudy(@ModelAttribute("cri") SearchCriteriaStudy cri, Model model) throws Exception {

		logger.info("show list..........");

		List<StudyVO> studyList = service.studyList().subList(0, 8);

		model.addAttribute("list", studyList);

		List<StudyVO> SearchList = service.listSearchCriteria(cri).subList(0, 8);

		model.addAttribute("list", SearchList);

		PageMakerStudy pageMakerStudy = new PageMakerStudy();

		pageMakerStudy.setCri(cri);

		pageMakerStudy.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMakerStudy", pageMakerStudy);

		System.out.println("++++++++++++++++++++++++++++++++++++++");
		System.out.println(SearchList);
		System.out.println("++++++++++++++++++++++++++++++++++++++");

	}

	// 상세페이지
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public void readBoard(@RequestParam("bno") int bno, @ModelAttribute("cri") CriteriaStudy cri, Model model,
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		
		if(sUser == null) {
		model.addAttribute(service.read(bno));

		model.addAttribute("list", replyService.listReply(bno));  //댓글 정보 가져옴

		
		} else {
		
		String email = sUser.getEmail();
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("writer", email);
		map.put("bsbno", bno);
		
		System.out.println("!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println(map);
		System.out.println(bookservice.bolist());
		System.out.println("!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		
		model.addAttribute(service.read(bno));
		model.addAttribute("bolist", bookservice.bolist());
		}
	}

	// 상세페이지 제거
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, CriteriaStudy cri, RedirectAttributes rttr) throws Exception {

		service.remove(bno);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/study/listAll";
	}

	// 파일가져오기
	@RequestMapping("/getFile/{bsBno}")
	@ResponseBody
	public List<String> getFile(@PathVariable("bsBno") Integer bsBno) throws Exception {
		return service.getFile(bsBno);
	}

	// JSON small카테고리
	@RequestMapping(value = "/listAll/{csId}", method = RequestMethod.GET)
	public ResponseEntity<List<StudyVO>> list(@PathVariable("csId") String csId) throws Exception{

		ResponseEntity<List<StudyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.catList2(csId), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}



	// 수정페이지
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model)
			throws Exception {

		model.addAttribute(service.read(bno));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(StudyVO vo, Criteria cri, RedirectAttributes rttr) throws Exception {

		service.modify(vo);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/study/listAll";
	}

}
