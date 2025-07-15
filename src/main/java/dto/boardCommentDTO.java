package dto;

public class boardCommentDTO {
	private String bcno;
	private String bno;
	private String usersId;
	private String nickname;
	private String bcpost;
	private String bcdate;
	private int reports;
	private int clike;
	private int chate;
	
	public boardCommentDTO() {	}

	public boardCommentDTO(String bcno, String bno, String usersId, String nickname, String bcpost, String bcdate,
			int reports, int clike, int chate) {
		super();
		this.bcno = bcno;
		this.bno = bno;
		this.usersId = usersId;
		this.nickname = nickname;
		this.bcpost = bcpost;
		this.bcdate = bcdate;
		this.reports = reports;
		this.clike = clike;
		this.chate = chate;
	}

	public String getBcno() {
		return bcno;
	}

	public void setBcno(String bcno) {
		this.bcno = bcno;
	}

	public String getBno() {
		return bno;
	}

	public void setBno(String bno) {
		this.bno = bno;
	}

	public String getUsersId() {
		return usersId;
	}

	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBcpost() {
		return bcpost;
	}

	public void setBcpost(String bcpost) {
		this.bcpost = bcpost;
	}

	public String getBcdate() {
		return bcdate;
	}

	public void setBcdate(String bcdate) {
		this.bcdate = bcdate;
	}

	public int getReports() {
		return reports;
	}

	public void setReports(int reports) {
		this.reports = reports;
	}

	public int getClike() {
		return clike;
	}

	public void setClike(int clike) {
		this.clike = clike;
	}

	public int getChate() {
		return chate;
	}

	public void setChate(int chate) {
		this.chate = chate;
	}

	@Override
	public String toString() {
		return "boardCommentDTO [bcno=" + bcno + ", bno=" + bno + ", usersId=" + usersId + ", nickname=" + nickname
				+ ", bcpost=" + bcpost + ", bcdate=" + bcdate + ", reports=" + reports + ", clike=" + clike + ", chate="
				+ chate + "]";
	}

	
	
	
}