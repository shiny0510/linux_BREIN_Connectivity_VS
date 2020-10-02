package DTIManager;

import java.util.ArrayList;

public interface dtilistDao {
	void insert(dtilist d); //t1���� �߰�

	dtilist select(String id); //id���� (���� ã�ƿ���)
	
	String selectFname(String dtiname); //t1���� ã��

	void update(dtilist d); // t1���� ����  

	void delete(int dnum); //t1���� ����Ʈ
	ArrayList<dtilist> selectByDate(String dtidate);
	ArrayList<dtilist> selectBydtiname(String dtiname);
	ArrayList<dtilist> selectById(String id);
	ArrayList<dtilist> selectByIdandpnum(String id, int pnum);
	String selectBydtinum(int dnum);
	
	ArrayList<dtilist> selectAll();
}
