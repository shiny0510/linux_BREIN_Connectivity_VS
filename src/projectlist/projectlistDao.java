package projectlist;

import java.util.ArrayList;

public interface projectlistDao {

	void insert(projectlist p); // project�߰�

	projectlist select(String id); // project����

	String selectproject(String id); // projectã��
	// ��й�ȣ ����

	void update(projectlist p); // project����

	void delete(int pnum); // project����

	//ArrayList<member> selectAll(String area);// &&&����
	ArrayList<projectlist> selectByDate(String pdate);
	ArrayList<projectlist> selectByPname(String pname);
	ArrayList<projectlist> selectById(String id);

	String selectByPnum(int pnum);

	
	
}
