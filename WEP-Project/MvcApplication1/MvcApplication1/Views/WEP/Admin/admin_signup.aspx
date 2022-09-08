<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Admin Signup</title>
     <link rel="icon" type="image/x-icon" href="../../../Content/assets/img/mapicon.png" />
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
      <link href="../../../Content/css/sign_in_up.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
         <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
          <div class="container">
              <a class="navbar-brand" href='<%= Url.Action("Index", "WEP") %>'><img src="../../../Content/assets/img/mapicon.png" alt="..." /> <span class="logo">WEP</span></a>
             
          </div>
        </nav>

        <div class="container p-5 bg-dark">
          <h2> ADMIN SIGN UP</h2>
            <form runat="server" name="admin_signup_page" id="admin_signup_page" class="was-validated">
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name" required>
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
              </div>
            <div class="mb-3 mt-3">
              <label for="email" class="form-label">Email:</label>
              <input type="text" class="form-control" id="email" placeholder="Enter Email" name="email" pattern = "[A-Za-z]*[.]?[a-z0-9]*[@][a-z]{3,7}[.][a-z.]{3,5}" title="Please Enter in format abcd@gmail.com OR abcd.123@gmail.co.in" required>
              <div class="valid-feedback">Valid.</div>
              <div class="invalid-feedback">Please fill out this field.</div>
            </div>
    
            <div class="mb-3 mt-3">
                <label for="email" class="form-label">Username:</label>
                <input type="text" class="form-control" id="uname" placeholder="Enter Username" name="uname" pattern = "[A-Za-z]{4,10}[#!@$%^&*-_]?[0-9]{1,5}" title="Please Enter in format Abcd@123 Or abcd@123" required>
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field. Enter in format Abcd@123 abcd@123 or abcd123</div>
              </div>
              <div class="mb-3">
                <label for="pwd" class="form-label">Password:</label>
                <input type="password" class="form-control" id="pswd" placeholder="Enter password" name="pswd" pattern = "([A-Za-z0-9]{1,}[#!@$%^&*-]?[0-9]*){8,}" title="Please Enter in format Jhon@2121" required>
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field. Password Should me minimum 8 characters long.</div>
              </div>
              <div class="mb-3 mt-3">
                <label for="email" class="form-label">Mobile:</label>
                <input type="text" class="form-control" id="mobile" placeholder="Enter Mobile" name="mobile" pattern ="[0-9]{10}" title="Please Enter 10 Digits Number" required>
                <div class="valid-feedback" >Valid.</div>
                <div class="invalid-feedback" id="phone_error">Please fill out this field.</div>
              </div>
    
          <button type="submit" class="btn btn-danger">Sign Up</button>

          <p>Have a account already? <a href='<%= Url.Action("admin_loginpage", "WEP") %>'>Log in</a></p>
        </form>
        </div>

        <!-- Footer-->
        <footer class="footer py-4">
          <div class="container">
              <div class="row align-items-center">
                  <div class="d-flex justify-content-center">Copyright &copy; <a class="link-dark text-decoration-none me-3" href="https://wepportal.somee.com"> www.wepportal.somee.com </a> </div>
                  
                  <div class="d-flex justify-content-center">
                      <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                      <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
                  </div>
              </div>
          </div>
        </footer>

        
</body>
</html>
