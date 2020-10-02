package projectlist;

import java.util.ArrayList;

public class projectlistServiceImpl implements projectlistService {
	private projectlistDao dao;
	
	public projectlistServiceImpl(projectlistDao dao) {
		this.dao = dao;
	}
	
	@Override
	public void addFile(projectlist p) {
		// TODO Auto-generated method stub
		dao.insert(p);
	}

	@Override
	public void editprojectlist(projectlist p) {
		// TODO Auto-generated method stub
		dao.update(p);
	}

	@Override
	public void delprojectlist(int pnum) {
		// TODO Auto-generated method stub
		dao.delete(pnum);
	}

	@Override
	public ArrayList<projectlist> getByDate(String pdate) {
		// TODO Auto-generated method stub
		return dao.selectByDate(pdate);
	}

	@Override
	public ArrayList<projectlist> getByFname(String pname) {
		// TODO Auto-generated method stub
		return dao.selectByDate(pname);
	}

	@Override
	public ArrayList<projectlist> getById(String id) {
		// TODO Auto-generated method stub
		return dao.selectById(id);
	}

	@Override
	public String getBynum(int pnum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<projectlist> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public projectlist getFile(int pnum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int makeFileNum() {
		// TODO Auto-generated method stub
		return 0;
	}

}
