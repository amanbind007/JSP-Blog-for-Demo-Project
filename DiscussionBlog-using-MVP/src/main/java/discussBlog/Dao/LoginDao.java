package discussBlog.Dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import discussBlog.Database.Database;
import discussBlog.Model.User;

public class LoginDao {
	
	

	public boolean loginCheck(String uemail, String upass) {
		String sql = "select * from users where email=? and password=?";
		Database database = new Database();
		Connection con = database.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			
			st = con.prepareStatement(sql);
			st.setString(1, uemail);
			st.setString(2, upass);
			rs = st.executeQuery();
			
			if(rs.next()) {
				return true;
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			database.closeConnection(con, st, rs);
		}
		return false;
	}
	
	
	
public User getUser(String email, String pass){
		
		
		String sql = "SELECT * FROM users Where email=? and password=?";
		Database database = new Database();
		Connection con = database.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			
			User user = new User();
			st = con.prepareStatement(sql);
			st.setString(1, email);
			st.setString(2, pass);
			rs = st.executeQuery();
			
			while(rs.next()){
				user.userID = rs.getInt(1);
				user.userName = rs.getString(2);
				user.userpass = rs.getString(3);
				user.usermail = rs.getString(4);
				user.useradd = rs.getString(5);
				user.userRole = rs.getString(6);
				user.userCreateDate = rs.getString(7);
			}
			
			return user;
		
		
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		 }finally {
			 database.closeConnection(con, st, rs);
		 }
		return null;
	}


public User getUserbyID(int ID){
	
	
	String sql = "SELECT * FROM users Where userId=?";
	Database database = new Database();
	Connection con = database.getConnection();
	PreparedStatement st = null;
	ResultSet rs = null;
	try {
		
		User user = new User();
		
		
		st = con.prepareStatement(sql);
		st.setInt(1, ID);
		
		rs = st.executeQuery();
		
		while(rs.next()){
			user.userID = rs.getInt(1);
			user.userName = rs.getString(2);
			user.userpass = rs.getString(3);
			user.usermail = rs.getString(4);
			user.useradd = rs.getString(5);
			user.userRole = rs.getString(6);
			user.userCreateDate = rs.getString(7);
		}
		
		return user;
	
	
	 } catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	 }finally {
		 database.closeConnection(con, st, rs);
	 }
	return null;
}



}

