package T1FileManage;

import java.util.ArrayList;

public interface T1FMService {
	void addT1File(T1FM t);  // ���̵�, ���� �̸�, ���� ���
	 
	void editT1File(T1FM t);  //���� ���� 

	void delT1File(int num); //���� ���� 

	ArrayList<T1FM> getByT1Date(String t1date); //��¥�� ���� ã�� (����Ʈ)

	ArrayList<T1FM> getByt1name(String t1name); //���� �̸����� ���� ã�� (����Ʈ)

	ArrayList<T1FM> getById(String id, int pnum); // ���̵�� ���� ã��(����Ʈ)

	String getByt1num(int t1num); // �ѹ� ���� ã��(����Ʈ)
	
	ArrayList<T1FM> getAll(); //���� ��ü ����Ʈ �������� (����Ʈ)

	T1FM getT1File(int t1num); 
	
	int makeT1FileNum(); //���� 
}
