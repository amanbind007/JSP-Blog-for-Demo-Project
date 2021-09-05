<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  
    <style>
      ::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
      	color: white;
        opacity: 1; /* Firefox */
	}
    </style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login | Discussion Blog</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/sign-in/">

    <!-- Bootstrap core CSS -->
    <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="https://getbootstrap.com/docs/4.0/examples/sign-in/signin.css" rel="stylesheet">
  </head>

  <body class="text-center bg-dark text-white">
    <form class="form-signin" action="LoginServlet" method="post" autocomplete="off">
    <script>
    if ( "<%=request.getParameter("invalid")%>" == "Invalid" ) {
    	window.alert("Invalid Email or Password");
    }
    if ( "<%=request.getParameter("log")%>" == "out" ) {
    	window.alert("Successfully Logged Out");
    }
   	    
	</script>
    
      <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
      <label for="inputEmail" class="sr-only">Email address</label>
      <input type="email" name="uemail" class="form-control" placeholder="Email address" required>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" name="upass" class="form-control" placeholder="Password" required>
      <div class="checkbox mb-3">
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      <br>
      New to my Blog?
      <a href="Registration.jsp" class="text-primary">Join now</a>
    </form>
    
  </body>
</html>
    