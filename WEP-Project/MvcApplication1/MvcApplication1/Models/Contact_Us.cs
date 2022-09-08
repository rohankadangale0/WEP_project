using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace MvcApplication1.Models
{
    public class Contact_Us
    {
        public void contactus_detaild(String name, String email, String phone, String message)
        {

            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString);
            SqlCommand send_message = new SqlCommand("Insert into Contactus values('" + name + "', '" + email + "', '" + message + "')", Con);

            
            
            
            //Sending Mail
            SmtpClient client = new SmtpClient("smtp-mail.outlook.com");
            client.Port = 587;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            System.Net.NetworkCredential credential = new System.Net.NetworkCredential("wepprojectunigoa@outlook.com", "UnigoaWep@123"); //Sender's Email and password
            client.EnableSsl = true;
            client.Credentials = credential;
            MailMessage message1 = new MailMessage("wepprojectunigoa@outlook.com", email); // From and To Email 
            message1.Subject = "Thank you For Contacting Us"; //Subject of Mail
            message1.Body = "Thank you for reaching out to us!!. We'll get back to you soon."; //Body of Mail
            message1.IsBodyHtml = true;
            try
            {
                Con.Open();
                send_message.ExecuteNonQuery();
                Con.Close();

                client.Send(message1);
                

            }
            catch (SmtpException ex)
            {
                //log exception or throw to upper layer as per your requirement
                Console.WriteLine(ex);
                
            }
            catch (Exception ex) //This will handle errors other than thrown feature other than SMTP
            {
                //log exception or throw to upper layer as per your requirement
                Console.WriteLine(ex);

            }
        }
    }
}