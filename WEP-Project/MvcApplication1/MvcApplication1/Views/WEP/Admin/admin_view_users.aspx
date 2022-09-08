<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Admin View User Page</title>
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
            System.Data.SqlClient.SqlCommand name = new System.Data.SqlClient.SqlCommand("Select Name from admin where Id = '" + Session["AdminID"].ToString() + "' ", Con);
            Con.Open();
            session_name.InnerText = "‎‎ ‎‎‎‎‎ ‎ ‎‎ ‎‎‎‎‎ ‎ ‎‎ ‎‎‎‎‎ ‎" + name.ExecuteScalar().ToString();
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
                    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(" Select * from SignUp ", con);
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
                            <li><a class="dropdown-item" href='<%= Url.Action("admin_dashboard_page", "WEP") %>'>VIEW DASHBOARD</a></li>
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
        <h2>VIEW REGISTERED USERS</h2>
        
    
        <!-- Search-->
        <div class="container py-3">                        
            <label for="ID" class="form-label">SEARCH:</label>
            <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by Name" title="Type in a Name">
        </div>
        
         
    
    <div class="table-responsive py-5" style="margin-left:5vw">
        <asp:DataList ID="DataList1" runat="server" >
                            
                <HeaderTemplate>
                     <table class="table table-hover table align-middle mb-0 bg-white text-center " id="myTable">
                
                    <thead class="table table-striped ">
                        <tr class="table-success table-striped">
                            <th class="px-4">USER ID</th>
                            <th class="px-4">NAME</th>
                            <th class="px-4">Email</th>
                            <th class="px-4">MOBILE NO</th>
                            <th class="px-5">USERNAME</th>
                            <th class="px-4">PASSWORD</th>
                            <th class="px-4">DELETE</th>
                        </tr>
                    </thead>
                         </HeaderTemplate>
                     <ItemTemplate>
                    <tbody>

                        <tr>
                            <td>
                                <p class="fw-normal mb-1"><%#Eval("id") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1"><%#Eval("name") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1"><%#Eval("email") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1"><%#Eval("mobile") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1"><%#Eval("username") %></p>
                            </td>

                            <td>
                                <p class="fw-normal mb-1 col-sm"><%#Eval("password") %></p>
                            </td>
            
            
                            <td>

                                <button  class="btn btn-link btn-sm btn-rounded" type="submit" name="deleteid" id="deleteid" value='<%#Eval("id")%>' > Delete </button> 

                            </td>
                        </tr>
                         </tbody>
                            </ItemTemplate>
                            <FooterTemplate>
                </table>
                                </FooterTemplate>
            
                       
                        </asp:DataList>
        </div>
        </div>

    </form>

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


    <script>

        function myFunction() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";


                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>

</body>
</html>
