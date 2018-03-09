package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.ReplyStudyVO;

public interface ReplyStudyService {

	//´ñ±Û ºÒ·¯¿À±â
	public List<ReplyStudyVO> listReply(Integer bsBno) throws Exception;
	
	//´ñ±Û µî·Ï
	public void addReply(ReplyStudyVO vo) throws Exception;
	
	//´ñ±Û ¼öÁ¤
	public void modifyReply(ReplyStudyVO vo) throws Exception;
	
	//´ñ±Û »èÁ¦
	public void removeReply(Integer rno) throws Exception;
	
	//´ñ±Û ÆäÀÌÂ¡
	public List<ReplyStudyVO> listReplyPage(Integer bsBno, Criteria cri) throws Exception;

	//´ñ±Û ¼ö
	public int count(Integer bsBno) throws Exception;
} 
