<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>

<head runat="server">
    

  <meta name="viewport" content="width=device-width" />
  <title>Register Complaint</title>
  <meta charset='utf-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <link rel="icon" type="image/x-icon" href="../../../Content/assets/img/mapicon.png" />
  <link href="../../../Content/css/complaint.css" rel="stylesheet">
  <!-- Latest compiled and minified CSS -->
  <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
  <!-- Google fonts-->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
  <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Latest compiled JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

  

    <script runat="server">
        public string msg { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.msg = ViewBag.Msg;
            System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString);
            System.Data.SqlClient.SqlCommand name = new System.Data.SqlClient.SqlCommand("Select Name from SignUp where Id = '" + Session["ID"].ToString() + "' ", Con);
            Con.Open();
            session_name.InnerText = "Welcome‎ ‎ " + name.ExecuteScalar().ToString();
            session_id.Value = Session["ID"].ToString();
            Con.Close();
            
            if (this.msg == "Success")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "alert('Success')", true);
            }
            else if(this.msg == "Error")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "alert('Form Not Submitted')", true);
                return;
            }
        }
    </script>

    

</head>

<body>

  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href='<%= Url.Action("Index", "WEP") %>'><img src="../../../Content/assets/img/mapicon.png" alt="Logo" width="30"
        height="30" /> <span class="logo">WEP</span>
      </a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
      aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">

        <i class="fas fa-bars ms-1"></i>
      </button>

      <div class="nav navbar collapse navbar-collapse" id="navbarResponsive">
          
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
            <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle mx-3"
              data-bs-toggle="dropdown" aria-expanded="false"  id="session_name" runat="server">
              My Profile
            </a>
            <ul class="dropdown-menu dropdown-menu-dark text-small shadow mx-3">
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

  <!--Header-->
  <div class="mainform">

    <form runat="server" id="ComplaintForm" name="ComplaintForm">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:WEPConnectionString %>' SelectCommand="SELECT * FROM [Complaints]"></asp:SqlDataSource>
      <div class="header">
        <h1><b>Register Complaint Form</b></h1>
        <p>Please send us details about the incident you would like to report. Our Complaint Center will analyze your
          complaint and take the appropriate measures
          in order that the reported situation will not occur at any other time in the future.</p>
        <hr />
      </div>


      <br><br>
      <input type="text" id="session_id" class="form-control" placeholder="Type Value" name="cattype" style="display:none" runat="server">
      <!-- Name-->

      <div class="form-group">
        <label for="fname"><b>First Name:</b></label>
        <input type="text" class="form-control" id="fname" placeholder="Enter first name" name="fname" required>
      </div>

      <br>

      <div class="form-group">
        <label for="lname"><b>Last Name:</b></label>
        <input type="text" class="form-control" id="lname" placeholder="Enter last name" name="lname" required>
      </div>

      <br>

      <!-- Phone number-->

      <div class="form-group">
        <label for="phoneNo"> <b>Phone Number: </b> </label>
        <input type="text" id="phone" class="form-control"  placeholder="Enter Phone Number" name="phone" maxlength="10" pattern ="[0-9]{10}" title="Please Enter 10 Digits Number." required>
      </div>

      <br>

      <!-- Address-->

      <div class="form-group">
        <label for="phoneNo"> <b>Address:</b> </label>
        <input type="text" id="address" class="form-control" placeholder="Enter Address" name="address" required>
      </div>

      <br>

      <!-- Select Complaint Categories-->

      <label for="Select Complaint type"><b>Select complaint</b></label>
      <select id="category" name="category" onchange="getcategory(this.value); getcolor(this.value)">
        <option value="----">----</option>
        <option value="water">Water</option>
        <option value="electricity">Electricity</option>
        <option value="road">Road</option>

      </select>

      <br>
      <br>

  
       <!-- Select Complaint Type Water-->
       
       <label for="Select Complaint type" class="whidden"><b>Select complaint type Water</b></label>
       <select id="water" name="water" class="whidden" onchange="gettypevalue(this.value)">
         <option value="----">----</option>
         <option value="Low Pressure">Low Pressure</option>
         <option value="Dirty Water">Dirty Water</option>
         <option value="No Water">No Water</option>
       </select>
 
      <br>
      <br>

      <!-- Select Complaint Type Electricity-->

      <label for="Select Complaint type" class="ehidden"><b>Select complaint type Electricity</b></label>
      <select id="electricity" name="electricity" class="ehidden" onchange="gettypevalue(this.value)">
        <option value="----">----</option>
        <option value="High Volate">High Volate</option>
        <option value="Low Volate">Low Volate</option>
        <option value="No Electricity">No Electricity</option>

      </select>

      <br>
      <br>

      <!-- Select Complaint Type Road-->

      <label for="Select Complaint type" class="rhidden"><b>Select complaint type Road</b></label>
      <select id="road" name="road" class="rhidden" onchange="gettypevalue(this.value)">
        <option value="----">----</option>
        <option value="Bad Road">Bad Road</option>
        <option value="PotHole">PotHole</option>
        <option value="Bad Shape">Bad Shape</option>
      </select>

      <br>
      <br>


      <!-- <div class="form-group" style="display:none">
        <label for="Type Value"> <b>Type Value:</b> </label>
        <input type="text" id="cattype" class="form-control" placeholder="Value" name="cattype">
      </div> -->

        <input type="text" id="cattype" class="form-control" placeholder="Type Value" name="cattype" style="display:none">

      <!-- Complaint Details-->

      <label for="Description"><b>Complaint Details:</b></label>
      <textarea id="desc" name="desc" placeholder="Enter your complaint details......."
        style="height:200px" required></textarea>
      <br>

      <!-- Selection Location-->
      <div id="mapsection">
        <label for="subject"><b>Selected Location on Map</b></label>

        <div id="map"></div>

      </div>
      <br>

      <div class="form-group">
        <label for="latitude"> <b>Latitude:</b> </label>
        <input type="text" id="lat" class="form-control" placeholder="Latitude" name="lat" readonly>
      </div>

      <br>

      <div class="form-group">
        <label for="longitude "> <b>Longitude:</b> </label>
        <input type="text" id="lng" class="form-control" placeholder="Longitude" name="lng" readonly>
      </div>

      <br>

      <!--Submit Button-->
      <button type="submit" class="btn btn-outline-primary">Submit</button>

    </form>
  </div>

  <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcce1AuC1M6eQzH6bO7RilsumcaAV5Zw0&callback=initMap"></script>

    <script src="../../../Script/OldMap.js"></script>
    <script src="../../../Script/Complaint.js"></script>
    
  

</body>

</html>
