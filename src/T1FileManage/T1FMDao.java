package T1FileManage;

import java.util.ArrayList;

public interface T1FMDao {
	void insert(T1FM t); //t1���� �߰�

	T1FM select(String id); //id���� (���� ã�ƿ���)
	
	String selectFname(String t1name); //t1���� ã��

	void update(T1FM t); // t1���� ����  

	void delete(int t1num); //t1���� ����Ʈ
	ArrayList<T1FM> selectByDate(String t1date);
	ArrayList<T1FM> selectByFname(String t1name);
	ArrayList<T1FM> selectById(String id);
	ArrayList<T1FM> selectByIdandpnum(String id, int pnum);
	String selectByFnum(int t1num);
	
	ArrayList<T1FM> selectAll();
}
