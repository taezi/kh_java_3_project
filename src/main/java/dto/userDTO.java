package dto;

public class userDTO {
	private String usersid;
	private String passwd;
	private String passwdRe;
	private String userName;
	private String nickName;
	
	public userDTO() {	}

	public userDTO(String usersid, String passwd, String passwdRe, String userName, String nickName) {
		super();
		this.usersid = usersid;
		this.passwd = passwd;
		this.passwdRe = passwdRe;
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
	
	public String getPasswdRe() {
		return passwdRe;
	}

	public void setPasswdRe(String passwdRe) {
		this.passwdRe = passwdRe;
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
		return "userDTO [usersid=" + usersid + ", passwd=" + passwd + ", passwdRe=" + passwdRe + ", userName="
				+ userName + ", nickName=" + nickName + "]";
	}


	
}
