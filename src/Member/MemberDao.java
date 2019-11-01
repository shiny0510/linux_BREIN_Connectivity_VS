package Member;

import java.util.ArrayList;

public interface MemberDao {
	void insert(member m); //id추가

	member select(String id); //id선택
	
	String selectId(String name,String tel); //id찾기
							//비밀번호 보류

	void update(member m); //id수정

	void delete(String id); //id삭제
	
	ArrayList<member> selectAll(String area);// &&&보류
	
}
