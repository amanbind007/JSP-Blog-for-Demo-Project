<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% %>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" ></script>
<!-- Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">

<meta charset="ISO-8859-1">
<title>Blog-Registration</title>
</head>
<body class="bg-dark">

<script>
if("<%=request.getParameter("error")%>" == "Error"){
	window.alert("Could'nt Register, Plase try Again");
}
</script>


<div class="container py-5">
    <div class="row">
        <div class="col-md-12">
            <div class="text-center"><h2 class="mb-5 text-light">Blog Registration Form</h2></div>
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card border-warning">
                        <div class="card-header bg-info">
                            <h3 class="mb-0 my-2">Sign Up</h3>
                        </div>
                        <div class="card-body bg-secondary text-light">
                            <form class="form" role="form" autocomplete="off" method="post" action="RegistrationServlet">
                                <div class="form-group">
                                    <label for="inputName">Username</label>
                                    <input type="text" class="form-control bg-light" name="username" placeholder="username" required>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail">Email</label>
                                    <input type="email" class="form-control bg-light" name="email" placeholder="email@gmail.com" required>
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword">Password</label>
                                    <input type="password" class="form-control bg-light" name="password" placeholder="password" title="At least 6 characters with letters and numbers" required>
                                </div>
                                <div class="form-group">
                                    <label for="inputAddress">Address</label>
                                    <input type="text" class="form-control bg-light" name="address" id="" placeholder="Address" required>
                                </div><br>
                                <div class="form-group text-center">
                                    <button type="submit" class="btn btn-primary btn-lg">Register</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--/row-->

        </div>
        <!--/col-->
    </div>
    <!--/row-->
</div>
<!--/container-->

</body>
</html>