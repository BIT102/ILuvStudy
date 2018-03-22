package dev.mvc.util;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dev.mvc.persistence.VisitCountDAO;


//새션이 생성될때 실행
public class VisitCounter implements HttpSessionListener{
	
	private static final Logger logger = LoggerFactory.getLogger(VisitCounter.class);
	
    @Override
    public void sessionCreated(HttpSessionEvent arg0){
        logger.info("sessionCreated.......");
    	
        VisitCountDAO visitCountDAO = new VisitCountDAO();
        
    	//방문자 수 카운트
		try {
			visitCountDAO.setTotalCount();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    }
    @Override
    public void sessionDestroyed(HttpSessionEvent arg0){
    	
    }
}