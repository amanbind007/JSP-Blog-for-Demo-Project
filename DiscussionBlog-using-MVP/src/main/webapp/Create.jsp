<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="discussBlog.Dao.LoginDao" %>
    <%@ page import="discussBlog.Model.User" %>
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
<!-- Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

<title>Create - BLOG</title>
</head>
<body class="bg-dark">

<div class="bg"></div>
<div class="bg bg2"></div>
<div class="bg bg3"></div>

<script type="text/javascript">
if("<%=request.getParameter("unsuccessfulPost")%>" == "unsuccessfulPost"){
	window.alert("Post Published Successfully");
}
</script>


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




<div class="container-fluid">
<img src="image/background.jpg" class="img-fluid" alt="Blog Creator - Aman, Mausan, Raghavendra and Sauham">
</div>


<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
  <div class="container">
    <a class="navbar-brand" href="Home.jsp">Create | Discussion BLOG</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="Home.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Create</a>
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


  <div class="container">

            <div class="container center-block" >

                <form class="form-signin" action="PostServlet" method="POST" role="form">

                    <h2 class="form-signin-heading text-light">Write a new Post : </h2>
                    <br>
                    <p class="text-light"><strong>Title : </strong></p>
                    <input name="txtTitle" type="text" class="form-control bg-light" placeholder="Title of the Post" required autofocus>
                    <br>
                    <p class="text-light"><strong>Description : </strong></p>
                    <input name="txtDescription" type="text" class="form-control" placeholder="300 characters only" required >
                    <br>
                    <p class="text-light"><strong>Content : </strong></p>
                    <textarea id="summernote" name="txtContent"></textarea>
                    <br>
                    <p class="text-light"><strong>Author : <%=user.userName %></strong></p>
                    <br>
                    <br>
                    <button name="btnUpdate" class="btn btn-lg btn-primary btn-block" type="submit">Publish</button>
                    <br>
                </form>
                <hr>

            </div> <!-- /container --> 
            
            
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
            

            <footer>
                <div class="row">
                    <div class="col-lg-12 text-center text-white">
                        <p>Aman, Sauham, Mausam, & Raghavendra (ASMR)</p>
                    </div>
                </div>
            </footer>

        </div><!-- /.container -->




</body>
</html>