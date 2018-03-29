package dev.mvc.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * Visit ���̺��� DAO<br>
 * �湮�� ���� ó���� �Ѵ�.
 */
public class VisitCountDAO {
    private static VisitCountDAO instance;
    
    // �̱��� ����
    private VisitCountDAO(){}
    public static VisitCountDAO getInstance(){
        if(instance==null)
            instance=new VisitCountDAO();
        return instance;
    }
    
    /**
     * �ѹ湮�ڼ��� ������Ų��.
     */
    public void setTotalCount() throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            
        	String jdbcDriver="jdbc:log4jdbc:mysql://iluvstudy.cbcc3lju935r.ap-northeast-2.rds.amazonaws.com:3306/ILuvStudy?useSSL=false&amp;serverTimezone=UTC&amp;characterEncoding=utf-8";
			String dbUser="ILuvStudy";
			String dbPass="bitcamp504";
        	
            // ��������
            // �� �湮�ڼ��� ������Ű�� ���� ���̺� ���� ��¥ ���� �߰���Ų��.
            StringBuffer sql = new StringBuffer();
            sql.append("INSERT INTO visit (VDATE) VALUES (date_format(now(),'%Y-%m-%d'))");
            
            // Ŀ�ؼ��� �����´�.
            conn = DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
                        
            // �ڵ� Ŀ���� false�� �Ѵ�.
            conn.setAutoCommit(false);
            
            pstmt = conn.prepareStatement(sql.toString());
            // ���� ����
            pstmt.executeUpdate();
            // �Ϸ�� Ŀ��
            conn.commit(); 
            
        } catch (SQLException sqle) {
            // ������ �ѹ�
            conn.rollback(); 
            throw new RuntimeException(sqle.getMessage());
        } finally {
            // Connection, PreparedStatement�� �ݴ´�.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end setTotalCount()
  
}

