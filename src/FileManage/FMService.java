package FileManage;

import java.util.ArrayList;

public interface FMService {
	void addFile(FileManager m);  // ���̵�, ���� �̸�, ���� ���
 
	void editMovie(FileManager f);  //���� ���� 

	void delMovie(int num); //���� ���� 

	ArrayList<FileManager> getByDate(String fdate); //��¥�� ���� ã�� (����Ʈ)

	ArrayList<FileManager> getByFname(String fname); //���� �̸����� ���� ã�� (����Ʈ)

	ArrayList<FileManager> getById(String id, int pnum); // ���̵�� ���� ã��(����Ʈ)

	String getBynum(int fnum); // �ѹ� ���� ã��(����Ʈ)
	
	ArrayList<FileManager> getAll(); //���� ��ü ����Ʈ �������� (����Ʈ)

	FileManager getFile(int num); 
	
	int makeFileNum(); //���� 
}
