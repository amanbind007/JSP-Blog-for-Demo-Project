package discussBlog.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import discussBlog.Database.Database;
import discussBlog.Model.Post;

public class PostDao {
	
	
	
	public boolean postCheck(int userId, String title, String description, String content, String author){
		
		String sql = "insert into post(userId, title, description, content, author, createDate) values (?,?,?,?,?,now())";
		Database database = new Database();
		Connection con = database.getConnection();
		PreparedStatement st = null;
		try {
			
			st = con.prepareStatement(sql);
			st.setInt(1, userId);
			st.setString(2, title);
			st.setString(3, description);
			st.setString(4, content);
			st.setString(5, author);
			
			
			int i = st.executeUpdate();
			
			if(i > 0) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			database.closeConnection(con, st);
		}
		
		
		return false;
		
	}
	
	public List<Post> getPosts(){
		
		String sql = "SELECT * FROM post ORDER BY createDate DESC";
		Database database = new Database();
		Connection con = database.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			
			Post post;
			
			List<Post> posts = new ArrayList<Post>();
			
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			
			while(rs.next()){
				post = new Post();
				
				post.postID = rs.getInt(1);
				post.postUserId = rs.getString(2);
				post.postTitle = rs.getString(3);
				post.postDescription = rs.getString(4);
				post.postContent = rs.getString(5);
				post.postAuthor = rs.getString(6);
				post.postDate = rs.getString(7);
				
			posts.add(post);
			}
			
			return posts;
		
		
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		 }finally {
			 database.closeConnection(con, st, rs);
		 }
		
	}

	public Post getPostbyTitle(String title) {
		String sql = "SELECT * FROM post where title=?";
		Database database = new Database();
		Connection con = database.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			Post post = new Post();
			
			st = con.prepareStatement(sql);
			st.setString(1, title);
			
			rs = st.executeQuery();
			if(rs.next()) {
				
			post.postID = rs.getInt(1);
			post.postUserId = rs.getString(2);
			post.postTitle = rs.getString(3);
			post.postDescription = rs.getString(4);
			post.postContent = rs.getString(5);
			post.postAuthor = rs.getString(6);
			post.postDate = rs.getString(7);
			}
			return post;
			
		}
		catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		 }finally {
			 database.closeConnection(con, st, rs);
		 }
		
	}

	
	
	
	
	public Post getPostbyID(int ID) {
		String sql = "SELECT * FROM post where postId=? ORDER BY createDate DESC";
		Database database = new Database();
		Connection con = database.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			
			Post post = new Post();
			
			st = con.prepareStatement(sql);
			st.setInt(1, ID);
			
			rs = st.executeQuery();
			if(rs.next()) {
				
			post.postID = rs.getInt(1);
			post.postUserId = rs.getString(2);
			post.postTitle = rs.getString(3);
			post.postDescription = rs.getString(4);
			post.postContent = rs.getString(5);
			post.postAuthor = rs.getString(6);
			post.postDate = rs.getString(7);
			
			}
			return post;
			
		}
		catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		 }
		finally {
			database.closeConnection(con, st, rs);
		}
		
	}
	
	
	
	
	
	public List<Post> getPostbyUserID(int ID) {
		String sql = "SELECT * FROM post where userId=? ORDER BY createDate DESC";
		Database database = new Database();
		Connection con = database.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			Post post;
			List<Post> posts = new ArrayList<Post>();
			
			st = con.prepareStatement(sql);
			st.setInt(1, ID);
			
			rs = st.executeQuery();
			while(rs.next()) {
				post = new Post();
				
			post.postID = rs.getInt(1);
			post.postUserId = rs.getString(2);
			post.postTitle = rs.getString(3);
			post.postDescription = rs.getString(4);
			post.postContent = rs.getString(5);
			post.postAuthor = rs.getString(6);
			post.postDate = rs.getString(7);
			
			posts.add(post);
			}
			return posts;
			
		}
		catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		 }finally {
			 database.closeConnection(con, st, rs);
		 }
		
	}
	
	
	
	public Post getPostbyKeywords(String key) {
		String sql = "SELECT * FROM post where userId=?";
		Database database = new Database();
		Connection con = database.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			Post post = new Post();
			
			st = con.prepareStatement(sql);
			st.setString(1, key);
			
			rs = st.executeQuery();
			if(rs.next()) {
				
			post.postID = rs.getInt(1);
			post.postUserId = rs.getString(2);
			post.postTitle = rs.getString(3);
			post.postDescription = rs.getString(4);
			post.postContent = rs.getString(5);
			post.postAuthor = rs.getString(6);
			post.postDate = rs.getString(7);
			}
			return post;
			
		}
		catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		 }finally {
			 database.closeConnection(con, st, rs);
		 }
		
	}

	public boolean postUpdateCheck(int postId, String title, String description, String content) {
		
		String sql = "update post set title=?, description=?, content=? where postId=?";
		Database database = new Database();
		Connection con = database.getConnection();
		PreparedStatement st = null;
		try {
			st = con.prepareStatement(sql);
			st.setString(1, title);
			st.setString(2, description);
			st.setString(3, content);
			st.setInt(4, postId);
			
			int i = st.executeUpdate();
			if(i > 0) {
				return true;
			}else {
				return false;
			}	
			
		}catch (SQLException e) {
			
			e.printStackTrace();
			return false;
		 }finally {
			 database.closeConnection(con, st);
		 }

	}

	public boolean deletePost(int postId) {
		String sql = "delete from post where postId=?";
		Database database = new Database();
		Connection con = database.getConnection();
		PreparedStatement st = null;
		try {
			st = con.prepareStatement(sql);
			st.setInt(1, postId);
			
			int i = st.executeUpdate();
			if(i > 0) {
				return true;
			}
			else {
				return false;
			}	
			
		}
		catch (SQLException e) {
			
			e.printStackTrace();
			return false;
		 }finally {
			 database.closeConnection(con, st);
		 }
		
	}	
	
}
