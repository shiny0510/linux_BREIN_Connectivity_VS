package DTIManager;

import java.util.ArrayList;

import T1FileManage.T1FM;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dbconn.DBConnect;


public class dtilistDaoImpl implements dtilistDao {
	private DBConnect db;

	public dtilistDaoImpl() {
		db = DBConnect.getInstance();
	}

	@Override
	public void insert(dtilist d) {
		Connection conn = db.getConnection();
		String sql = "insert into dtilist(id,dtiname,dtipath,pnum) values(?,lower(?),?,?)";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, d.getId());
			pstmt.setString(2, d.getDtiname());
			pstmt.setString(3, d.getDtipath());
			pstmt.setInt(4, d.getPnum());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {// ���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
			db.disConn();
		}
	}

	@Override
	public dtilist select(String id) {
		// TODO Auto-generated method stub
		ResultSet rs;
		Connection conn = db.getConnection();
		String sql = "select dnum,id,dtiname,dtipath,pnum from dtilist where id= ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dtilist t = new dtilist(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6));
				return t;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {// ���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
			db.disConn();
		}
		return null;
	}

	@Override
	public String selectFname(String dtiname) {
		// TODO Auto-generated method stub
		ResultSet rs;
		Connection conn = db.getConnection();
		String sql = "select dnum,id,dtiname,dtipath,pnum from dtilist where dtiname=? ";
		String id = "";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dtiname);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				id = rs.getString(2);
				return id;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {// ���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
			db.disConn();
		}
		return null;
	}

	@Override
	public void update(dtilist d) {
		// TODO Auto-generated method stub
				Connection conn = db.getConnection();
				String sql = "update dtilist set dtiname=? where id=?";
				PreparedStatement pstmt;
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, d.getDtiname());
					pstmt.setString(2, d.getId());
					pstmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {// ���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
					db.disConn();
				}
	}

	@Override
	public void delete(int dnum) {
		// TODO Auto-generated method stub
				Connection conn = db.getConnection();
				String sql = "delete dtilist where dnum=?";
				PreparedStatement pstmt;
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, dnum);
					pstmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {// ���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
					db.disConn();
				}
	}

	@Override
	public ArrayList<dtilist> selectByDate(String dtidate) {
		// TODO Auto-generated method stub
				ResultSet rs;
				ArrayList<dtilist> list = new ArrayList<dtilist>();
				Connection conn = db.getConnection();
				String sql = "select dnum,id,dtiname,dtipath,pnum from dtilist where dtidate = ?";
				PreparedStatement pstmt;
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dtidate);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						list.add(new dtilist(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6)));
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
	public ArrayList<dtilist> selectBydtiname(String dtiname) {
		// TODO Auto-generated method stub
				ResultSet rs;
				ArrayList<dtilist> list = new ArrayList<dtilist>();
				Connection conn = db.getConnection();
				String sql = "select dnum,id,dtiname,dtipath,pnum from dtilist where dtiname = ?";
				PreparedStatement pstmt;
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dtiname);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						list.add(new dtilist(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6)));
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
	public ArrayList<dtilist> selectById(String id) {
		// TODO Auto-generated method stub
		ResultSet rs;
		ArrayList<dtilist> list = new ArrayList<dtilist>();
		Connection conn = db.getConnection();
		String sql = "select dnum,id,dtiname,dtipath,pnum from dtilist where id = ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new dtilist(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6)));
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
	public ArrayList<dtilist> selectByIdandpnum(String id, int pnum) { 
			// TODO Auto-generated method stub
			ResultSet rs;
			ArrayList<dtilist> list = new ArrayList<dtilist>();
			Connection conn = db.getConnection();
			String sql = "select dnum,id,dtiname,dtipath,pnum from dtilist where id = ? and pnum=?";
			PreparedStatement pstmt;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, pnum);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					list.add(new dtilist(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6)));
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
	public String selectBydtinum(int dnum) {
		// TODO Auto-generated method stub
				ResultSet rs;
				Connection conn = db.getConnection();
				String dtiname = null;
				String sql = "select dtiname from dtilist where dnum = ?";
				PreparedStatement pstmt;
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, dnum);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						dtiname = rs.getString(1);
						return dtiname;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					db.disConn();
				}

				return null;
	}

	@Override
	public ArrayList<dtilist> selectAll() {
		// TODO Auto-generated method stub
				ResultSet rs;
				Connection conn = db.getConnection();
				ArrayList<dtilist> list = new ArrayList<dtilist>();
				String sql = "select dnum,id,dtiname,dtipath,pnum from dtilist";
				PreparedStatement pstmt;
				try {
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						list.add(new dtilist(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6)));
					}

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {// ���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
					db.disConn();
				}
				return list;
	}

}
