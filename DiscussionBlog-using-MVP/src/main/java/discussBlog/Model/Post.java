package discussBlog.Model;

public class Post {
	 public int postID;
	 public String postUserId;
	 public String postTitle;
	 public String postDescription;
	 public String postContent;	
	 public String postAuthor;
	 public String postDate;
	 
	

//	public Post(int postID, String postUserId, String postTitle, String postDescription, String postContent,
//			String postCount, String postDate) {
//		super();
//		this.postID = postID;
//		this.postUserId = postUserId;
//		this.postTitle = postTitle;
//		this.postDescription = postDescription;
//		this.postContent = postContent;
//		this.postAuthor = postAuthor;
//		this.postDate = postDate;
//	}



	public Post() {
		// TODO Auto-generated constructor stub
	}



	public int getPostID() {
		return postID;
	}



	public void setPostID(int postID) {
		this.postID = postID;
	}



	public String getPostUserId() {
		return postUserId;
	}



	public void setPostUserId(String postUserId) {
		this.postUserId = postUserId;
	}



	public String getPostTitle() {
		return postTitle;
	}



	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}



	public String getPostDescription() {
		return postDescription;
	}



	public void setPostDescription(String postDescription) {
		this.postDescription = postDescription;
	}



	public String getPostContent() {
		return postContent;
	}



	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}



	public String getPostAuthor() {
		return postAuthor;
	}



	public void setPostAuthor(String postCount) {
		this.postAuthor = postCount;
	}



	public String getPostDate() {
		return postDate;
	}



	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}



	@Override
	public String toString() {
		return "Post [postID=" + postID + ", postUserId=" + postUserId + ", PostTitle=" + postTitle
				+ ", PostDescription=" + postDescription + ", PostContent=" + postContent + ", PostAuthor=" + postAuthor
				+ ", PostDate=" + postDate + "]";
	}


}
