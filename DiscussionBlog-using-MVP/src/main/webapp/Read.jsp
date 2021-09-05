<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="discussBlog.Dao.PostDao" %>
<%@ page import="discussBlog.Dao.ReplyDao" %>
<%@ page import="discussBlog.Model.Post" %>
<%@ page import="discussBlog.Model.Reply" %>
<%@ page import="discussBlog.Model.User" %>
<%@ page import="java.util.List" %>

<%
if(session.getAttribute("user") == null){
	response.sendRedirect("Login.jsp");
} 

User user = (User)session.getAttribute("user");

PostDao pd = new PostDao();
int id = Integer.parseInt(request.getParameter("Id"));

Post post = pd.getPostbyID(id);
session.setAttribute("postId", id);
%>

<% 
int newID = Integer.parseInt(request.getParameter("Id"));
ReplyDao rd = new ReplyDao();
List<Reply> replies = rd.getReplybyPostID(id);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<script>
if("<%=request.getParameter("Reply") %>" == "Yes"){
	window.alert("Comment Submitted!");
}

</script>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" ></script>
<!-- Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
<!-- Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">


<script type="text/javascript">
if("<%=request.getParameter("successfulPost") %>" == "SuccessfulPost"){
	alert.window("Post Published Seccessfully!");
}
</script>



<title><%=post.postTitle %> | Read</title>
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

<style type="text/css">
body{
    margin-top:20px;
    background-color:#e9ebee;
}

.be-comment-block {
    margin-bottom: 50px !important;
    border-radius: 5px;
    padding: 50px 70px;
}

.comments-title {
    font-size: 25px;
    color: white;
    margin-bottom: 15px;
    font-family: 'Conv_helveticaneuecyr-bold';
}

.be-img-comment {
    width: 60px;
    height: 60px;
    float: left;
    margin-bottom: 15px;
}

.be-ava-comment {
    width: 60px;
    height: 60px;
    border-radius: 50%;
}


.be-comment-content span {
    display: inline-block;
    width: 49%;
    margin-bottom: 3px;
}

.be-comment-name {
    font-size: 15px;
    font-family: 'Conv_helveticaneuecyr-bold';
}

.be-comment-content a {
    color: #383b43;
}


.be-comment-time {
    text-align: right;
}

.be-comment-time {
    font-size: 0.75rem;
    color: #b4b7c1;
}

.be-comment-text {
    font-size: 15px;
    font-family: Arial;
    line-height: 18px;
    color: black;
    display: block;
    background: #d8d8d8;
    border-radius: 5px;
    padding: 15px 20px 20px 20px;
}

.form-group.fl_icon .icon {
    position: absolute;
    top: px;
    left: 16px;
    width: 48px;
    height: 48px;
    background: #f6f6f7;
    color: #b5b8c2;
    text-align: center;
    line-height: 50px;
    -webkit-border-top-left-radius: 2px;
    -webkit-border-bottom-left-radius: 2px;
    -moz-border-radius-topleft: 2px;
    -moz-border-radius-bottomleft: 2px;
    border-top-left-radius: 2px;
    border-bottom-left-radius: 2px;
}

.form-group .form-input {
    font-size: 20px;
    line-height: 25px;
    font-weight: 400;
    color: black;
    width: 100%;
    height: 50px;
    padding-top: 20px;
    padding-left: 20px;
    padding-right: 20px;
    border: 1px solid #edeff2;
    border-radius: 3px;
}

.form-group.fl_icon .form-input {
    padding-left: 70px;
}

.form-group textarea.form-input {
    height: 150px;
}

</style>

</head>

<body style="margin-top: 0px;">
<div class="bg"></div>
<div class="bg bg2"></div>
<div class="bg bg3"></div>
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
<div class="jumbotron-fluid p-3 p-md-5 rounded bg-white">
          <h1 class="display-4 font-italic"><i><b><%=post.postTitle %></b></i></h1>
          <br>
          <p class="lead my-3 text-right"><%=post.postDate %></p>
          <p class="Lead my-3 text-left"><%=post.postAuthor %></p>
          
          <p class="lead my-3"><%=post.postContent %></p>
        <br>
        <br>
        <a href="DeleteServlet?deletePostID=<%=post.postID%>" id="postDelete" onclick="return confirm('Are you sure?')" class="btn btn-lg btn-danger" style="display: none;">Delete</a>
        <a href="Update.jsp?updateId=<%=post.postID%>" id="postUpdate" class="btn btn-lg btn-success" style="display: none;">Update</a>
      </div>
      </div>
      

      
<script type="text/javascript">
 
button1 = document.getElementById("postUpdate");
button2 = document.getElementById("postDelete");
if( "<%=user.userName%>" === "<%=post.postAuthor%>" | "<%=user.userRole%>" === "superUser"){
	button1.style.display = "inline";
	button2.style.display = "inline"; 
}

</script>
      
 
      
<!-- Comment Box and Comments -->
<br>
<div class="container">
<div class="jumbotron bg-secondary">
<div class="be-comment-block">
	<h1 class="comments-title">Comments</h1>
	
	
	<% for(Reply rp : replies){ %>
	<!-- Comments  -->
	<div class="be-comment-content font-weight-bold">
			<span class="be-comment-name">
				<a href="MyPost.jsp?Id=<%=rp.replyUserId%>" class="nav-link text-white ">@ <%=rp.replyAuthor %></a>
			</span>
			<span class="text-white be-comment-time">
				<i class="fa fa-clock-o"></i>
				<%=rp.replyDate %>
			</span>
			<p class="be-comment-text">
				<%=rp.replyContent %>
			</p>
	</div>
	<br>
	<!-- Comments -->
	<%} %>
	
	
	<br>
	
	<form class="form-block" action="ReplyServlet" method="post">
		<div class="row">
			<div class="col-xs-12">									
				<div class="form-group">
					<textarea class="form-input" name="txtComment" placeholder="Type your comment (300 characters only)"></textarea>
				</div>
			</div>
			<div>
			<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</div>
	</form>
</div>
</div>
</div>

<!-- Comment Box and Comment -->




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