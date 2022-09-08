using MvcApplication1.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcApplication1.Controllers
{
    public class WEPController : Controller
    {
        //
        // GET: /Test/

        /*-------------------------------- USER SYSTEM ----------------------------------------------------*/

        //This Action is to Register the user into System and Redirect to Login page 
        public ActionResult signuppage(String name, String email, String uname, String pswd, String mobile)
        {
            bool check_name = string.IsNullOrEmpty(name), check_user = string.IsNullOrEmpty(uname), check_email = string.IsNullOrEmpty(email), check_pssd = string.IsNullOrEmpty(pswd), check_mob = string.IsNullOrEmpty(mobile);
            if (check_name == true || check_user == true || check_email == true|| check_pssd == true || check_mob == true)
            {
                return View("~/Views/WEP/User/sign_up.aspx");
            }
            else
            {
                Signup_Details SD = new Signup_Details();
                SD.Details(name, email, uname, pswd, mobile);
                ViewBag.Msg = SD.Msg;

                if (SD.Msg == "Success")
                {
                    return RedirectToAction("loginpage");
                }
                return View("~/Views/WEP/User/sign_up.aspx");
                
            }
        }


        //This Action is for logging into system and Set Session ID 
        public ActionResult loginpage(String uname, String pswd)
        {
            bool check_name = string.IsNullOrEmpty(uname), check_pass = string.IsNullOrEmpty(pswd);
            if (check_name == true || check_pass == true)
            {
                return View("~/Views/WEP/User/login.aspx");
            }
            else
            {
                Login_Details LD = new Login_Details();
                LD.login(uname, pswd);
                ViewBag.Msg = LD.Msg;
                //return RedirectToAction("Index");

                if (LD.Msg == "Successful")
                {
                    Session["ID"] = LD.Session_Id;
                    Session["Name"] = LD.Session_Name;
                    return RedirectToAction("complaintpage");
                }

                return View("~/Views/WEP/User/login.aspx");

            }
        }


        //This Action Redirects to Forgot Password Page 
        public ActionResult forgotpassword(String uname, String email)
        {

            bool check_name = string.IsNullOrEmpty(uname), check_email = string.IsNullOrEmpty(email);

            if (check_name == true || check_email == true)
            {
                return View("~/Views/WEP/User/forgot_password.aspx");
            }
            else
            {
                Forgot_Password FP = new Forgot_Password();
                FP.generate_password(uname, email);
                ViewBag.Msg = FP.Msg;

                if (FP.Msg == "Successful")
                {
                    return RedirectToAction("loginpage");
                }
                else
                {
                    return View("~/Views/WEP/User/forgot_password.aspx");
                }
               
            }
                
        }


        //This Action is to View User Profile and Update Profile
        public ActionResult userprofilepage(String fname, String email, String uname, String mobile, String repswd)
        {
            bool check_name = string.IsNullOrEmpty(fname), check_email = string.IsNullOrEmpty(email), check_uname = string.IsNullOrEmpty(uname), check_mobile = string.IsNullOrEmpty(mobile);

            if (Session["ID"] == null)
            {
                return RedirectToAction("loginpage");
            }
            else if (check_name == true || check_email == true || check_uname == true || check_mobile == true)
            {
                return View("~/Views/WEP/User/userprofile.aspx");
            }
            else
            {

                Userprofile_Update user_profile = new Userprofile_Update();
                user_profile.update_details(fname, email, uname, mobile, repswd);
                ViewBag.Msg = user_profile.Msg;

                return RedirectToAction("complaintpage");
                //return RedirectToAction("Index");
            }

        }

        //This Action is to file Complaint 
        public ActionResult complaintpage(String fname, String lname, String phone, String address, String category, String cattype, String desc, String lat, String lng, String session_id)
        {
            bool check_fname = string.IsNullOrEmpty(fname), check_lname = string.IsNullOrEmpty(lname), 
                check_phone = string.IsNullOrEmpty(phone), check_address = string.IsNullOrEmpty(address), 
                check_complainttype = string.IsNullOrEmpty(category), check_cattyp = string.IsNullOrEmpty(cattype), 
                check_desc = string.IsNullOrEmpty(desc), check_lat = string.IsNullOrEmpty(lat), 
                check_lng = string.IsNullOrEmpty(lng), check_id = string.IsNullOrEmpty(session_id);


            if (Session["ID"] == null)
            {
                return RedirectToAction("loginpage");
            }
            else if (check_fname == true || check_lname == true || check_phone == true || check_phone == true || check_address == true || check_complainttype == true || check_cattyp == true || check_desc == true || check_lat == true || check_lng == true || check_id == true)
            {
                return View("~/Views/WEP/User/complaint_page.aspx");
            }
            else
            {

                Complaint_Details CD = new Complaint_Details();
                CD.file_complaint(fname, lname, phone, address, category, cattype, desc, lat, lng, session_id);
                ViewBag.Msg = CD.Msg;
                return RedirectToAction("view_complaintpage");
            }
        }


        //This Action is to View Filed Complaint  
        public ActionResult view_complaintpage(String updateid, String deleteid, String mapid)
        {
            bool check_cmplaintid = string.IsNullOrEmpty(updateid), check_delid = string.IsNullOrEmpty(deleteid), check_mapid = string.IsNullOrEmpty(mapid);

            if (Session["ID"] == null)
            {
                return RedirectToAction("loginpage");
            }
            else if (check_cmplaintid == true && check_delid == true && check_mapid == true)
            {
               
                //return RedirectToAction("update_complaintpage");

                return View("~/Views/WEP/User/complaint_view_page.aspx");
            }
            else if (check_delid == true && check_mapid == true)
            {
                SetId sid = new SetId();
                sid.setid(updateid);
                ViewBag.Msg = sid.Msg;

                if (sid.Msg == "Success")
                {
                    Session["Complaint_Id"] = sid.Setted_Id;
                    return RedirectToAction("update_complaintpage");
                }

                return View("~/Views/WEP/User/complaint_view_page.aspx");
            }
            else if (check_cmplaintid == true && check_delid == false && check_mapid == true)
            {

                Delete_Complaint dc = new Delete_Complaint();
                dc.DeleteComplaint(deleteid);
                ViewBag.Msg = dc.Msg;

                if (dc.Msg == "Success")
                {
                    return RedirectToAction("view_complaintpage");
                }
                return View("~/Views/WEP/User/complaint_view_page.aspx");
            }
            else if(check_cmplaintid == true && check_delid == true)
            {
                SetId sid = new SetId();
                sid.setid(mapid);
                Session["Complaint_Id"] = sid.Setted_Id;
                return RedirectToAction("map_view");
            }
            else
            {
                return View("~/Views/WEP/User/complaint_view_page.aspx");
            }
            
        }

       

        //This Action is to Update Filed Complaint  
        public ActionResult update_complaintpage(String ccid, String fname, String lname, String phone, String address, String category, String cattype, String desc, String lat, String lng)  
        {


            bool check_id = string.IsNullOrEmpty(ccid), check_fname = string.IsNullOrEmpty(fname), check_lname = string.IsNullOrEmpty(lname), check_phone = string.IsNullOrEmpty(phone), check_address = string.IsNullOrEmpty(address), check_complainttype = string.IsNullOrEmpty(category), check_cattyp = string.IsNullOrEmpty(cattype), check_desc = string.IsNullOrEmpty(desc), check_lat = string.IsNullOrEmpty(lat), check_lng = string.IsNullOrEmpty(lng);

            if (Session["ID"] == null)
            {
                return RedirectToAction("loginpage");
            }
            else if (check_id == true || check_fname == true || check_lname == true || check_phone == true || check_phone == true || check_address == true || check_complainttype == true || check_cattyp == true || check_desc == true || check_lat == true || check_lng == true)
            {
                return View("~/Views/WEP/User/update_complaint.aspx");
            }
            else
            {
                Update_Complaint UC = new Update_Complaint();
                UC.update_complaints(ccid, fname, lname, phone, address, category, cattype, desc, lat, lng); 
                return RedirectToAction("view_complaintpage");
            }

        }


        //This Action View the Map of Selected Complainted
        public ActionResult map_view()
        {
            if (Session["ID"] == null)
            {
                return RedirectToAction("loginpage");
            }
            else
            {
                return View("~/Views/WEP/User/ViewMap.aspx");
            }
        }

        //This Action is for Contact US
        public ActionResult contactus(String name, String email, String phone, String message)
        {

            bool check_name = string.IsNullOrEmpty(name), check_email = string.IsNullOrEmpty(email), check_phone = string.IsNullOrEmpty(phone), check_mssg = string.IsNullOrEmpty(message);

            if (check_name == true || check_email == true || check_phone == true || check_mssg == true)
            {
                return View("~/Views/WEP/contactus.aspx");
            }
            else
            {
                Console.WriteLine("Value of name:" + name);
                Contact_Us cs = new Contact_Us();
                cs.contactus_detaild(name, email, phone, message);
                return RedirectToAction("Index");
            }

            /*
            Contact_Us cs = new Contact_Us();
            cs.contactus_detaild(name, email, phone, message);
            return RedirectToAction("loginpage");*/
        }

       
        

        //This Action is for log out and UnSet the Session ID 
        public ActionResult logout()
        {
            Session["ID"] = null;
            Session["Name"] = null;

            return RedirectToAction("loginpage");
        }



        /*-------------------------------- ADMIN SYSTEM ----------------------------------------------------*/

        //This Action is to Register the Admin into System and Redirect to Login page 
        public ActionResult admin_signuppage(String name, String email, String uname, String pswd, String mobile)
        {
            bool check_name = string.IsNullOrEmpty(name), check_user = string.IsNullOrEmpty(uname), check_email = string.IsNullOrEmpty(email), check_pssd = string.IsNullOrEmpty(pswd), check_mob = string.IsNullOrEmpty(mobile);
            if (check_name == true || check_user == true || check_email == true || check_pssd == true || check_mob == true)
            {
                return View("~/Views/WEP/Admin/admin_signup.aspx");
            }
            else
            {
                Admin_Signup_Details ADS = new Admin_Signup_Details();
                ADS.Admin_Details(name, email, uname, pswd, mobile);
                ViewBag.Msg = ADS.Msg;

                if (ADS.Msg == "Success")
                {
                    return RedirectToAction("admin_loginpage");
                }
                return View("~/Views/WEP/Admin/admin_signup.aspx");

            }
        }

        
        //This Action is for Admin logging into system and Set Admin Session ID 
        public ActionResult admin_loginpage(String uname, String pswd)
        {
            bool check_name = string.IsNullOrEmpty(uname), check_pass = string.IsNullOrEmpty(pswd);
            if (check_name == true || check_pass == true)
            {
                return View("~/Views/WEP/Admin/admin_login.aspx");
            }
            else
            {
                Admin_Login AL = new Admin_Login();
                AL.login(uname, pswd);
                ViewBag.Msg = AL.Msg;
                //return RedirectToAction("Index");

                if (AL.Msg == "Successful")
                {
                    Session["AdminID"] = AL.Session_Id;
                    Session["AdminName"] = AL.Session_Name;
                    return RedirectToAction("admin_dashboard_page");
                }

                return View("~/Views/WEP/Admin/admin_login.aspx");

            }
        }


        //This Action Redirects to Admin Forgot Password Page and Updated the Password with Generated Password
        public ActionResult admin_forgotpassword(String uname, String email)
        {

            bool check_name = string.IsNullOrEmpty(uname), check_email = string.IsNullOrEmpty(email);

            if (check_name == true || check_email == true)
            {
                return View("~/Views/WEP/Admin/admin_forgot_password.aspx");
            }
            else
            {
                Admin_Forgot_Password AFP = new Admin_Forgot_Password();
                AFP.generate_password(uname, email);
                ViewBag.Msg = AFP.Msg;

                if (AFP.Msg == "Successful")
                {
                    return RedirectToAction("admin_loginpage");
                }
                else
                {
                    return View("~/Views/WEP/Admin/admin_forgot_password.aspx");
                }

            }

        }


        //This Action is to View Admin DashBoard
        public ActionResult admin_dashboard_page()
        {
            if (Session["AdminID"] == null)
            {
                return RedirectToAction("admin_loginpage");
            }
            else
            {
                return View("~/Views/WEP/Admin/admin_dashboard.aspx");
            }
        }


        //This Action is to View Admin Profile and Update Profile
        public ActionResult adminprofilepage(String fname, String email, String uname, String mobile, String repswd, String session_id)
        {
            bool check_name = string.IsNullOrEmpty(fname), check_email = string.IsNullOrEmpty(email), check_uname = string.IsNullOrEmpty(uname), check_mobile = string.IsNullOrEmpty(mobile), check_id = string.IsNullOrEmpty(session_id);

            if (Session["AdminID"] == null)
            {
                return RedirectToAction("admin_loginpage");
            }
            else if (check_name == true || check_email == true || check_uname == true || check_mobile == true)
            {
                return View("~/Views/WEP/Admin/admin_profile_page.aspx");
            }
            else
            {

                Adminprofile_Update adminprofile_update = new Adminprofile_Update();
                adminprofile_update.update_details(session_id, fname, email, uname, mobile, repswd);
                ViewBag.Msg = adminprofile_update.Msg;

                return RedirectToAction("admin_dashboard_page");
            }
            
        }

        //This Action is to View Filed Complaint to Admin
        public ActionResult adminview_complaintpage(String fname, String lname, String phone, String date, String address, String category, String type, String desc, String lat, String lng, String mapid, String admnid)
        {
            bool check_mapid = string.IsNullOrEmpty(mapid), check_id = string.IsNullOrEmpty(admnid), check_fname = string.IsNullOrEmpty(fname), check_lname = string.IsNullOrEmpty(lname), check_phone = string.IsNullOrEmpty(phone), check_address = string.IsNullOrEmpty(address), check_complainttype = string.IsNullOrEmpty(category), check_cattyp = string.IsNullOrEmpty(type), check_desc = string.IsNullOrEmpty(desc), check_lat = string.IsNullOrEmpty(lat), check_lng = string.IsNullOrEmpty(lng);

            if (Session["AdminID"] == null)
            {
                return RedirectToAction("admin_loginpage");
            }
            else if (check_mapid == true && check_id == true)
            {

                //return RedirectToAction("update_complaintpage");
                Console.WriteLine(check_mapid + " " + check_id);
                
                return View("~/Views/WEP/Admin/admin_view_complaint_page.aspx");
            }
            else if (check_mapid == false)
            {
                SetId sid = new SetId();
                sid.setid(mapid);
                Session["Complaint_Id"] = sid.Setted_Id;
                return RedirectToAction("admin_map_view");
            }
            else if(check_mapid == true)
            {
                Console.WriteLine(check_mapid + " " + check_id);
                Notify_Department nd = new Notify_Department();
                nd.notifyDeparment(fname, lname, phone, date, address, category, type, desc, lat, lng);
                return RedirectToAction("admin_dashboard_page");
            }
            else
            {
                return View("~/Views/WEP/Admin/admin_view_complaint_page.aspx");
            }

        }


        //This Action is to View Filed Complaint to Admin
        public ActionResult adminview_userpage(String deleteid)
        {
            bool check_userid = string.IsNullOrEmpty(deleteid);

            if (Session["AdminID"] == null)
            {
                return RedirectToAction("admin_loginpage");
            }
            else if (check_userid == true)
            {

                //return RedirectToAction("update_complaintpage");

                return View("~/Views/WEP/Admin/admin_view_users.aspx");
            }
            else
            {
                Delete_User du = new Delete_User();
                du.DeleteUser(deleteid);
                ViewBag.Msg = du.Msg;

                if (du.Msg == "Success")
                {
                    return RedirectToAction("adminview_userpage");
                }
                return View("~/Views/WEP/Admin/admin_view_users.aspx");
            }

        }


        //This Action View the Map of Selected Complainted to ADMIN
        public ActionResult admin_map_view()
        {
            if (Session["AdminID"] == null)
            {
                return RedirectToAction("admin_loginpage");
            }
            else
            {
                return View("~/Views/WEP/Admin/admin_view_map.aspx");
            }
        }


        //This Action is for log out and UnSet the Session ID  for Admin
        public ActionResult adminlogout()
        {
            Session["AdminID"] = null;
            Session["AdminName"] = null;

            return RedirectToAction("admin_loginpage");
        }


        /*-------------------------------- DEFAULT ACTION ----------------------------------------------------*/



        //This Action is Default Action Which loads the Main Page
        public ActionResult Index(String name, String email, String phone, String message)
        {
            
            bool check_name = string.IsNullOrEmpty(name), check_email = string.IsNullOrEmpty(email), check_phone = string.IsNullOrEmpty(phone), check_mssg = string.IsNullOrEmpty(message);

            if (check_name == true || check_email == true || check_phone == true || check_mssg == true)
            {
                return View("~/Views/WEP/view_page.aspx");
            }
            else
            {
                Console.WriteLine("Value of name:" + name);
                Contact_Us cs = new Contact_Us();
                cs.contactus_detaild(name, email, phone, message);
                //return RedirectToAction("Index");
                return View("~/Views/WEP/view_page.aspx");
            }
            
            //return View("~/Views/WEP/view_page.aspx");
             
        }

    }
    
}
