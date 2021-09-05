<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="discussBlog.Dao.LoginDao" %>
    <%@ page import="discussBlog.Model.User" %>
    <%@ page import="discussBlog.Dao.PostDao" %>
    <%@ page import="discussBlog.Model.Post" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
html {
  height:100%;
}

body {
  margin:0;
}

.bg {
  animation:slide 3s ease-in-out infinite alternate;
  background-image: linear-gradient(-60deg, #e91e63 50%, #673ab7 50%);
  bottom:0;
  left:-50%;
  opacity:.5;
  position:fixed;
  right:-50%;
  top:0;
  z-index:-1;
}

.bg2 {
  animation-direction:alternate-reverse;
  animation-duration:4s;
}

.bg3 {
  animation-duration:5s;
}

.content {
  background-color:rgba(255,255,255,.8);
  border-radius:.25em;
  box-shadow:0 0 .25em rgba(0,0,0,.25);
  box-sizing:border-box;
  left:50%;
  padding:5vmin;
  position:fixed;
  text-align:center;
  top:50%;
  transform:translate(-50%, -50%);
}

h2 {
  font-family:monospace;
}

h1 {
  font-family:monospace;
}

@keyframes slide {
  0% {
    transform:translateX(-25%);
  }
  100% {
    transform:translateX(25%);
  }
}
</style>


<meta charset="ISO-8859-1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<title>Create - BLOG</title>
</head>
<body class="bg-dark">

<div class="bg"></div>
<div class="bg bg2"></div>
<div class="bg bg3"></div>

<!-- include libraries(jQuery, bootstrap) -->

<script>
    $(document).ready(function() {
        $('#summernote').summernote();
    });
  </script>

<%
if(session.getAttribute("user") == null){
	response.sendRedirect("Login.jsp");
}
User user = (User) session.getAttribute("user");
%>

<% 
int postid = Integer.parseInt(request.getParameter("updateId"));
PostDao pd = new PostDao();
Post post = pd.getPostbyID(postid);
%>


<div class="container-fluid">
<img src="image/background.jpg" class="img-fluid" alt="Blog Creator - Aman, Mausan, Raghavendra and Sauham">
</div>


<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
  <div class="container">
    <a class="navbar-brand" href="Home.jsp">Discussion BLOG</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="Home.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Create.jsp">Create</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="MyPosts.jsp?Id=<%=user.userID%>">My Posts</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="About.jsp">About</a>
        </li>
      </ul>
      <form action="LogoutServlet" method="post" class="form-inline my-2 my-lg-0">
        <input type="submit" class="btn btn-bd-download d-lg-inline-block bg-primary text-white my-2 my-sm-0" value="logout">
        </form>
    </div>
  </div>
</nav>
<br>

  <div class="container">
            <div class="container center-block" >

                <form class="form-signin" action="UpdateServlet?updateID=<%=post.postID %>" method="POST" role="form">
                    <br>
                    <br>
                    <h2 class="form-signin-heading text-light">Write a new Post : </h2>
                    <br>
                    <p class="text-light"><strong>Title : </strong></p>
                    <input id="updateTitle" name="updateTitle" type="text" class="form-control bg-light" required autofocus>
                    <br>
                    <p class="text-light"><strong>Description: </strong></p>
                    <input id="updateDescription" name="updateDescription" type="text" class="form-control"  required >
                    <br>
                    <p class="text-light"><strong>Content : </strong></p>
                    <textarea id="summernote" name="updateContent"></textarea>
                    <br>
                    <p class="text-light"><strong>Author : <%=user.userName %></strong></p>
                    <br>
                    
                    
                    
                    <br>
                    <button name="btnUpdate" class="btn btn-lg btn-primary btn-block" type="submit">Update</button>
                    <br>
                </form>
                <hr>

            </div> <!-- /container --> 
            
            
<script>
document.getElementById("updateTitle").value = '<%=post.postTitle%>';
document.getElementById("updateDescription").value = '<%=post.postDescription%>';
$('#summernote').summernote('editor.pasteHTML', '<%=post.postContent%>');
</script>
            

            <footer>
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <p>Aman, Sauham, Mausam, & Raghavendra (ASMR)</p>
                    </div>
                </div>
            </footer>

        </div><!-- /.container -->




</body>
</html>