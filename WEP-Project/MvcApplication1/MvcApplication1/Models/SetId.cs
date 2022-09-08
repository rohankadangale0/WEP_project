using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
    public class SetId
    {
        public String Msg { get; set; }
        public String Setted_Id { get; set; }
        public void setid(String id)
        {
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString);
            SqlCommand set_id = new SqlCommand("Insert into GetComplaintID Values (' " + id + "')", Con);

            Con.Open();
            set_id.ExecuteNonQuery();
            Setted_Id = id;
            Msg = "Success";
            Con.Close();
        }
    }
}