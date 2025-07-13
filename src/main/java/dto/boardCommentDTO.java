package dto;

public class boardCommentDTO {
	private String bcno;
	private String bno;
	private String usersId;
	private String bcpost;
	private String bcdate;
	
	public boardCommentDTO() {	}
	
	public boardCommentDTO(String bcno, String bno, String usersId, String bcpost, String bcdate) {
		super();
		this.bcno = bcno;
		this.bno = bno;
		this.usersId = usersId;
		this.bcpost = bcpost;
		this.bcdate = bcdate;
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

	@Override
	public String toString() {
		return "boardCommentDTO [bcno=" + bcno + ", bno=" + bno + ", usersId=" + usersId + ", bcpost=" + bcpost
				+ ", bcdate=" + bcdate + "]";
	}
}