using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace MvcApplication1.Models
{
    public class Login_Details
    {
        public String Msg { get; set; }
        public String Session_Id { get; set; }
        public String Session_Name { get; set; }

        //Function To ENCRYPT the Password
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
            SqlCommand Login_username = new SqlCommand("Select count(Username) from SignUp where Username = '"+ uname+"' ", Con);
            SqlCommand Login_password = new SqlCommand("Select count(Password) from SignUp where Username = '" + uname + "' AND Password = '" + encrptpass + "' ", Con);
            SqlCommand Login_Id = new SqlCommand("Select Id from SignUp where Username = '" + uname + "' AND Password = '" + encrptpass + "' ", Con);
            SqlCommand Username = new SqlCommand("Select Name from SignUp where Username = '" + uname + "' AND Password = '" + encrptpass + "' ", Con);

           
            
            Con.Open();
            int check_login = Convert.ToInt32(Login_username.ExecuteScalar().ToString());
            int check_pass = Convert.ToInt32(Login_password.ExecuteScalar().ToString());
            //int Sessn_Id = Convert.ToInt32(Login_Id.ExecuteScalar().ToString());
            //int sid = Convert.ToInt32(Login_Id.ExecuteScalar().ToString());
            // Console.WriteLine(check_login);
            Con.Close();

            // if(check_login == 1 && check_pass == 1)
            // {
            //     Msg = "Successful";
            // }
            // else if(check_login == 1 && check_pass == 0)
            // {
            //     Msg = "Pass_Error";
            //     return;
            // }
            // else
            // {
            //     Msg = "Failed";
            //     return;
            // }

           
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