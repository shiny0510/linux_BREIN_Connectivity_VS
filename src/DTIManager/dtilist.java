package DTIManager;

public class dtilist {
	int dnum;
	String id;
	String dtiname;
	String dtipath;
	String dtidate;
	int pnum;
	
	public dtilist() {
		
	}
	
	public dtilist(int dnum, String id, String dtiname, String dtipath, String dtidate, int pnum) {
		super();
		this.dnum = dnum;
		this.id = id;
		this.dtiname = dtiname;
		this.dtipath = dtipath;
		this.dtidate = dtidate;
		this.pnum = pnum;
	}

	public int getDnum() {
		return dnum;
	}

	public void setDnum(int dnum) {
		this.dnum = dnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDtiname() {
		return dtiname;
	}

	public void setDtiname(String dtiname) {
		this.dtiname = dtiname;
	}

	public String getDtipath() {
		return dtipath;
	}

	public void setDtipath(String dtipath) {
		this.dtipath = dtipath;
	}

	public String getDtidate() {
		return dtidate;
	}

	public void setDtidate(String dtidate) {
		this.dtidate = dtidate;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	@Override
	public String toString() {
		return "dtilist [dnum=" + dnum + ", id=" + id + ", dtiname=" + dtiname + ", dtipath=" + dtipath + ", dtidate="
				+ dtidate + ", pnum=" + pnum + "]";
	}
	
	
	
}
