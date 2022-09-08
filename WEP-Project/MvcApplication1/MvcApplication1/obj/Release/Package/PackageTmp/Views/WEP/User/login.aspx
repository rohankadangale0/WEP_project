<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
      <title>Login</title>
      <link rel="icon" type="image/x-icon" href="../../../Content/assets/img/mapicon.png" />
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
      <link href="../../../Content/css/sign_in_up.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

      <script runat="server">
        protected String Response2 { get; set; }
        protected string Msg { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            /*For Login*/
            this.Msg = ViewBag.Msg;
            if (this.Msg == "Failed")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "alert('Invalid Credintial');", true);
                return;
            }
            else if (this.Msg == "Pass_Error")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "alert('Invalid Password');", true);
                return;
            }
            else if (this.Msg == "Successful")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "alert('Login Successful'); setTimeout(3000);", true);
            }
        }
    </script>

</head>
<body>
    
    
        
          <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
              <div class="container">
                  <a class="navbar-brand" href='<%= Url.Action("Index", "WEP") %>'><img src="../../../Content/assets/img/mapicon.png" alt="..." /> <span class="logo">WEP</span></a>
                  
              </div>
            </nav>


            <div class="container p-5 bg-dark">
              <h2>LOGIN</h2>
  
                <form runat="server" name="login" id="login" class="was-validated"> 
                <div class="mb-3 mt-3">
                  <label for="uname" class="form-label">UserName:</label>
                  <input type="text" class="form-control" id="uname" placeholder="Enter UserName" name="uname" pattern = "[A-Za-z]{4,10}[#!@$%^&*-_]?[0-9]{1,5}" title = "Please Enter in format Abcd@123 Or abcd@123" required>
                  <div class="valid-feedback">Valid.</div>
                  <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="mb-3">
                  <label for="pwd" class="form-label">Password:</label>
                  <input type="password" class="form-control" id="pswd" placeholder="Enter password" name="pswd" pattern = "([#!@$%^&*=-]?[A-Za-z0-9]{1,}[#!@$%^&*-]?[0-9]*){8,}" title="Please Enter in format Jhon@2121" required>
                  <div class="valid-feedback">Valid.</div>
                  <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="form-check mb-3">
                  <input class="form-check-input" type="checkbox" id="myCheck"  name="remember">
                  <label class="form-check-label" for="myCheck">Remember Me</label>
                  <!-- <div class="valid-feedback">Valid.</div> -->
                </div>
              <button type="submit" class="btn btn-danger">Log in</button>
              <br />

              <p class="mt-3">Don't Remember Password? <a href='<%= Url.Action("forgotpassword", "WEP") %>'>Forgot Password</a></p>
              <p>Don't have an account? <a href='<%= Url.Action("signuppage", "WEP") %>'>Sign up</a></p>
            </form>
            </div>

            <!-- Footer-->
            <footer class="footer py-4" >
              <div class="container">
                  <div class="row align-items-center">
                      <div class="d-flex justify-content-center">Copyright &copy; www.wep.org</div>
                     
                      <div class="d-flex justify-content-center">
                          <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                          <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
                      </div>
                  </div>
              </div>
            </footer>
</body>
</html>
