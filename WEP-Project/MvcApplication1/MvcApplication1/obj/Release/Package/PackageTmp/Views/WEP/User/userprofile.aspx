<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
  <meta name="viewport" content="width=device-width" />
  <title>User Profile</title>
  <meta charset='utf-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <link rel="icon" type="image/x-icon" href="../../../Content/assets/img/mapicon.png" />

  <!-- Latest compiled and minified CSS -->
  <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
  <!-- Google fonts-->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
  <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Latest compiled JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

  <link href="../../../Content/css/userprofile.css" rel="stylesheet" type="text/css" />

  

  <script runat="server">
    public string msg { get; set; }

    //Fuction to Decrypt Password
    public string decryptpass(String pass)
    {
        byte[] b;
        string decrypted;

        try
        {
            b = Convert.FromBase64String(pass);
            decrypted = System.Text.ASCIIEncoding.ASCII.GetString(b);
        }
        catch (FormatException fe)
        {
            decrypted = "";
        }
        return decrypted;
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
      System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString);
      System.Data.SqlClient.SqlCommand profile = new System.Data.SqlClient.SqlCommand("Select * from SignUp where Id = '" + Session["ID"].ToString() + "' ", Con);
      System.Data.SqlClient.SqlDataReader myReader = null;
      //System.Data.SqlClient.SqlCommand myCommand = new System.Data.SqlClient.SqlCommand("select * from SignUp where Id = '" + Session["ID"].ToString() + "' ", Con);
      
      Con.Open();

      session_id.Value = Session["ID"].ToString();
      //session_name.InnerText = name.ExecuteScalar().ToString();
      myReader = profile.ExecuteReader();
      
      while (myReader.Read())
      {
        fname.Value = (myReader["Name"].ToString());
        session_name.InnerText = ("  " + myReader["Name"].ToString());
        email.Value = (myReader["Email"].ToString());
        uname.Value = (myReader["Username"].ToString());
        mobile.Value = (myReader["Mobile"].ToString());
        oldpswd.Value = decryptpass(myReader["Password"].ToString());
      }
      Con.Close();

      this.msg = ViewBag.Msg;
      
      if(this.msg == "Success")
      {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "alert('Data Updated Successfuly')", true);
      }
      else if(this.msg == "Error")
      {
          Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "alert('Data Not Updated')", true);
          return;
      }

    }
      
  </script>


</head>
<body>

  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href='<%= Url.Action("Index", "WEP") %>'><img src="../../../Content/assets/img/mapicon.png" alt="Icon" width="30" height="30" />
        <span class="logo">WEP</span>
      </a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
        aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">

        <i class="fas fa-bars ms-1"></i>
      </button>


      <div class="nav navbar collapse navbar-collapse" id="navbarResponsive">
        <div class="navbar-nav text-uppercase ms-auto py-4 py-md-0">

          <div class="dropdown">
            <a href="#" class="d-flex align-items-center text-white text-decoration-none mx-3 dropdown-toggle" id="dropdownUser1"
              data-bs-toggle="dropdown" aria-expanded="false">
              Dashboard  
            </a>

              <ul class="dropdown-menu dropdown-menu-dark text-small shadow">

              <li><a class="dropdown-item" href='<%= Url.Action("view_complaintpage", "WEP") %>'>View Complaint</a></li>

              <li><a class="dropdown-item" href='<%= Url.Action("complaintpage", "WEP") %>'>Register Complaint</a></li>
            </ul>
          </div>

          <div class="dropdown">
            <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle mx-3"
              id="session_name"  runat="server" data-bs-toggle="dropdown" aria-expanded="false">  
                My Profile
            </a>
            <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
              <li><a class="dropdown-item" href='<%= Url.Action("logout", "WEP") %>'>Sign out</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </nav>

  <!--Header-->
  <div class="mainform">
      
    <div class="header text-center">
      <h1>User Profile</h1>
    </div>

    <form runat="server" id="Userprofile" name="Userprofile">
      
      <div class="row">

        <div class="col-sm-6" style="display:none">
          <div class="form-group">
            <label for="ID" class="form-label">ID:</label>
            <input type="text" class="form-control" placeholder="ID" name="session_id" id="session_id" runat="server" >
          </div>
        </div>

        <div class="col-sm-6">
          <div class="form-group">
            <label for="fname" class="form-label">Full Name:</label>
            <input type="text" class="form-control" placeholder="Enter Full Name" name="fname" id="fname" runat="server">
          </div>
        </div>

          <div class="col-sm-6">
          <div class="form-group">
            <label for="email" class="form-label">Email:</label>
            <input type="text" class="form-control" id="email" placeholder="Enter Email" name="email" runat="server">
          </div>
        </div>

      </div>

      <div class="row">

        

        <div class="col-sm-6">
          <div class="form-group">
            <label for="uname" class="form-label">Username:</label>
            <input type="text" class="form-control" id="uname" placeholder="Enter Username" name="uname" runat="server" pattern = "[A-Za-z]{4,10}[#!@$%^&*-_]?[0-9]{1,5}" title="Please Enter in format Abcd@123 Or abcd@123" readonly>
          </div>
        </div>

          <div class="col-sm-6">
          <div class="form-group">
            <label for="mobile" class="form-label">Mobile Number:</label>
            <input type="text" id="mobile" class="form-control" placeholder="Enter Mobile Number" name="mobile" runat="server">
          </div>
        </div>

      </div>


      <div class="row">

        <div class="col-sm-6" style="display:none">
          <div class="form-group">
            <label for="pswd" class="form-label">Old Password:</label>
            <input type="text" id="oldpswd" class="form-control" placeholder="Enter Password" name="oldpswd" runat="server" >
          </div>
        </div>

      </div>


      <div class="row">

        <div class="col-sm-6">
          <div class="form-group">
            <label for="pswd" class="form-label">New Password:</label>
            <input type="text" id="npswd" class="form-control" placeholder="Enter Password" name="npswd" runat="server" pattern = "([A-Za-z0-9]{1,}[#!@$%^&*-]?[0-9]*){8,}" title="Please Enter in format Jhon@2121">
              <div class="valid-feedback">Valid.</div>
              <div class="invalid-feedback">Please fill out this field.</div>
          </div>
        </div>

        <div class="col-sm-6">
          <div class="form-group">
            <label for="repswd" class="form-label">Confirm-Password: </label>
            <input type="text" id="repswd" class="form-control" placeholder="Confirm-Password" name="repswd" onkeyup="check(event)" runat="server" pattern = "([A-Za-z0-9]{1,}[#!@$%^&*-]?[0-9]*){8,}" title="Please Enter in format Jhon@2121">
          </div>
          <div id="error" style="display: none;">Password Does not Match</div>
          <div id="success" style="display: none;">Password Match</div>
          <div id="oldmatch" style="display: none;">Password Match With Old Password</div>
        </div>

      </div>


      <br>

      <!--Submit Button-->
      <div class="justify-content-center">
        <button type="submit" class="btn btn-primary" id="submitbtn">Update</button> 
      </div>

    </form>

  </div>

  <!-- Footer-->
  <footer class="footer py-4">
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
