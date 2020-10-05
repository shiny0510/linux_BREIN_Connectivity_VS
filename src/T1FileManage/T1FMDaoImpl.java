package T1FileManage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dbconn.DBConnect;

public class T1FMDaoImpl implements T1FMDao {
	private DBConnect db;

	public T1FMDaoImpl() {
		db = DBConnect.getInstance();
	}

	@Override
	public void insert(T1FM t) {
		Connection conn = db.getConnection();
		String sql = "insert into T1FileManager(id,t1name,t1path,pnum) values(?,substr(?,1,4),?,?)";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getId());
			pstmt.setString(2, t.getT1name());
			pstmt.setString(3, t.getT1path());
			pstmt.setInt(4, t.getPnum());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {// ���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
			db.disConn();
		}
	}

	@Override
	public T1FM select(String id) {
		// TODO Auto-generated method stub
		ResultSet rs;
		Connection conn = db.getConnection();
		String sql = "select t1num,id,t1name,t1path,t1date,pnum from T1FileManager where id= ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				T1FM t = new T1FM(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6));
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
	public String selectFname(String t1name) {
		// TODO Auto-generated method stub
		ResultSet rs;
		Connection conn = db.getConnection();
		String sql = "select t1num,id,t1name,t1path,t1date from T1FileManager where t1name=? ";
		String id = "";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t1name);
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
	public void update(T1FM t) {
		// TODO Auto-generated method stub
		Connection conn = db.getConnection();
		String sql = "update T1FileManager set t1name=? where id=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getT1name());
			pstmt.setString(2, t.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {// ���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
			db.disConn();
		}
	}

	@Override
	public void delete(int t1num) {
		// TODO Auto-generated method stub
		Connection conn = db.getConnection();
		String sql = "delete T1FileManager where t1num=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, t1num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {// ���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
			db.disConn();
		}
	}

	@Override
	public ArrayList<T1FM> selectByDate(String t1date) {
		// TODO Auto-generated method stub
		ResultSet rs;
		ArrayList<T1FM> list = new ArrayList<T1FM>();
		Connection conn = db.getConnection();
		String sql = "select t1num,id,t1name,t1path,t1date,pnum from T1FileManager where t1date = ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t1date);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new T1FM(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6)));
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
	public ArrayList<T1FM> selectByFname(String t1name) {
		// TODO Auto-generated method stub
		ResultSet rs;
		ArrayList<T1FM> list = new ArrayList<T1FM>();
		Connection conn = db.getConnection();
		String sql = "select t1num,id,t1name,t1path,t1date,pnum from T1FileManager where t1name = ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t1name);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new T1FM(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6)));
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
	public ArrayList<T1FM> selectByIdandpnum(String id, int pnum) {
		// TODO Auto-generated method stub
		ResultSet rs;
		ArrayList<T1FM> list = new ArrayList<T1FM>();
		Connection conn = db.getConnection();
		String sql = "select t1num,id,t1name,t1path,t1date,pnum from T1FileManager where id = ? and pnum=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pnum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new T1FM(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6)));
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
	public ArrayList<T1FM> selectById(String id) {
		// TODO Auto-generated method stub
		ResultSet rs;
		ArrayList<T1FM> list = new ArrayList<T1FM>();
		Connection conn = db.getConnection();
		String sql = "select t1num,id,t1name,t1path,t1date,pnum from T1FileManager where id = ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new T1FM(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6)));
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
	public String selectByFnum(int t1num) {
		// TODO Auto-generated method stub
		ResultSet rs;
		Connection conn = db.getConnection();
		String t1name = null;
		String sql = "select t1name from T1FileManager where t1num = ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, t1num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				t1name = rs.getString(1);
				return t1name;
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
	public ArrayList<T1FM> selectAll() {
		// TODO Auto-generated method stub
		ResultSet rs;
		Connection conn = db.getConnection();
		ArrayList<T1FM> list = new ArrayList<T1FM>();
		String sql = "select t1num,id,t1name,t1path,t1date,pnum from T1FileManager";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new T1FM(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6)));
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
