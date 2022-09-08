using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
    public class Admin_Login
    {
        public String Msg { get; set; }
        public String Session_Id { get; set; }
        public String Session_Name { get; set; }

        
        //To ENCRYPT the Password
        public string encryptpass(String pass)
        {
            byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(pass);
            string encrypted = Convert.ToBase64String(b);
            return encrypted;
        }

        public void login(String uname, String pswd)
        {
            string encrptpass = encryptpass(pswd);

            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString);
            SqlCommand Login_username = new SqlCommand("Select count(Username) from admin where Username = '" + uname + "' ", Con);
            SqlCommand Login_password = new SqlCommand("Select count(Password) from admin where Username = '" + uname + "' AND Password = '" + encrptpass + "' ", Con);
            SqlCommand Login_Id = new SqlCommand("Select Id from admin where Username = '" + uname + "' AND Password = '" + encrptpass + "' ", Con);
            SqlCommand Username = new SqlCommand("Select Name from admin where Username = '" + uname + "' AND Password = '" + encrptpass + "' ", Con);

            Con.Open();
            int check_login = Convert.ToInt32(Login_username.ExecuteScalar().ToString());
            int check_pass = Convert.ToInt32(Login_password.ExecuteScalar().ToString());
            Con.Close();

           
            if (check_login == 1)
            {

                if (check_pass == 1)
                {

                    Con.Open();
                    int Sessn_Id = Convert.ToInt32(Login_Id.ExecuteScalar().ToString());
                    Con.Close();
                    Session_Id = Sessn_Id.ToString();
                    Session_Name = Username.ToString();
                    Msg = "Successful";
                }
                else
                {
                    Msg = "Pass_Error";
                    return;
                }
            }
            else
            {
                Msg = "Failed";
                return;
            }

        }
    }
}