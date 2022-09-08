<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
      <title>Forgot Password</title>
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
        else if (this.Msg == "Email_Error")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "alert('Email is not Registered, Kindly Click On SignUp to Create an Account');", true);
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
              <h2>FORGOT PASSWORD</h2>
  
                <form runat="server" name="Forgot_Password" id="Forgot_Password" class="was-validated">

                <div class="mb-3 mt-3">
                  <label for="uname" class="form-label">UserName:</label>
                  <input type="text" class="form-control" id="uname" placeholder="Enter UserName" name="uname" pattern = "[A-Za-z]{4,10}[#!@$%^&*-_]?[0-9]{1,5}" title = "Please Enter in format Abcd@123 Or abcd@123" required>
                  <div class="valid-feedback">Valid.</div>
                  <div class="invalid-feedback">Please fill out this field.</div>
                </div>

                <div class="mb-3 mt-3">
                  <label for="Email" class="form-label">Email:</label>
                  <input type="text" class="form-control" id="email" placeholder="Enter Email" name="email" pattern = "[A-Za-z]*[.]?[a-z0-9]*[@][a-z]{3,7}[.][a-z.]{3,5}" title="Please Enter in format abcd@gmail.com OR abcd.123@gmail.co.in" required>
                  <div class="valid-feedback">Valid.</div>
                  <div class="invalid-feedback">Please fill out this field.</div>
                </div>

                <!--
                <div class="mb-3">
                  <label for="newpwd" class="form-label">New Password:</label>
                  <input type="password" class="form-control" id="npswd" placeholder="Enter password" name="npswd" pattern = "([A-Za-z0-9]{1,}[#!@$%^&*-]?[0-9]*){8,}" title="Please Enter in format Jhon@2121" required>
                  <div class="valid-feedback">Valid.</div>
                  <div class="invalid-feedback">Please fill out this field.</div>
                </div>

                <div class="mb-3">
                  <label for="cpwd" class="form-label">Confirm Password:</label>
                  <input type="text" class="form-control" id="cpswd" placeholder="Enter password" name="repswd" onkeyup="check(event)" pattern = "([A-Za-z0-9]{1,}[#!@$%^&*-]?[0-9]*){8,}" title="Please Enter in format Jhon@2121" required>
                  <div class="valid-feedback">Valid.</div>
                  <div class="invalid-feedback">Please fill out this field.</div>
                  <div id="error" style="display: none;">Password Does not Match</div>
                  <div id="success" style="display: none;">Password Match</div>
                </div>
                    -->

               <label for="caution" class="form-label" style="color:yellow"><b>Note:</b> Please check you Mail for New Password. <br />And Don't forget to change the password in your Profile.</label>

                
              <button type="submit" class="btn btn-danger">Submit</button>
                   
              <p class="mt-3">Don't have an account?  <a href='<%= Url.Action("signuppage", "WEP") %>'>SignUp</a></p>

              <p>Already have an account? <a href='<%= Url.Action("loginpage", "WEP") %>'>Login</a></p>
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

      <script src="../../../Script/userprofile.js"></script>
</body>
</html>
