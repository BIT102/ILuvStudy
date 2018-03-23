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
public class VisitCountDAO 
{
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
    public void setTotalCount() throws SQLException
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            
        	String jdbcDriver="jdbc:log4jdbc:mysql://192.168.0.12:3306/jjstudy?useSSL=false&amp;serverTimezone=UTC";
			String dbUser="root";
			String dbPass="1234";
        	
            // ��������
            // �� �湮�ڼ��� ������Ű�� ���� ���̺� ���� ��¥ ���� �߰���Ų��.
            StringBuffer sql = new StringBuffer();
            sql.append("INSERT INTO VISIT (VDATE) VALUES (date_format(now(),'%Y-%m-%d'))");
            
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
    
    /**
     * �� �湮�ڼ��� �����´�.
     * @return totalCount : �� �湮�� ��
     */
/*    public int getTotalCount()
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int totalCount = 0;
        
        try {
            
        	String jdbcDriver="jdbc:log4jdbc:mysql://192.168.0.12:3306/jjstudy?useSSL=false&amp;serverTimezone=UTC";
			String dbUser="root";
			String dbPass="1234";
        	
            // ���̺��� ������ ���� �����´�.
            // ������ �� = �� �湮�� ��
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT COUNT(*) AS TotalCnt FROM VISIT");
            
            conn = DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            
            // �湮�� ���� ������ ��´�.
            if (rs.next()) 
                totalCount = rs.getInt("TotalCnt");
            
            return totalCount;
            
        } catch (Exception sqle) {
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
    } // end getTotalCount()
    
    *//**
     * ���� �湮�� ���� �����´�.
     * @return todayCount : ���� �湮��
     *//*
    public int getTodayCount()
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int todayCount = 0;
        
        try {
        	
        	String jdbcDriver="jdbc:log4jdbc:mysql://192.168.0.12:3306/jjstudy?useSSL=false&amp;serverTimezone=UTC";
			String dbUser="root";
			String dbPass="1234";
            
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT COUNT(*) AS TodayCnt FROM VISIT");
            sql.append(" WHERE vdate = date_format(now(),'%Y-%m-%d')");
            
            conn = DriverManager.getConnection(jdbcDriver,dbUser, dbPass);
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            
            // �湮�� ���� ������ ��´�.
            if (rs.next()) 
                todayCount = rs.getInt("TodayCnt");
            
            return todayCount;
            
        } catch (Exception sqle) {
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
    }// end getTodayCount()
*/
}

