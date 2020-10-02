package T1FileManage;

import java.util.ArrayList;

public class T1FMServiceImpl implements T1FMService {
	private T1FMDao dao;
	
	public T1FMServiceImpl(T1FMDao dao) {
		this.dao = dao;
	}
	
	
	@Override
	public void addT1File(T1FM t) {
		// TODO Auto-generated method stub
		dao.insert(t);
	}

	@Override
	public void editT1File(T1FM t) {
		// TODO Auto-generated method stub
		dao.update(t);
	}

	@Override
	public void delT1File(int num) {
		// TODO Auto-generated method stub
		dao.delete(num);
	}

	@Override
	public ArrayList<T1FM> getByT1Date(String t1date) {
		// TODO Auto-generated method stub
		return dao.selectByDate(t1date);
	}

	@Override
	public ArrayList<T1FM> getByt1name(String t1name) {
		// TODO Auto-generated method stub
		return dao.selectById(t1name);
	}

	@Override
	public ArrayList<T1FM> getById(String id, int pnum) {
		// TODO Auto-generated method stub
		return dao.selectByIdandpnum(id,pnum);
	}

	@Override
	public String getByt1num(int t1num) {
		// TODO Auto-generated method stub
		return dao.selectByFnum(t1num);
	}

	@Override
	public ArrayList<T1FM> getAll() {
		// TODO Auto-generated method stub
		return dao.selectAll() ;
	}

	@Override
	public T1FM getT1File(int t1num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int makeT1FileNum() {
		// TODO Auto-generated method stub
		return 0;
	}

}
