using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
    public class Delete_User
    {
        public String Msg { get; set; }
        public void DeleteUser(String deleteid)
        {
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString);
            SqlCommand Del_Complanint = new SqlCommand("Delete From Signup where id = '" + deleteid + "' ", Con);
            SqlCommand delete_cid = new System.Data.SqlClient.SqlCommand("Delete from GetComplaintID ", Con);

            Con.Open();
            Del_Complanint.ExecuteNonQuery();
            Msg = "Success";
            Con.Close();

            Con.Open();
            delete_cid.ExecuteNonQuery();
            Con.Close();
        }
    }
}