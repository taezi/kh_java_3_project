package dto;

public class boardDTO {
	private int bno;
	private String usersId;
	private String titles;
	private String bpost;
	private String bdate;
	private String bview;
	private String nickname;
	private int blike;
	private int bhate;
	private int ccount;
	
	public boardDTO() {	}

	public boardDTO(int bno, String usersId, String titles, String bpost, String bdate, String bview, String nickname,
			int blike, int bhate, int ccount) {
		super();
		this.bno = bno;
		this.usersId = usersId;
		this.titles = titles;
		this.bpost = bpost;
		this.bdate = bdate;
		this.bview = bview;
		this.nickname = nickname;
		this.blike = blike;
		this.bhate = bhate;
		this.ccount = ccount;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getUsersId() {
		return usersId;
	}

	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}

	public String getTitles() {
		return titles;
	}

	public void setTitles(String titles) {
		this.titles = titles;
	}

	public String getBpost() {
		return bpost;
	}

	public void setBpost(String bpost) {
		this.bpost = bpost;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public String getBview() {
		return bview;
	}

	public void setBview(String bview) {
		this.bview = bview;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getBlike() {
		return blike;
	}

	public void setBlike(int blike) {
		this.blike = blike;
	}

	public int getBhate() {
		return bhate;
	}

	public void setBhate(int bhate) {
		this.bhate = bhate;
	}

	public int getCcount() {
		return ccount;
	}

	public void setCcount(int ccount) {
		this.ccount = ccount;
	}

	@Override
	public String toString() {
		return "boardDTO [bno=" + bno + ", usersId=" + usersId + ", titles=" + titles + ", bpost=" + bpost + ", bdate="
				+ bdate + ", bview=" + bview + ", nickname=" + nickname + ", blike=" + blike + ", bhate=" + bhate
				+ ", ccount=" + ccount + "]";
	}

	
	
	

	
}