<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>VIEW MAP</title>
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

    <link href="../../../Content/css/map.css" rel="stylesheet" type="text/css" />

    <script runat="server">
        public string msg { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.msg = ViewBag.Msg;
            System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString);
            System.Data.SqlClient.SqlCommand name = new System.Data.SqlClient.SqlCommand("Select Name from SignUp where Id = '" + Session["ID"].ToString() + "' ", Con);
            System.Data.SqlClient.SqlCommand mapdetails = new System.Data.SqlClient.SqlCommand("Select category,latitude,longitude,date from Complaints where cid = '" + Session["Complaint_Id"] + "' ", Con);
            System.Data.SqlClient.SqlCommand delete_cid = new System.Data.SqlClient.SqlCommand("Delete from GetComplaintID ", Con);
            System.Data.SqlClient.SqlDataReader myReader = null;
            
            Con.Open();
            session_name.InnerText = "‎‎ ‎‎‎‎‎ ‎‎‎ ‎‎‎‎‎ ‎‎‎ ‎‎‎‎‎ ‎‎‎ ‎‎‎‎‎ ‎‎‎ ‎‎‎‎‎ ‎ ‎‎ ‎‎‎‎‎ ‎‎‎ ‎‎‎‎‎ ‎‎‎ ‎‎‎‎‎ ‎‎‎ ‎‎‎‎‎ ‎‎‎ ‎‎‎‎‎ ‎‎‎ ‎‎‎‎‎ ‎" + name.ExecuteScalar().ToString();

            myReader = mapdetails.ExecuteReader();

            while (myReader.Read())
            {

                category.Value = myReader["category"].ToString();
                lat.Value = myReader["latitude"].ToString();
                lng.Value = myReader["longitude"].ToString();
                date.Value = myReader["date"].ToString();
    
            }
            Con.Close();

            Con.Open();
            delete_cid.ExecuteNonQuery();
            Con.Close();
        }
    </script>

</head>
<body>

    <form runat="server" id="VIEWMAP">

      <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href='<%= Url.Action("Index", "WEP") %>'><img src="../../../Content/assets/img/mapicon.png" alt="..." width="30" height="30"/> <span class="logo">WEP</span></a>
      <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <div class="navbar-nav text-uppercase ms-auto py-4 py-md-0">

            <div class="navbar-nav text-uppercase ms-auto py-4 py-md-0">
                    <div class="dropdown">
                        <a href="#"
                            class="d-flex align-items-center text-white text-decoration-none dropdown-toggle mx-3"
                            id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                            My Dashboard
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                            <li><a class="dropdown-item" href='<%= Url.Action("view_complaintpage", "WEP") %>'>View Register Complaint</a></li>
                        </ul>
                    </div>

            <div class="dropdown">
                <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                    <span class="d-none d-sm-inline mx-1" id="session_name" runat="server">My Profile</span>
                </a>
                <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                    <li><a class="dropdown-item" href='<%= Url.Action("userprofilepage", "WEP") %>'>Profile</a></li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li><a class="dropdown-item" href='<%= Url.Action("logout", "WEP") %>'>Sign out</a></li>
                </ul>
            </div>  
        </div>
      </div>          
    </div>
  </nav>
      
  <div class= "mainform">
        <h1>Map View</h1>
        <br>
    <div id="map"></div>

      <br>

      <div class="form-group" hidden="hidden">
        <label for="Category"> <b>Category:</b> </label>
        <input type="text" id="category" class="form-control" placeholder="Category" name="category" runat="server">
      </div>

        <br>

       <div class="form-group" hidden="hidden">
        <label for="latitude"> <b>Latitude:</b> </label>
        <input type="text" id="lat" class="form-control" placeholder="Latitude" name="lat" runat="server">
      </div>

      <br>

      <div class="form-group" hidden="hidden">
        <label for="longitude "> <b>Longitude:</b> </label>
        <input type="text" id="lng" class="form-control" placeholder="Longitude" name="lng" runat="server">
      </div>

     <br>

      <div class="form-group" hidden="hidden">
        <label for="Date "> <b>Date:</b> </label>
        <input type="text" id="date" class="form-control" placeholder="Date" name="date" runat="server">
      </div>
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

    </form>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcce1AuC1M6eQzH6bO7RilsumcaAV5Zw0&callback=initMap"></script>
    
  <script src="../../../Script/MapView.js"></script>

</body>
</html>
