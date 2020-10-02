package FileManage;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dbconn.DBConnect;

public class FMDaoImpl implements FMDao {
	private DBConnect db;

	public FMDaoImpl() {
		db = DBConnect.getInstance();
	}

	@Override
	public void insert(FileManager f) {
		Connection conn = db.getConnection();
		String sql = "insert into FileManager(id,fname,fpath,pnum) values(?,?,?,?)";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getId());
			pstmt.setString(2, f.getFname());
			pstmt.setString(3, f.getFpath());
			pstmt.setInt(3, f.getPnum());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {//���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
			db.disConn();
		}
	}

	@Override
	public FileManager select(String id) {
		// TODO Auto-generated method stub
		ResultSet rs;
		Connection conn = db.getConnection();
		String sql = "select fnum,id,fname,fpath,fdate,pnum from FileManager where id= ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); 
			rs = pstmt.executeQuery();
			if (rs.next()) {
				FileManager f = new FileManager(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6));
				return f;
				
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
	public String selectFname(String fname) {
		// TODO Auto-generated method stub
		ResultSet rs;
		Connection conn = db.getConnection();
		String sql = "select fnum,id,fname,fpath,fdate,pnum from FileManager where fname=? ";
		String id="";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fname);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				 id=rs.getString(2);
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
	public void update(FileManager f) {
		// TODO Auto-generated method stub
		Connection conn = db.getConnection();
		String sql = "update FileManager set fname=? where id=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, f.getFname());
			pstmt.setString(2, f.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {//���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
			db.disConn();
		}
	}

	@Override
	public void delete(int fnum) {
		// TODO Auto-generated method stub
		Connection conn = db.getConnection();
		String sql = "delete FileManager where fnum=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, fnum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {//���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
			db.disConn();
		}
	}

	@Override
	public ArrayList<FileManager> selectAll() {
		// TODO Auto-generated method stub
		ResultSet rs;
		Connection conn = db.getConnection();
		ArrayList<FileManager> list=new ArrayList<FileManager>();
		String sql = "select fnum,id,fname,fpath,fdate,pnum from FileManager";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				 list.add(new FileManager(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),rs.getInt(6)));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {//���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
			db.disConn();
		}
		return list;
	}

	@Override
	public ArrayList<FileManager> selectByDate(String fdate) {
		// TODO Auto-generated method stub
		ResultSet rs;
		ArrayList<FileManager> list = new ArrayList<FileManager>();
		Connection conn = db.getConnection();
		String sql = "select fnum,id,fname,fpath,fdate,pnum from FileManager where fdate = ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fdate);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new FileManager(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4), rs.getString(5),rs.getInt(6)));
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
	public ArrayList<FileManager> selectByFname(String fname) {
		// TODO Auto-generated method stub
		ResultSet rs;
		ArrayList<FileManager> list = new ArrayList<FileManager>();
		Connection conn = db.getConnection();
		String sql = "select fnum,id,fname,fpath,fdate,pnum from FileManager where fname = ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fname);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new FileManager(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4), rs.getString(5),rs.getInt(6)));
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
	public ArrayList<FileManager> selectById(String id, int pnum) {
		// TODO Auto-generated method stub
		ResultSet rs;
		ArrayList<FileManager> list = new ArrayList<FileManager>();
		Connection conn = db.getConnection();
		String sql = "select fnum,id,fname,fpath,fdate,pnum from FileManager where id = ? and pname =?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pnum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new FileManager(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4), rs.getString(5),rs.getInt(6)));
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
	public String selectByFnum(int fnum) {
		// TODO Auto-generated method stub
				ResultSet rs;
				
				Connection conn = db.getConnection();
				String fname = null;
				String sql = "select fname from FileManager where fnum = ?";
				PreparedStatement pstmt;
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, fnum);
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
