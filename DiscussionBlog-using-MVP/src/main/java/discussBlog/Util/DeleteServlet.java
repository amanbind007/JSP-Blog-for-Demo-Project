package discussBlog.Util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import discussBlog.Dao.PostDao;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int postId = Integer.parseInt(request.getParameter("deletePostID"));
		PostDao pd = new PostDao();
		
		
		if(pd.deletePost(postId)) {
			String st = "deleteSuccessful";
			response.sendRedirect("Home.jsp?delete=" + st);
			
		}
		
	}

}
