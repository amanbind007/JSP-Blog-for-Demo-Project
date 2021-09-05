package discussBlog.Util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import discussBlog.Dao.PostDao;
import discussBlog.Model.User;

@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	    HttpSession session = request.getSession();
		int id = (int)session.getAttribute("userID");
		User user = (User) session.getAttribute("user");
	
		int userId = id;
		String title = request.getParameter("txtTitle");
		String description = request.getParameter("txtDescription");
		String content = request.getParameter("txtContent");
		String author = user.userName;
		
		PostDao pdao = new PostDao();
		
		if(pdao.postCheck(userId, title , description, content, author)){
			String st = "SuccessfulPost";
			response.sendRedirect("Home.jsp?successfulPost=" + st);
		}
		else {
			String st = "UnsuccessfulPost";
			response.sendRedirect("Create.jsp?unsuccessfulPost=" + st);
			
		}	
		
	}

}
