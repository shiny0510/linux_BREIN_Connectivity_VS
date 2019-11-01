package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
 
 
 
public class MariaDB {
 
    public static void main(String[] args) {
 
        new MariadbInfo();
 
    }
}
 
class MariadbInfo {
    private Connection connection;
    private Statement statement;
    private ResultSet resultSet;
 
    MariadbInfo() {
 
        try {
 
            //JDBC 드라이버의 클래스 이름을 넣어준다 .
            Class.forName("org.mariadb.jdbc.Driver");
            System.out.println("로딩성공");
        } catch (Exception e) {
            System.out.println("로딩실패");
            return;
        }
 
        try {
 
            //getConnection(데이터베이스URL, DB 아이디, DB패스워드);
            connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/osh", "hr", "hr");
            System.out.println("DB 연결 성공");
        } catch (Exception e) {
            System.out.println("DB 연결 실패");
        }
 
        try {
 
           //Statement객체를 만드는 메소드
           statement = connection.createStatement();
 
 
 
           //executeQuery() 매개변수에 SQL문을 넣어서 실행
           resultSet = statement.executeQuery("select * from member where id= osh");
           
           
    
 
        //실행 결과의 다음 행 위치로 이동하는 메소드
        while (resultSet.next()) {
            String name = resultSet.getString("name");
            System.out.println(name);
        }
    
    
        String sql = "select count(*) as count from member";
        resultSet = statement.executeQuery(sql);
        resultSet.next();
        String count = resultSet.getString("count");
        System.out.println(Integer.parseInt(count));
      
      } catch (Exception e) {
       // TODO: handle exception
      }finally{
          try{
             if(connection!=null)connection.close();
             if(statement!=null)statement.close();
             if(resultSet!=null)resultSet.close();
          }catch (Exception e) {
        // TODO: handle exception
          }
    
      }
   }
}
