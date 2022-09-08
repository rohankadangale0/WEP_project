using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
    public class Admin_Signup_Details
    {
        public string Msg { get; set; }

        //Function To ENCRYPT the Password
        public string encryptpass(String pass)
        {
            byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(pass);
            string encrypted = Convert.ToBase64String(b);
            return encrypted;
        }

        public void Admin_Details(String name, String email, String uname, String pswd, String mobile)
        {

            string enctpass = encryptpass(pswd);

            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString);
            SqlCommand Check_Email = new SqlCommand("Select count(Email) from admin where Email = '" + email + "' ", Con);
            SqlCommand Check_Username = new SqlCommand("Select count(Username) from admin where Username = '" + uname + "' ", Con);
            SqlCommand Registration_Details = new SqlCommand("Insert into admin values ('" + name + "', '" + email + "', '" + uname + "',  '" + enctpass + "', '" + mobile + "' );", Con);

            Con.Open();
            int Email = Convert.ToInt32(Check_Email.ExecuteScalar().ToString());
            int Uname = Convert.ToInt32(Check_Username.ExecuteScalar().ToString());
            Con.Close();

            if (Email == 1)
            {
                Msg = "Email_Exist";
                return;
            }
            else if (Uname == 1)
            {
                Msg = "Username_Exist";
                return;
            }
            else if (Email == 1 && Uname == 1)
            {
                Msg = "Email&User_Exist";
                return;
            }
            else
            {
                Con.Open();
                Registration_Details.ExecuteNonQuery();
                Con.Close();
                Msg = "Success";
            }
        }
    }
}