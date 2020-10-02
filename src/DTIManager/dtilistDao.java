package DTIManager;

import java.util.ArrayList;

public interface dtilistDao {
	void insert(dtilist d); //t1파일 추가

	dtilist select(String id); //id선택 (파일 찾아오기)
	
	String selectFname(String dtiname); //t1파일 찾기

	void update(dtilist d); // t1파일 수정  

	void delete(int dnum); //t1파일 딜리트
	ArrayList<dtilist> selectByDate(String dtidate);
	ArrayList<dtilist> selectBydtiname(String dtiname);
	ArrayList<dtilist> selectById(String id);
	ArrayList<dtilist> selectByIdandpnum(String id, int pnum);
	String selectBydtinum(int dnum);
	
	ArrayList<dtilist> selectAll();
}
