package discussBlog.Model;

public class Reply {
	 public int replyID;
	 public int replyUserId;
	 public int replyPostId;
	 public String replyContent;	
	 public String replyAuthor;
	 public String replyDate;
	
	 
	 
//	 public Reply(int replyID, int replyUserId, int replyPostId, String replyContent, String replyAuthor,
//			String replyDate) {
//		super();
//		this.replyID = replyID;
//		this.replyUserId = replyUserId;
//		this.replyPostId = replyPostId;
//		this.replyContent = replyContent;
//		this.replyAuthor = replyAuthor;
//		this.replyDate = replyDate;
//	}


	public Reply() {
		// TODO Auto-generated constructor stub 
	 }
	 
	 
	 public int getReplyID() {
		return replyID;
	}
	public void setReplyID(int replyID) {
		this.replyID = replyID;
	}
	public int getReplyUserId() {
		return replyUserId;
	}
	public void setReplyUserId(int replyUserId) {
		this.replyUserId = replyUserId;
	}
	public int getReplyPostId() {
		return replyPostId;
	}
	public void setReplyPostId(int replyPostId) {
		this.replyPostId = replyPostId;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyAuthor() {
		return replyAuthor;
	}
	public void setReplyAuthor(String replyAuthor) {
		this.replyAuthor = replyAuthor;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	
	@Override
	public String toString() {
		return "Reply [replyID=" + replyID + ", replyUserId=" + replyUserId + ", replyPostId=" + replyPostId
				+ ", replyContent=" + replyContent + ", replyAuthor=" + replyAuthor + ", replyDate=" + replyDate + "]";
	}





}

