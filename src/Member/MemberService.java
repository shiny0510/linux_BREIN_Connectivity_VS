package Member;

import java.util.ArrayList;

public interface MemberService {
	void join(member m);

	boolean login(String id, String pwd);

	member getMember(String id);
	
	String getId(String name, String tel);

	void editInfo(member m);

	void out(String id);
	
	ArrayList<member> getList(String area);
}
