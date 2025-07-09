package dto;

public class userDTO {
	private String usersid;
	private String passwd;
	private String userName;
	private String nickName;
	
	public userDTO() {	}

	public userDTO(String usersid, String passwd, String userName, String nickName) {
		super();
		this.usersid = usersid;
		this.passwd = passwd;
		this.userName = userName;
		this.nickName = nickName;
	}

	public String getUsersid() {
		return usersid;
	}

	public void setUsersid(String usersid) {
		this.usersid = usersid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "userDTO [usersid=" + usersid + ", passwd=" + passwd + ", userName=" + userName + ", nickName="
				+ nickName + "]";
	}
	
}
