package dev.mvc.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dev.mvc.commons.Criteria;
import dev.mvc.domain.NoticeVO;
import dev.mvc.persistance.NoticeDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class NoticeDAOTest {
	
	@Inject
	private NoticeDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(NoticeDAOTest.class);
	
	
	@Test
	public void testReadNotice() throws Exception {
		
		logger.info(dao.readNotice(3).toString());
	}
	
	@Test
	public void testList() throws Exception {
		
		int page = 3;
		
		List<NoticeVO> list = dao.listPage(page);
		
		for(NoticeVO noticeVO : list) {
			
			logger.info(noticeVO.getBno() + ":" + noticeVO.getTitle()
			);
		}
	}
	
	@Test
	public void testCriteria() throws Exception {
		
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(20);
		
		List<NoticeVO> list = dao.listCriteria(cri);
		
		for(NoticeVO noticeVO : list) {
			
			logger.info(noticeVO.getBno() + ":" + noticeVO.getTitle()
			);
		}
	}

}
