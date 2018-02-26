package dev.mvc.study;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import dev.mvc.study.domain.Criteria;
import dev.mvc.study.domain.PageMaker;
import dev.mvc.study.domain.QnaVO;
import dev.mvc.study.service.QnaService;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private QnaService service; //QnaService��ü�� ���Թ޴´�
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET) //get
	public void registerGET(QnaVO board, Model model)throws Exception{
		
		logger.info("register get...........");
	}
	
	
	@RequestMapping(value = "/qna", method = RequestMethod.POST) //post
	public String registPOST(QnaVO board, RedirectAttributes rttr)throws Exception{
		logger.info("regist post............");
		logger.info(board.toString());
		
		service.regist(board);
		
//		model.addAttribute("result", "success"); //modelŬ������ MAP�� �����ϰ� Ű,�� ���� �����͸� �����ϴ� ������ �մϴ�.
		rttr.addFlashAttribute("msg", "success");//model��� addFlashAttribute()��� ������� �����̷�Ʈ ������ �� ���� ���Ǵ� �����͸� ����
												//msg�� �߰��� �����ʹ� ���������� ���۵Ǳ�� ������ URI�󿡴� ������ �ʴ� ������ �������� ���·� ���޵˴ϴ�.
		
//		return "/qna/success";   //   /WEB-INF/views/board/success.jsp
		return "redirect:/qna/qnaList";   //����ڰ� ���ΰ�ħ�� �̿��ϴ°��� ����
	}
	
	//��ü��ȸ ����(qnaList.jsp�����)
	@RequestMapping(value="qnaList", method = RequestMethod.GET)
	public void qnaList(Model model)throws Exception{    		//MVC�� ModelŸ���� ��ü�� �Ķ���ͷ� �޴´�.
		
		logger.info("show all List...............");
		model.addAttribute("list", service.listAll());			//Model�� �̿��ؼ� ��� �Խù��� JSP�� �����ϴ��۾�
	};
	
	//��ȸ ����(bno�� @RequestParam���� ���޹޾Ƽ� ó���� �� �ְ�)
	@RequestMapping(value="/qnaDetail", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno,
			@ModelAttribute("cri") Criteria cri,
			Model model)throws Exception{
		
		model.addAttribute(service.read(bno)); //��ȸ�� ��� �Խù��� JSP�� ����(model��ü ���)
	}
	
	//��������  �����޽���...... Failed to convert value of type [java.lang.String] to required type [int]; nested exception is java.lang.NumberFormatException: For input string: ""
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("bno")int bno, 
			Criteria cri,
			RedirectAttributes rttr)throws Exception{
		logger.info("remove post...............");
		
		service.remove(bno);
		
		rttr.addAttribute("page", cri.getPage()); //������ ����������� �̵�
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/qna/listPage";
	}
	
	//���� ����
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int bno, Model model)throws Exception{
//		System.out.println("===================");
//		System.out.println(bno);
//		System.out.println(model);
//		System.out.println("===================");
		model.addAttribute(service.read(bno));
	}
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(QnaVO board, RedirectAttributes rttr)throws Exception{
		
		logger.info("modify post...............");
		
		service.modify(board);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/qna/listPage";
	}
	
	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception{
		logger.info("show list Page with Criteria................");
		
		model.addAttribute("list", service.listCriteria(cri));
	}
	
	//Criteria cri �Ķ���� Model��ü �̿��ؼ� PageMaker����
	@RequestMapping(value="/listPage", method = RequestMethod.GET)
	public void listPage(Criteria cri, Model model)throws Exception{
		
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(35);
		
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
}
