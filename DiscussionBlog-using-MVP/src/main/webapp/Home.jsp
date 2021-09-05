<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page import="discussBlog.Dao.PostDao" %>
<%@ page import="discussBlog.Model.Post" %>
<%@ page import="discussBlog.Model.User" %>
<%@ page import="java.util.List" %>
<%@page import="java.util.Iterator"%>

<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" ></script>
<!-- Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">

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
<title>Discussion Blog</title>
</head>
<body class="bg-dark">
<div class="bg"></div>
<div class="bg bg2"></div>
<div class="bg bg3"></div>

<%
if(session.getAttribute("user") == null){
	response.sendRedirect("Login.jsp");
}

User user = (User)session.getAttribute("user");

%>


<script type="text/javascript">
if("<%=request.getParameter("successfulPost")%>" == "SuccessfulPost"){
	window.alert("Post Published Successfully");
}
if("<%=request.getParameter("delete")%>" == "deleteSuccessful"){
	window.alert("Post Deleted Successfully");
}
</script>



<div class="container-fluid">
<img src="image/background.jpg" class="img-fluid" alt="Blog Creator - Aman, Mausan, Raghavendra and Sauham">
</div>


<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
  <div class="container">
    <a class="navbar-brand" href="home.jsp">Discussion BLOG</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Home.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Create.jsp">Create</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="MyPosts.jsp?Id=<%=user.userID%>">My Posts</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="About.jsp" target="_blank">About</a>
        </li>
      </ul>
      <form action="LogoutServlet" method="post" class="form-inline my-2 my-lg-0">
        <input type="submit" class="btn btn-bd-download d-lg-inline-block bg-primary text-white my-2 my-sm-0" value="logout">
        </form>
    </div>
  </div>
</nav>
<br>

<!-- Post cards -->
<div class="container">
<div class="row">

<% 
PostDao pd = new PostDao();
List<Post> posts = pd.getPosts();
%>


<% for(Post pst : posts) { %>
<!-- Post - cards -->
  <div class="card w-75 mb-3 bg-success text-white">
  <div class="card-body">
    <h5 class="card-title" ><%=pst.postTitle%></h5>
    <p class="card-text">Post created on <%=pst.postDate %> by <%=pst.postAuthor %></p>
    <p class="card-text"><%=pst.postDescription%></p>   
     <a href="Read.jsp?Id=<%=pst.postID%>" id="name" class="btn btn-dark">Click Here to Read</a>
  </div>
</div>
<!-- Post - cards -->
<% } %>


</div>
</div>


<button type="button" class="btn btn-primary btn-lg position-fixed bottom-0 end-0" onclick="topFunction()" id="scroll-up-button"><i class="bi bi-arrow-up-circle-fill"></i></button>

<script>
//Get the button:
mybutton = document.getElementById("scroll-up-button");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}
</script>

<div class="container text-light"> 
<footer>
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <p>Aman, Sauham, Mausam, & Raghavendra (ASMR)</p>
                    </div>
                </div>
            </footer>
</div>

</body>
</html>