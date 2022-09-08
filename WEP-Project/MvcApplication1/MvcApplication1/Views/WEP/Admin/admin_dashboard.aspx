<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Admin Dashboard</title>
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


    <style>
        p,h2
        {
            color: black;
        }

        .cards
        {
            transition: all 0.2s ease;
            cursor: pointer;
            border-radius: 15px;
            opacity: 0.9;
        }

        .cards:hover
        {
            box-shadow: 5px 6px 2px #e9ecef;
            transform: scale(1.1);
            opacity: 1;
        }
    </style>

    <script runat="server">
        public string msg { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.msg = ViewBag.Msg;
            System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString);
            System.Data.SqlClient.SqlCommand name = new System.Data.SqlClient.SqlCommand("Select Name from admin where Id = '" + Session["AdminID"].ToString() + "' ", Con);
            System.Data.SqlClient.SqlCommand complaints_count = new System.Data.SqlClient.SqlCommand("Select count(category) from Complaints ", Con);
            System.Data.SqlClient.SqlCommand users_count = new System.Data.SqlClient.SqlCommand("Select count(Username) from SignUp ", Con);
            
            Con.Open();
            session_name.InnerText = "Welcome‎ ‎ " + name.ExecuteScalar().ToString();
            TotalComplaints.InnerText = complaints_count.ExecuteScalar().ToString();
            TotalUsers.InnerText = users_count.ExecuteScalar().ToString();
            Con.Close();
            
            if (this.msg == "Success")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "alert('Success')", true);
            }
        }
    </script>

</head>
<body>
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark" id="mainNav">
        <div class="container-fluid">
            <a class="navbar-brand" href="#page-top"><img src="../../../Content/assets/img/mapicon.png" alt="Logo" width="30" height="30"/> 
                <span class="logo">WEP</span></a>


                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    
                    <i class="fa fa-bars ms-1"></i>
                </button>

          <div class="nav navbar collapse navbar-collapse" id="navbarResponsive">
            <div class="navbar-nav text-uppercase ms-auto py-4 py-md-0">
                

                <div class="dropdown">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle mx-3" id="session_name" data-bs-toggle="dropdown" aria-expanded="false" runat="server">
                        My Profile
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                        <li><a class="dropdown-item" href='<%= Url.Action("adminprofilepage", "WEP") %>'>Profile</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href='<%= Url.Action("adminlogout", "WEP") %>'>Sign out</a></li>
                    </ul>
                </div>  
            </div>
          </div>          
        </div>
    </nav>
     
    <!-- Footer-->

    <section class="container-fluid pt-5  overflow-hidden">
        
        <div class="row gy-5 justify-content-center">

            <div class="col-xxl-3 col-xl-3 .col-lg-3 .col-md-2 mx-3 ">
                <div class="container text-center">
                    <div class="bg-warning cards">
                        <a href='<%= Url.Action("adminview_complaintpage", "WEP") %>' class="text-decoration-none">
                            <h2 id="TotalComplaints" runat="server">10</h2>
                            <p >Total Complaints</p>
                        </a>
                    </div>
                </div>     
            </div>
        
        
            <div class="col-xxl-3 col-xl-3 .col-lg-3 .col-md-2 mx-3">
                <div class="container text-center">
                    <div class="bg-success cards">
                        <a href='<%= Url.Action("adminview_userpage", "WEP") %>' class="text-decoration-none">
                            <h2 id="TotalUsers" runat="server">10</h2>
                            <p>Total User</p>
                        </a>
                    </div>
                </div>
            </div>
        
            <div class="col-xxl-3 col-xl-3 .col-lg-3 .col-md-2 mx-3">
                <div class="container text-center">
                    <div class="bg-primary cards">
                        <h2>0</h2>
                        <p>Total Solved</p>
                    </div>
                </div>     
            </div>

        </div>
    </section>


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
