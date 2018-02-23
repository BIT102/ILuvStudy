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
	public void read(@RequestParam("bno") int bno, Model model)
		throws Exception{
		model.addAttribute(service.read(bno)); //��ȸ�� ��� �Խù��� JSP�� ����(model��ü ���)
	}
	
	//��������
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("bno")int bno, RedirectAttributes rttr)throws Exception{
		service.remove(bno);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/qna/qnaList";
	}
}
