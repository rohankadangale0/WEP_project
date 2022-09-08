using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;

namespace MvcApplication1.Models
{
    public class Complaint_Details
    {
        public string Msg { get; set; }
        public string session_name { get; set; }
        public void file_complaint(String fname, String lname, String phone, String address, String category, String cattype, String desc, String lat, String lng, String session_id)
        {
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString);
            SqlCommand Complaints_Details = new SqlCommand("Insert into Complaints values ('" + fname + "', '" + lname + "', '" + phone + "',  GETDATE(),'" + address + "', '" + category + "', '" + cattype + "', '" + desc + "', '" + lat + "', '" + lng + "', '" + session_id + "')", Con);

            Con.Open();
            Complaints_Details.ExecuteNonQuery();
            Con.Close();
            Msg = "Success";


            //Sending Mail
            SmtpClient client = new SmtpClient("smtp-mail.outlook.com");
            client.Port = 587;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            System.Net.NetworkCredential credential = new System.Net.NetworkCredential("wepprojectunigoa@outlook.com", "UnigoaWep@123"); //Sender's Email and password
            client.EnableSsl = true;
            client.Credentials = credential;
            MailMessage message = new MailMessage("wepprojectunigoa@outlook.com", "wepprojectunigoa@outlook.com"); // From and To Email 
            message.Subject = "New Complaint Received"; //Subject of Mail
            message.Body = "A New Complaint has been Registered by <b>" + fname + " </b> of Complaint Type <span style='text-transform:uppercase'> <b>" + category + " </b> </span>"; //Body of Mail
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

        }
    }
}