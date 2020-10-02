package projectlist;

import java.util.ArrayList;

public interface projectlistDao {

	void insert(projectlist p); // project추가

	projectlist select(String id); // project선택

	String selectproject(String id); // project찾기
	// 비밀번호 보류

	void update(projectlist p); // project수정

	void delete(int pnum); // project삭제

	//ArrayList<member> selectAll(String area);// &&&보류
	ArrayList<projectlist> selectByDate(String pdate);
	ArrayList<projectlist> selectByPname(String pname);
	ArrayList<projectlist> selectById(String id);

	String selectByPnum(int pnum);

	
	
}
