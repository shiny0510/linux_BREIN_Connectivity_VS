package dbconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
public class DBConnect {
	
	private static DBConnect db = new DBConnect();
    String driver = "org.mariadb.jdbc.Driver";
    private Connection conn = null;
    PreparedStatement pstmt;
    ResultSet rs;
 
    private DBConnect() {
		// TODO Auto-generated constructor stub		
	}
    
	public static DBConnect getInstance() {
		return db; 
	}
	
    
    public Connection getConnection() {
         try {
            Class.forName(driver);
            conn = DriverManager.getConnection(
                    "jdbc:mariadb://localhost:3306/breinroi",
                    "osh",
                    "tmdghks");
            
            if( conn != null ) {
                System.out.println("DB 접속 성공");
            }
            
        } catch (ClassNotFoundException e) { 
            System.out.println("드라이버 로드 실패");
        } catch (SQLException e) {
            System.out.println("DB 접속 실패");
            e.printStackTrace();
        }
         return conn;
    }
    
    public void disConn() {
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
