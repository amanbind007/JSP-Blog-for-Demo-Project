package discussBlog.Util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import discussBlog.Dao.ReplyDao;
import discussBlog.Model.User;


@WebServlet("/ReplyServlet")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		
		int userId = (int)session.getAttribute("userID");
		int postId = (int)session.getAttribute("postId");
		String content = request.getParameter("txtComment");
		String author = user.userName;
		
		
		ReplyDao rdao = new ReplyDao();
		if(rdao.replyCheck(userId, postId, content, author)) {
			response.sendRedirect("Read.jsp?Id="+postId+"&Reply=Yes");
		}
		
				
	}

}
