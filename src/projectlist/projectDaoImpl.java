package projectlist;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dbconn.DBConnect;

public class projectDaoImpl implements projectlistDao {
	private DBConnect db;

	public projectDaoImpl() {
		db = DBConnect.getInstance();
	}

	@Override
	public void insert(projectlist p) {
		Connection conn = db.getConnection();
		String sql = "insert into projectlist(id,pname) values(?,?)";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getId());
			pstmt.setString(2, p.getPname());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {// 현재 메서드가 종료하기 전에 꼭 실행해야하는 코드 작성
			db.disConn();
		}
	}

	@Override
	public projectlist select(String id) {
		// TODO Auto-generated method stub
		ResultSet rs;
		Connection conn = db.getConnection();
		String sql = "select pnum,id,pname,pdate from projectlist where id= ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				projectlist f = new projectlist(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
				return f;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {// 현재 메서드가 종료하기 전에 꼭 실행해야하는 코드 작성
			db.disConn();
		}
		return null;
	}

	@Override
	public String selectproject(String id) {
		// TODO Auto-generated method stub
		ResultSet rs;
		Connection conn = db.getConnection();
		String sql = "select fnum,id,fname,fpath,fdate from projectlist where id=? ";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				id = rs.getString(2);
				return id;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {// 현재 메서드가 종료하기 전에 꼭 실행해야하는 코드 작성
			db.disConn();
		}
		return null;
	}

	@Override
	public void update(projectlist p) {
		// TODO Auto-generated method stub
		Connection conn = db.getConnection();
		String sql = "update projectlist set pname=? where pname=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getPname());
			pstmt.setString(2, p.getPname());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {// 현재 메서드가 종료하기 전에 꼭 실행해야하는 코드 작성
			db.disConn();
		}
	}

	@Override
	public void delete(int pnum) {
		// TODO Auto-generated method stub
		Connection conn = db.getConnection();
		String sql = "delete projectlist where pnum=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {// 현재 메서드가 종료하기 전에 꼭 실행해야하는 코드 작성
			db.disConn();
		}
	}
	@Override
	public ArrayList<projectlist> selectByDate(String pdate) {
		// TODO Auto-generated method stub
		ResultSet rs;
		ArrayList<projectlist> list = new ArrayList<projectlist>();
		Connection conn = db.getConnection();
		String sql = "select pnum,id,pname,pdate from projectlist where pdate = ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pdate);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new projectlist(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4)));
					}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.disConn();
		}
		return list;
	}

	@Override
	public ArrayList<projectlist> selectByPname(String pname) {
		// TODO Auto-generated method stub
		ResultSet rs;
		ArrayList<projectlist> list = new ArrayList<projectlist>();
		Connection conn = db.getConnection();
		String sql = "select pnum,id,pname,pdate from projectlist where pname = ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new projectlist(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4)));
					}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.disConn();
		}
		return list;
	}

	@Override
	public ArrayList<projectlist> selectById(String id) {
		// TODO Auto-generated method stub
		ResultSet rs;
		ArrayList<projectlist> list = new ArrayList<projectlist>();
		Connection conn = db.getConnection();
		String sql = "select pnum,id,pname,pdate from projectlist where id = ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new projectlist(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4)));
					}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.disConn();
		}
		return list;
	}
	
	@Override
	public String selectByPnum(int pnum) {
		// TODO Auto-generated method stub
				ResultSet rs;
				
				Connection conn = db.getConnection();
				String fname = null;
				String sql = "select pname from projectlist where pnum = ?";
				PreparedStatement pstmt;
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, pnum);
					rs = pstmt.executeQuery();
					while (rs.next()) {
					fname =  rs.getString(1);
					return fname;
							}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					db.disConn();
				}
				
				return null;
	}
}
