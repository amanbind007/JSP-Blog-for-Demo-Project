package discussBlog.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import discussBlog.Database.Database;

public class RegistrationDao {
	
	String sql = "insert into users(username, password, email, address, userRole, createDate) values(?,?,?,?, 'user', now())";
	
	public boolean RegistrationCheck(String username, String email, String password, String address){
		Database database = new Database();
		Connection con = database.getConnection();
		PreparedStatement st = null;
		try {
			st = con.prepareStatement(sql);
			st.setString(1, username);
			st.setString(2, password);
			st.setString(3, email);
			st.setString(4, address);
			
			int i = st.executeUpdate();	
			
			if(i > 0){
				System.out.println("Success");
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally {
			database.closeConnection(con, st);
		}
		
		return false;
		
	}

}
