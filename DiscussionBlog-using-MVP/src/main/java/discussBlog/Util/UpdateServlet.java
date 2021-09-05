package discussBlog.Util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import discussBlog.Dao.PostDao;


/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int postId = Integer.parseInt(request.getParameter("updateID"));
		
		String title = request.getParameter("updateTitle");
		String description = request.getParameter("updateDescription");
		String content = request.getParameter("updateContent");
		
		PostDao pd = new PostDao();
		
		if(pd.postUpdateCheck(postId, title, description, content)) {
			String st = "SuccessfulUpdate";
			response.sendRedirect("Read.jsp?Id="+ postId+"&successfulUpdate=" + st);
			
		}
	
	}

}
