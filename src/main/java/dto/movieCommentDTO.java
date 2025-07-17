package dto;

public class movieCommentDTO {
	private int mcno;
	private String usersid;
	private String movieid;
	private String mpost;
	private String mdate;
	private int reports;
	
	
	
	public movieCommentDTO() {	}

	public movieCommentDTO(int mcno, String usersid, String movieid, String mpost, String mdate, int reports) {
		super();
		this.mcno = mcno;
		this.usersid = usersid;
		this.movieid = movieid;
		this.mpost = mpost;
		this.mdate = mdate;
		this.reports = reports;
	}

	public int getMcno() {
		return mcno;
	}

	public void setMcno(int mcno) {
		this.mcno = mcno;
	}

	public String getUsersid() {
		return usersid;
	}

	public void setUsersid(String usersid) {
		this.usersid = usersid;
	}

	public String getMovieid() {
		return movieid;
	}

	public void setMovieid(String movieid) {
		this.movieid = movieid;
	}

	public String getMpost() {
		return mpost;
	}

	public void setMpost(String mpost) {
		this.mpost = mpost;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public int getReports() {
		return reports;
	}

	public void setReports(int reports) {
		this.reports = reports;
	}

	@Override
	public String toString() {
		return "movieCommentDTO [mcno=" + mcno + ", usersid=" + usersid + ", movieid=" + movieid + ", mpost=" + mpost
				+ ", mdate=" + mdate + ", reports=" + reports + "]";
	}

	
	
}
