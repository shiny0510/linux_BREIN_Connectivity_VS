package Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dbconn.DBConnect;


public class MemberDaoImpl implements MemberDao {
	
	private DBConnect db;

	public MemberDaoImpl() {
		db = DBConnect.getInstance();
	}
	@Override
	public void insert(member m) {
		Connection conn = db.getConnection();
		String sql = "insert into movie_member values(?,?,?,?,?)";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPwd());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getTel());
			pstmt.setInt(5, m.getMtype());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {//���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
			db.disConn();
		}
	}

	@Override
	public member select(String id) {
		// TODO Auto-generated method stub
				ResultSet rs;
				Connection conn = db.getConnection();
				String sql = "select id,pwd,name,tel,mtype from member where id= ?";
				PreparedStatement pstmt;
			
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id); 
					rs = pstmt.executeQuery();
					if (rs.next()) {
						member a = new member(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getInt(5));
						
						return a;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {//���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
					db.disConn();
				}
				return null;
	}

	@Override
	public String selectId(String name, String tel) {
		// TODO Auto-generated method stub
				ResultSet rs;
				Connection conn = db.getConnection();
				String sql = "select * from member where name=? and tel=?";
				String id="";
				PreparedStatement pstmt;
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, name);
					pstmt.setString(2, tel);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						 id=rs.getString(1);
						 return id;
						 
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {//���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
					db.disConn();
				}
				return null;
	}

	@Override
	public void update(member m) {
		// TODO Auto-generated method stub
		Connection conn = db.getConnection();
		String sql = "update member set pwd=?, tel=? where id=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, m.getPwd());
			pstmt.setString(2, m.getTel());
			pstmt.setString(3, m.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {//���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
			db.disConn();
		}
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
				Connection conn = db.getConnection();
				String sql = "delete member where id=?";
				PreparedStatement pstmt;
				try {
					pstmt = conn.prepareStatement(sql);		
					pstmt.setString(1, id);
					pstmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {//���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
					db.disConn();
				}
	}

	@Override
	public ArrayList<member> selectAll(String area) {
		// TODO Auto-generated method stub
				ResultSet rs;
				Connection conn = db.getConnection();
				ArrayList<member> list=new ArrayList<member>();
				String sql = "select * from member where area=?";
				PreparedStatement pstmt;
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, area);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						 list.add(new member(rs.getString(1), rs.getString(2),	rs.getString(3), rs.getString(4),rs.getInt(5)));
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {//���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
					db.disConn();
				}
				return list;
	}

}
