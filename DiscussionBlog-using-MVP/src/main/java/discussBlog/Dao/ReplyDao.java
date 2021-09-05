package discussBlog.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import discussBlog.Database.Database;
import discussBlog.Model.Reply;

public class ReplyDao {
	
	public boolean replyCheck(int userId, int postId, String content, String author){
		
		String sql = "insert into reply (userId, postId, content, author, createDate) values (?,?,?,?,now())";
		Database database = new Database();
		Connection con = database.getConnection();
		PreparedStatement st = null;
		try {
			st = con.prepareStatement(sql);
			st.setInt(1, userId);
			st.setInt(2, postId);
			st.setString(3, content);
			st.setString(4, author);
			
			
			int i = st.executeUpdate();
			
			if(i > 0) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally {
			database.closeConnection(con, st);
		}
		
	}
	
	
	public List<Reply> getReplybyPostID(int ID){
		String sql = "SELECT * FROM reply where postId=?";
		Database database = new Database();
		Connection con = database.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
		Reply reply;
		
		List<Reply> replies = new ArrayList<Reply>();
		
		st = con.prepareStatement(sql);
		st.setInt(1, ID);
		rs = st.executeQuery();
		
		while(rs.next()) {
			reply = new Reply();
			
		    reply.replyID = rs.getInt(1);
		    reply.replyUserId = rs.getInt(2);
		    reply.replyPostId = rs.getInt(3);
		    reply.replyContent = rs.getString(4);
		    reply.replyAuthor = rs.getString(5);
			reply.replyDate = rs.getString(6);
			
			replies.add(reply);
		
		}
		
		return replies;
		
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}finally {
			database.closeConnection(con, st, rs);
		}
		
	}

}
