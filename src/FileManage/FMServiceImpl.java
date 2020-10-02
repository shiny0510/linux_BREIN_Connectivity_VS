package FileManage;

import java.util.ArrayList;

public class FMServiceImpl implements FMService {
	private FMDao dao;
	
	public FMServiceImpl(FMDao dao) {
		this.dao = dao;
	}
	@Override
	public void addFile(FileManager f) {
		// TODO Auto-generated method stub
		dao.insert(f);
	}

	@Override
	public void editMovie(FileManager f) {
		// TODO Auto-generated method stub
		dao.update(f);
	}

	@Override
	public void delMovie(int num) {
		// TODO Auto-generated method stub
		dao.delete(num);
	}

	@Override
	public ArrayList<FileManager> getByDate(String fdate) {
		// TODO Auto-generated method stub
		return dao.selectByDate(fdate);
	}

	@Override
	public ArrayList<FileManager> getByFname(String fname) {
		// TODO Auto-generated method stub
		return dao.selectByFname(fname) ;
	}

	@Override
	public ArrayList<FileManager> getById(String id, int pnum) {
		// TODO Auto-generated method stub
		return dao.selectById(id,pnum);
	}
	
	@Override
	public String getBynum(int fnum) {
		// TODO Auto-generated method stub
		return dao.selectByFnum(fnum);
	}

	@Override
	public ArrayList<FileManager> getAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	@Override
	public FileManager getFile(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int makeFileNum() {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
