using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
    public class Userprofile_Update
    {
        public String Msg { get; set; }

        //Function To ENCRYPT the Password
        public string encryptpass(String pass)
        {
            byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(pass);
            string encrypted = Convert.ToBase64String(b);
            return encrypted;
        }

        public void update_details(String fname, String email, String uname, String mobile, String repswd)
        {

            bool check_pass = string.IsNullOrEmpty(repswd);
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString);
            SqlCommand get_id = new SqlCommand("Select Id from SignUp where Username='" + uname + "' ", Con);

            Con.Open();
            String ssn_id = get_id.ExecuteScalar().ToString();
            Con.Close();

            string enctpass = encryptpass(repswd);

            if (check_pass == true)
            {
                SqlCommand Update = new SqlCommand("Update SignUp set Name= '" + fname + "', Email='" + email + "' , Username='" + uname + "', Mobile='" + mobile + "' where Id= '" + ssn_id + "' ", Con);
                Con.Open();
                Update.ExecuteNonQuery();
                Con.Close();
            }
            else
            {
                SqlCommand Update = new SqlCommand("Update SignUp set Name= '" + fname + "', Email='" + email + "' , Username='" + uname + "', Mobile='" + mobile + "', Password='" + enctpass + "' where Id= '" + ssn_id + "' ", Con);
                Con.Open();
                Update.ExecuteNonQuery();
                Con.Close();
            }
            
        }

    }
}