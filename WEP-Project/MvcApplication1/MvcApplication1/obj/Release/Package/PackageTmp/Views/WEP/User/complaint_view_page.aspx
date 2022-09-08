<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>


<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>View Complaint Page</title>
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

    <link href="../../../Content/css/view_complaintpage.css" rel="stylesheet">

    <script runat="server">
        public string msg { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.msg = ViewBag.Msg;
            System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString);
            System.Data.SqlClient.SqlCommand name = new System.Data.SqlClient.SqlCommand("Select Name from SignUp where Id = '" + Session["ID"].ToString() + "' ", Con);
            Con.Open();
            session_name.InnerText = "Welcome‎ ‎ " + name.ExecuteScalar().ToString();
            ssn_id.Value = Session["ID"].ToString();
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

            if (!IsPostBack)
            {

                using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString))
                {
                    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(" Select * from Complaints WHERE uid='" + Session["ID"].ToString() + "';", con);
                    //     cmd.CommandType = CommandType.TableDirect;
                    con.Open();
                    DataList1.DataSource = cmd.ExecuteReader();
                    DataList1.DataBind();
                    con.Close();
                }

            }
        }

    </script>

   <style>
       #map
       {
           width:  -webkit-fill-available;
           height: 20rem;
       }
   </style>

</head>
<body class="bg">

    <form runat="server" id="view_complaint_page" name="view_complaint_page">
        <input type="text" id="ssn_id" name="ssn_id"  runat="server" hidden/>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <div class="container-fluid">

            <a class="navbar-brand" href='<%= Url.Action("Index", "WEP") %>'>
                <img src="../../../Content/assets/img/mapicon.png" alt="Logo" style="width:60px" />
                <span class="logo">WEP</span>
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                
                <i class="fas fa-bars ms-1"></i>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <div class="navbar-nav text-uppercase ms-auto py-4 py-md-0">
                    <div class="dropdown">
                        <a href="#"
                            class="d-flex align-items-center text-white text-decoration-none dropdown-toggle mx-3"
                            id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                            My Dashboard
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                            <li><a class="dropdown-item" href='<%= Url.Action("complaintpage", "WEP") %>'>Add Register Complaint</a></li>
                        </ul>
                    </div>

                    <div class="dropdown">
                        <a href="#"
                            class="d-flex align-items-center text-white text-decoration-none dropdown-toggle mx-3"
                            id="session_name" data-bs-toggle="dropdown" aria-expanded="false" runat="server">
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


    <div class="container p-5 text-center">
        <h2>USERS VIEW COMPLAINT</h2>
        
    </div>

    
    <div class="table-responsive" style=" margin:20px">
        <asp:DataList ID="DataList1" runat="server" >
                            
                <HeaderTemplate>
                     <table class="table table-hover table align-middle mb-0 bg-white text-center ">
                
                    <thead class="table table-striped ">
                        <tr class="table-success table-striped">
                            <th class="px-4">COMPLAINT ID</th>
                            <th class="px-4">FIRST NAME</th>
                            <th class="px-5">LAST NAME</th>
                            <th class="px-4">MOBILE NO</th>
                            <th class="px-5">DATE</th>
                            <th class="px-4">ADDRESS</th>
                            <th class="px-4">COMPLAINT CATERGORY</th>
                            <th class="px-4">COMPLAINT TYPE</th>
                            <th class="px-4">COMPLAINT DETAILS</th>
                            <th class="px-5">LATITUDE</th>
                            <th class="px-5">LONGITUDE</th>
                            <th class="px-4">MAP LOCATION</th>
                            <th class="px-4">EDIT</th>
                            <th class="px-4">DELETE</th>
                        </tr>
                    </thead>
                         </HeaderTemplate>
                     <ItemTemplate>
                    <tbody>

                        <tr>
                            <td>
                                <p class="fw-normal mb-1"><%#Eval("cid") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1"><%#Eval("fname") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1"><%#Eval("lname") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1"><%#Eval("phone") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1"><%#Eval("date") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1 col-sm"><%#Eval("address") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1"><%#Eval("category") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1"><%#Eval("type") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1"><%#Eval("description") %></p>
                            </td>

                            <td>
                                <span class="fw-normal mb-1"><%#Eval("latitude") %></span>
                            </td>

                            <td>
                                <span class="fw-normal mb-1"><%#Eval("longitude") %></span>
                            </td>
                            <td>
                                <button  class="btn btn-link btn-sm btn-rounded" type="submit" name="mapid" id="mapid" value='<%#Eval("cid")%>' > VIEW ON MAP </button>
                                </td>
                             <td>
                               <!-- <input type="text" id="complaintid" value='<%#Eval("cid") %>'/> -->
                                <button  class="btn btn-link btn-sm btn-rounded" type="submit" name="updateid" id="updateid" value='<%#Eval("cid")%>' > EDIT </button> 
                           
                            </td>
                            <td>
                           <!--     <a href='<%= Url.Action("", "WEP") %>'>Delete</a>  -->

                                <button  class="btn btn-link btn-sm btn-rounded" type="submit" name="deleteid" id="deleteid" value='<%#Eval("cid")%>' > Delete </button> 
                            </td>
                        </tr>
                         </tbody>
                            </ItemTemplate>
                            <FooterTemplate>
                </table>
                                </FooterTemplate>
            
                       
                        </asp:DataList>
        </div> 

    </form>

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

    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcce1AuC1M6eQzH6bO7RilsumcaAV5Zw0&callback=initMap"></script>

    <script src="../../../Script/ViewComplaint.js"></script>
</body>
</html>
