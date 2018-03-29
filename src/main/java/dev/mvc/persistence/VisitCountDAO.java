package dev.mvc.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * Visit 테이블의 DAO<br>
 * 방문자 관련 처리를 한다.
 */
public class VisitCountDAO {
    private static VisitCountDAO instance;
    
    // 싱글톤 패턴
    private VisitCountDAO(){}
    public static VisitCountDAO getInstance(){
        if(instance==null)
            instance=new VisitCountDAO();
        return instance;
    }
    
    /**
     * 총방문자수를 증가시킨다.
     */
    public void setTotalCount() throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            
        	String jdbcDriver="jdbc:log4jdbc:mysql://iluvstudy.cbcc3lju935r.ap-northeast-2.rds.amazonaws.com:3306/ILuvStudy?useSSL=false&amp;serverTimezone=UTC&amp;characterEncoding=utf-8";
			String dbUser="ILuvStudy";
			String dbPass="bitcamp504";
        	
            // 쿼리생성
            // 총 방문자수를 증가시키기 위해 테이블에 현재 날짜 값을 추가시킨다.
            StringBuffer sql = new StringBuffer();
            sql.append("INSERT INTO visit (VDATE) VALUES (date_format(now(),'%Y-%m-%d'))");
            
            // 커넥션을 가져온다.
            conn = DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
                        
            // 자동 커밋을 false로 한다.
            conn.setAutoCommit(false);
            
            pstmt = conn.prepareStatement(sql.toString());
            // 쿼리 실행
            pstmt.executeUpdate();
            // 완료시 커밋
            conn.commit(); 
            
        } catch (SQLException sqle) {
            // 오류시 롤백
            conn.rollback(); 
            throw new RuntimeException(sqle.getMessage());
        } finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end setTotalCount()
  
}

