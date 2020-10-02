package FileManage;

import java.util.ArrayList;

public interface FMDao {
	void insert(FileManager f); //���� �߰�

	FileManager select(String id); //id���� (���� ã�ƿ���)
	
	String selectFname(String fname); //���� ã��

	void update(FileManager f); // ���� ����  

	void delete(int fnum); //���� ����Ʈ
	ArrayList<FileManager> selectByDate(String fdate);
	ArrayList<FileManager> selectByFname(String fname);
	ArrayList<FileManager> selectById(String id, int pnum);
	String selectByFnum(int fnum);
	
	ArrayList<FileManager> selectAll();
	
}
