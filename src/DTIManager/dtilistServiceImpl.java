package DTIManager;

import java.util.ArrayList;

public class dtilistServiceImpl implements dtilistService {
	private dtilistDao dao;
	
	public dtilistServiceImpl(dtilistDao dao) {
		this.dao = dao;
	}
	
	@Override
	public void addDTIFile(dtilist d) {
		// TODO Auto-generated method stub
		dao.insert(d);
	}

	@Override
	public void editDTIFile(dtilist d) {
		// TODO Auto-generated method stub
		dao.update(d);
	}

	@Override
	public void delDTIFile(int num) {
		// TODO Auto-generated method stub
		dao.delete(num);
	}

	@Override
	public ArrayList<dtilist> getByDTIDate(String dtidate) {
		// TODO Auto-generated method stub
		return dao.selectByDate(dtidate);
	}

	@Override
	public ArrayList<dtilist> getByDTIname(String dtiname) {
		// TODO Auto-generated method stub
		return dao.selectBydtiname(dtiname) ;
	}

	@Override
	public ArrayList<dtilist> getById(String id, int pnum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getByDTInum(int dnum) {
		// TODO Auto-generated method stub
		return dao.selectBydtinum(dnum);
	}

	@Override
	public ArrayList<dtilist> getAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	@Override
	public dtilist getDTIFile(int dnum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int makeDTIFileNum() {
		// TODO Auto-generated method stub
		return 0;
	}

}
