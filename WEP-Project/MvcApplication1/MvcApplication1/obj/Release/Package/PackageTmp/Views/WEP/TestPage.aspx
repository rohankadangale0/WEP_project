<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Test Page</title>

    <script runat="server"> 
        public string msg { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.msg = ViewBag.Msg;
            System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString);

            System.Data.SqlClient.SqlCommand mapdetails = new System.Data.SqlClient.SqlCommand("Select date from Complaints where cid = '1' ", Con);
            
            System.Data.SqlClient.SqlDataReader myReader = null;
            
            Con.Open();
            

            myReader = mapdetails.ExecuteReader();

            while (myReader.Read())
            {

                date.Value = myReader["date"].ToString();
               
            }
            Con.Close();

            
        }
    </script>

    <style>
        #map
        {
            width: 600px;
            height: 300px;
        }
    </style>

</head>
<body>
    <form runat="server" id="Test">

    <div class= "mainform">
        <h1>Test View</h1>
      <br>

        <div id="map"></div>

      <br>

      <div class="form-group" >
        <label for="Date "> <b>Date:</b> </label>
        <input type="text" id="date" class="form-control" placeholder="Longitude" name="date" runat="server">
      </div>

    </div>
    </form>

    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcce1AuC1M6eQzH6bO7RilsumcaAV5Zw0&callback=initMap"></script>
     
    <script src="../../Script/DateTest.js"></script>

</body>
</html>
