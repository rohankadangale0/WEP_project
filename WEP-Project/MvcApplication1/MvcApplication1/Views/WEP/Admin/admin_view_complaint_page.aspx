<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Admin View Complaint Page</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!--<link rel='stylesheet' type='text/css' media='screen' href='main.css'>-->
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
            System.Data.SqlClient.SqlCommand name = new System.Data.SqlClient.SqlCommand("Select Name from Admin where Id = '" + Session["AdminID"].ToString() + "' ", Con);
            
            Con.Open();
            session_name.InnerText = "‎ ‎‎ ‎‎ ‎‎ ‎‎ ‎‎ ‎" + name.ExecuteScalar().ToString();
            admnid.Value = Session["AdminID"].ToString();
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
                    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(" Select * from Complaints ", con);
                    //     cmd.CommandType = CommandType.TableDirect;
                    con.Open();
                    DataList1.DataSource = cmd.ExecuteReader();
                    DataList1.DataBind();
                    con.Close();
                }

            }
        }
        
    </script>
</head>
<body>
    <form runat="server" id="admin_view_complaint_page" name="admin_view_complaint_page">

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
                            <li><a class="dropdown-item" href='<%= Url.Action("admin_dashboard_page", "WEP") %>'>DashBoard</a></li>
                        </ul>
                    </div>

                    <div class="dropdown">
                        <a href="#"
                            class="d-flex align-items-center text-white text-decoration-none dropdown-toggle mx-3"
                            id="session_name" data-bs-toggle="dropdown" aria-expanded="false" runat="server">
                            My Profile
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark text-small shadow mx-3">
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


    <div class="container p-5 text-center">
        <h2>ADMIN VIEW COMPLAINT</h2>
    </div>

        <input type="text" id="admnid" runat="server" hidden/>

        <div class="container-fluid py-3">                        
            <label for="ID" class="form-label">SEARCH:</label>
            <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by Category" title="Type in a Category">
        </div>

        
    

    <div class="table-responsive" style="margin:10px">

               
                        <asp:DataList ID="DataList1" runat="server" >
                            
                <HeaderTemplate>
                     <table class="table table-hover table align-middle mb-0 bg-white text-center " id="myTable">
                
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
                                <p class="fw-normal mb-1" id="fname" runat="server"><%#Eval("fname") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1" id="lname" runat="server"><%#Eval("lname") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1" id="phone" runat="server"><%#Eval("phone") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1" id="date" runat="server"><%#Eval("date") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1 col-sm" id="address" runat="server"><%#Eval("address") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1" id="category" runat="server"><%#Eval("category") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1" id="type" runat="server" > <%#Eval("type") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1" id="description" runat="server"><%#Eval("description") %></p>
                            </td>

                            <td>
                                <span class="fw-normal mb-1" id="latitude" runat="server"><%#Eval("latitude") %></span>
                            </td>

                            <td>
                                <span class="fw-normal mb-1" id="longitude" runat="server"><%#Eval("longitude") %></span>
                            </td>
                            <td>
                                <button  class="btn btn-link btn-sm btn-rounded" type="submit" name="mapid" id="mapid" value='<%#Eval("cid")%>' > VIEW ON MAP </button>
                        </tr>
                         </tbody>
                            </ItemTemplate>

                            <FooterTemplate>
                        </table>
                                </FooterTemplate>
            
                        </asp:DataList>
    </div>


      <!--Submit Button-->
      <button type="submit" class="btn btn-outline-primary mx-3"> NOTIFY DEPARTMENT </button>

      

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

     <script>

        function myFunction()
        {
            var input, filter, table, tr, td, i;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++)
            {
                td = tr[i].getElementsByTagName("td")[6];
                if (td)
                {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1)
                    {
                        tr[i].style.display = "";


                    } else
                    {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
     </script>

</body>
</html>
