using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace MvcApplication1
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

        
            //This Routes Signup Data to Database
            routes.MapRoute(
                "signup",
                "WEP/signuppage/{name}/{email}/{uname}/{pswd}/{mobile}",
                new { controller = "WEP", action = "signuppage", name = UrlParameter.Optional, email = UrlParameter.Optional, uname = UrlParameter.Optional, pswd = UrlParameter.Optional, mobile = UrlParameter.Optional }
            );

            //This Routes Login Data to check the credintial from Database
            routes.MapRoute(
                "login",
                "WEP/loginpage/{uname}/{pswd}",
                new { controller = "WEP", action = "loginpage", uname = UrlParameter.Optional, pswd = UrlParameter.Optional }
            );

            //This Routes to Userprofile and Updation 
            routes.MapRoute(
               "Userprofile",
               "WEP/userprofilepage/{fname}/{email}/{uname}/{mobile}/{repswd}",
               new { controller = "WEP", action = "userprofilepage", fname = UrlParameter.Optional, email = UrlParameter.Optional, uname = UrlParameter.Optional, mobile = UrlParameter.Optional, repswd = UrlParameter.Optional }
           );

           //This Routes to Complaint Form Data to Enter Complaint to Database
            routes.MapRoute(
               "ComplaintForm",
               "WEP/complaintpage/{fname}/{lname}/{phone}/{address}/{category}/{cattype}/{desc}/{lat}/{lng}/{session_id}",
               new { controller = "WEP", action = "complaintpage", fname = UrlParameter.Optional, lname = UrlParameter.Optional, phone = UrlParameter.Optional, address = UrlParameter.Optional, category = UrlParameter.Optional, cattype = UrlParameter.Optional, desc = UrlParameter.Optional, lat = UrlParameter.Optional, lng = UrlParameter.Optional, session_id = UrlParameter.Optional }
           );

           //This Routes to View Complaint from Database
            routes.MapRoute(
               "view_complaint_page",
               "WEP/view_complaintpage",
               new { controller = "WEP", action = "view_complaintpage" }
           );

            //This Routes to View Complaint from Database
            routes.MapRoute(
               "Update_ComplaintForm",
               "WEP/update_complaintpage/{ccid}",
               new { controller = "WEP", action = "update_complaintpage", ccid = UrlParameter.Optional }

                // /{fname}/{lname}/{phone}/{address}/{category}/{cattype}/{desc}/{lat}/{lng}
                // , fname = UrlParameter.Optional, lname = UrlParameter.Optional, phone = UrlParameter.Optional, address = UrlParameter.Optional, category = UrlParameter.Optional, cattype = UrlParameter.Optional, desc = UrlParameter.Optional, lat = UrlParameter.Optional, lng = UrlParameter.Optional
           );

           /*-----------------------------------------ADMIN ROUTES-----------------------------------------------------*/

            //This Routes Admin Signup Data to Database
            routes.MapRoute(
                "admin_signup_page",
                "WEP/admin_signuppage/{name}/{email}/{uname}/{pswd}/{mobile}",
                new { controller = "WEP", action = "admin_signuppage", name = UrlParameter.Optional, email = UrlParameter.Optional, uname = UrlParameter.Optional, pswd = UrlParameter.Optional, mobile = UrlParameter.Optional }
            );

            //This Routes Admin Login Data to check the credintial from Database
            routes.MapRoute(
                "adminlogin",
                "WEP/admin_loginpage/{uname}/{pswd}",
                new { controller = "WEP", action = "admin_loginpage", uname = UrlParameter.Optional, pswd = UrlParameter.Optional }
            );

            //This Routes to Adminprofile and Updation 
            routes.MapRoute(
               "AdminProfile",
               "WEP/adminprofilepage/{fname}/{email}/{uname}/{mobile}/{repswd}",
               new { controller = "WEP", action = "adminprofilepage", fname = UrlParameter.Optional, email = UrlParameter.Optional, uname = UrlParameter.Optional, mobile = UrlParameter.Optional, repswd = UrlParameter.Optional }
           );

            //This Routes to View Complaint from Database
            routes.MapRoute(
               "admin_view_complaint_page",
               "WEP/adminview_complaintpage",
               new { controller = "WEP", action = "adminview_complaintpage" }
           );


            /*-----------------------------------------Default ACTION----------------------------------------------------*/

            
            //This Routes to View Complaint from Database
            routes.MapRoute(
               "contactForm",
               "WEP/contactus/{name}/{email}/{phone}/{message}",
               new { controller = "WEP", action = "contactus", name = UrlParameter.Optional, email = UrlParameter.Optional, phone = UrlParameter.Optional, message = UrlParameter.Optional }
           );
            

            //This is Default Routes 
            routes.MapRoute(
            name: "Default",
            url: "{controller}/{action}",
            defaults: new { controller = "WEP", action = "Index" }
        );

        }
    }
}