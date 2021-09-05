package discussBlog.Model;

public class User {
	public int userID;
	public String userName;
	public String userpass;
	public String usermail;
	public String useradd;	 
    public String userRole;
	public String userCreateDate;
	
	
//	public User(int userID, String userName, String userpass, String usermail, String useradd, String userRole,
//			String userCreateDate) {
//		super();
//		this.userID = userID;
//		this.userName = userName;
//		this.userpass = userpass;
//		this.usermail = usermail;
//		this.useradd = useradd;
//		this.userRole = userRole;
//		this.userCreateDate = userCreateDate;
//	}

	@Override
	public String toString() {
		return "User [userID=" + userID + ", userName=" + userName + ", userpass=" + userpass + ", usermail=" + usermail
				+ ", useradd=" + useradd + ", userRole=" + userRole + ", userCreateDate=" + userCreateDate + "]";
	}

	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getUsermail() {
		return usermail;
	}
	public void setUsermail(String usermail) {
		this.usermail = usermail;
	}
	public String getUseradd() {
		return useradd;
	}
	public void setUseradd(String useradd) {
		this.useradd = useradd;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public String getUserCreateDate() {
		return userCreateDate;
	}
	public void setUserCreateDate(String userCreateDate) {
		this.userCreateDate = userCreateDate;
	}
}
