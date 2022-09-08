using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;

namespace MvcApplication1.Models
{
    public class Forgot_Password
    {
        public String Msg { get; set; }

        //Function To ENCRYPT the Password
        public string encryptpass(String pass)
        {
            byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(pass);
            string encrypted = Convert.ToBase64String(b);
            return encrypted;
        }


        public void generate_password(String uname, String email)
        {


            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString);
            SqlCommand check_username = new SqlCommand("Select count(Username) from SignUp where Username = '" + uname + "' ", Con);
            SqlCommand check_email = new SqlCommand("Select count(Email) from SignUp where Username = '" + uname + "' AND Email = '" + email + "' ", Con);


            Con.Open();
            int verify_username = Convert.ToInt32(check_username.ExecuteScalar().ToString());
            int verify_email = Convert.ToInt32(check_email.ExecuteScalar().ToString());
            Con.Close();


            if (verify_username == 1)
            {

                if (verify_email == 1)
                {

                    //Store the password generated into a string variable
                    //The password will have a length of 8 characters and 3 non alphanumeric characters
                    string generated_pass = Membership.GeneratePassword(11, 3);
                    //Print the newly generated password to the console       
                    Console.WriteLine("Password : " + generated_pass);
                    //Console.ReadLine();

                    
                    //Encrypt Generated Password
                    string encrptpass = encryptpass(generated_pass);
                    Console.WriteLine("Encrypted Password : " + encrptpass);
                     

                    SqlCommand updated_generated_password = new SqlCommand("Update SignUp set Password = '" + encrptpass + "' where Username = '" + uname + "' AND Email = '" + email + "' ", Con);

                    Con.Open();
                    updated_generated_password.ExecuteNonQuery();
                    Con.Close();

                    //Sending Mail
                    SmtpClient client = new SmtpClient("smtp-mail.outlook.com");
                    client.Port = 587;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.UseDefaultCredentials = false;
                    System.Net.NetworkCredential credential = new System.Net.NetworkCredential("wepprojectunigoa@outlook.com", "password"); //Sender's Email and password
                    client.EnableSsl = true;
                    client.Credentials = credential;
                    MailMessage message = new MailMessage("wepprojectunigoa@outlook.com", email); // From and To Email 
                    message.Subject = "Generated Password"; //Subject of Mail
                    message.Body = "This is Auto Generated Password <b>" +  generated_pass + "</b> . Kindly Login with the Generated password, And Please Don't Forget to Update Your Password in your Profile after logging in Successfully."; //Body of Mail
                    message.IsBodyHtml = true;
                    try
                    {
                        client.Send(message);

                    }
                    catch (SmtpException ex)
                    {
                        //log exception or throw to upper layer as per your requirement
                    }
                    catch (Exception ex) //This will handle errors other than thrown feature other than SMTP
                    {
                        //log exception or throw to upper layer as per your requirement
                    }
                     
                    
                    Msg = "Successful";
                }
                else
                {
                    Msg = "Email_Error";
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
