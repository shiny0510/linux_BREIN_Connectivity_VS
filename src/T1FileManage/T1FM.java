package T1FileManage;

public class T1FM {
	int t1num;
	String id;
	String t1name;
	String t1path;
	String t1date;
	int pnum;
	
	public T1FM() {
		
	}

	public T1FM(int t1num, String id, String t1name, String t1path, String t1date, int pnum) {
		super();
		this.t1num = t1num;
		this.id = id;
		this.t1name = t1name;
		this.t1path = t1path;
		this.t1date = t1date;
		this.pnum = pnum;
	}

	public int getT1num() {
		return t1num;
	}

	public void setT1num(int t1num) {
		this.t1num = t1num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getT1name() {
		return t1name;
	}

	public void setT1name(String t1name) {
		this.t1name = t1name;
	}

	public String getT1path() {
		return t1path;
	}

	public void setT1path(String t1path) {
		this.t1path = t1path;
	}

	public String getT1date() {
		return t1date;
	}

	public void setT1date(String t1date) {
		this.t1date = t1date;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	@Override
	public String toString() {
		return "T1FM [t1num=" + t1num + ", id=" + id + ", t1name=" + t1name + ", t1path=" + t1path + ", t1date="
				+ t1date + ", pnum=" + pnum + "]";
	}
	
	
}
