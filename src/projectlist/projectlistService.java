package projectlist;

import java.util.ArrayList;

public interface projectlistService {
	void addFile(projectlist p);  // ���̵�, ���� �̸�, ���� ���
	 
	void editprojectlist(projectlist p);  //���� ���� 

	void delprojectlist(int pnum); //���� ���� 

	ArrayList<projectlist> getByDate(String pdate); //��¥�� ���� ã�� (����Ʈ)

	ArrayList<projectlist> getByFname(String pname); //���� �̸����� ���� ã�� (����Ʈ)

	ArrayList<projectlist> getById(String id); // ���̵�� ���� ã��(����Ʈ)

	String getBynum(int pnum); // �ѹ� ���� ã��(����Ʈ)
	
	ArrayList<projectlist> getAll(); //���� ��ü ����Ʈ �������� (����Ʈ)

	projectlist getFile(int pnum); 
	
	int makeFileNum(); //���� 
}
