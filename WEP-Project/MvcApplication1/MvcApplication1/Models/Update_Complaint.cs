using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
    public class Update_Complaint
    {

        

        public void update_complaints(String ccid, String fname, String lname, String phone, String address, String category, String cattype, String desc, String lat, String lng)
        {
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString);
            SqlCommand Update_Complaints = new SqlCommand("Update Complaints Set fname = '" + fname + "', lname = '" + lname + "', phone = '" + phone + "', date = GETDATE(), address = '" + address + "', category = '" + category + "', type = '" + cattype + "', description = '" + desc + "', latitude = '" + lat + "', longitude = '" + lng + "'  where cid = '" + ccid + "' ", Con);

            Con.Open();
            Update_Complaints.ExecuteNonQuery();
            Con.Close();
            

        }
    }
}