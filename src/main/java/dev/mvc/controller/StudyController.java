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
import org.springframework.web.bind.annotation.RequestBody;
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
import dev.mvc.service.AdminService;
import dev.mvc.service.ApplyService;
import dev.mvc.service.BookmarkService;
import dev.mvc.service.ReplyStudyService;
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
	
	@Inject
	private AdminService adservice;
	
	@Inject
	private ApplyService apservice;
	
	
	//���͵� ����
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public void updateGET(int bno, Model model) throws Exception {
		
		
		//���͵� ī�װ� ���� ������
		model.addAttribute("studyCategory", service.studyCategory());
		//�������̺� ����
		model.addAttribute("region", service.region());
		//���͵� �� ����
		model.addAttribute(adservice.studyDetail(bno));
		//���͵� ī�װ� ���� ����
		model.addAttribute("studyDC", adservice.studyDetailC(bno));

	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updatePOST(StudyVO vo, RedirectAttributes rttr) throws Exception {
	
		
		service.update(vo);
		
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
		System.out.println(vo);
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");	
	
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/study/listAll";
	}
	
	
	// ���͵� ��� ���� ����
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET(Model model, HttpServletRequest request)throws Exception{
		
		
		logger.info("register get..........");

		// ī�װ� ��з��� ������
		model.addAttribute("studyCategory", service.studyCategory());
		// ������з��� ������
		model.addAttribute("region", service.region());
				
		
		// session ���� email �� ������
		//���� ����� �α����� ������� �ٲܲ��ϴ�.
		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		String email = sUser.getEmail();
		
		
	
		model.addAttribute("email", email);
		
		return "/study/register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(StudyVO vo, RedirectAttributes rttr)throws Exception{
		
		
		System.out.println("<><><><<><><><><><><><><><><><><><><>><");
		System.out.println(vo);
		System.out.println("<><><><><>><><><><><><><><><><><><><><><>");
		
		
		
		logger.info("register POST...........");
		System.out.println("vo = "+vo);
		
		service.regist(vo);
		
		return "redirect:/study/main";
	}


	// ���͵� ��� �ҷ�����

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



//3�� 25�� ���� �ּ� ó��
		//model.addAttribute("list", service.studyList());
		//model.addAttribute("list", service.listSearchCriteria(cri));
		//model.addAttribute("rgList", service.rgList());
		//model.addAttribute("catList", service.catList());

		
		

	}


	// mainȭ�� ����
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainStudy(@ModelAttribute("cri") SearchCriteriaStudy cri, Model model) throws Exception {

		logger.info("show list..........");

/*		List<StudyVO> studyList = service.studyList().subList(0, 8);

		model.addAttribute("list", studyList);*/

		List<StudyVO> SearchList = service.listSearchCriteria(cri).subList(0, 8);

		model.addAttribute("list", SearchList);
		
		
		
		model.addAttribute("vctList", service.vctList(cri));

		PageMakerStudy pageMakerStudy = new PageMakerStudy();

		pageMakerStudy.setCri(cri);

		pageMakerStudy.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMakerStudy", pageMakerStudy);

		System.out.println("++++++++++++++++++++++++++++++++++++++");
		System.out.println(SearchList);
		System.out.println("++++++++++++++++++++++++++++++++++++++");

	}

	// ��������
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public void readBoard(@RequestParam("bno") int bno, @ModelAttribute("cri") CriteriaStudy cri, Model model,
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		UserVO sUser = (UserVO)session.getAttribute("login");
		
		if(sUser == null) {
		model.addAttribute(service.read(bno));

		model.addAttribute("list", replyService.listReply(bno));  //��� ���� ������

		model.addAttribute("aplist", apservice.list(bno));
		
		} else {
		
		String email = sUser.getEmail();
		
	
		
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("writer", email);
		map.put("bsbno", bno);
		

		
		bookservice.bolist(map);
	
		//�ϸ�ũ �ѱ�ٿ� 
		model.addAttribute("bolist",bookservice.bolist(map));
		
		model.addAttribute("aplist", apservice.list(bno));
		
		model.addAttribute(service.read(bno));
		
		Map<String, Object> apmap = new HashMap<>();
		
		apmap.put("writer", email);
		apmap.put("bsBno", bno);
		
		model.addAttribute("ap", apservice.apList(apmap));
		}
	}

	// �������� ����
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, CriteriaStudy cri, RedirectAttributes rttr) throws Exception {

		service.remove(bno);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/study/listAll";
	}

	// ���ϰ�������
	@RequestMapping("/getFile/{bsBno}")
	@ResponseBody
	public List<String> getFile(@PathVariable("bsBno") Integer bsBno) throws Exception {
		return service.getFile(bsBno);
	}
	
	//������Ʈ�� ���� ���ϰ�������
	@RequestMapping("getFileup/{bsBno}")
	@ResponseBody
	public List<String> getFileup(@PathVariable("bsBno") Integer bsBno) throws Exception {
		return service.getFileup(bsBno);
	}

	// JSON smallī�װ�
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



	// ����������
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
