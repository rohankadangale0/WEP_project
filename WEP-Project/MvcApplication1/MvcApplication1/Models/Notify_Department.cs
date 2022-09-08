using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
    public class Notify_Department
    {
        public void notifyDeparment(String fname, String lname, String phone, String date, String address, String category, String type, String desc, String lat, String lng)
        {
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["WEPConnectionString"].ConnectionString);
            SqlCommand notify_water_dept = new SqlCommand("Insert into Water_Department Select  fname,lname,phone,date,address,category,type,description,latitude,longitude From Complaints where category = 'water'", Con);
            SqlCommand notify_electricity_dept = new SqlCommand("Insert into Electricity_Department Select  fname,lname,phone,date,address,category,type,description,latitude,longitude From Complaints where category = 'electricity'", Con);
            SqlCommand notify_road_dept = new SqlCommand("Insert into Road_Department Select  fname,lname,phone,date,address,category,type,description,latitude,longitude From Complaints where category = 'road'", Con);

            SqlCommand delete_duplicates_records_water = new SqlCommand("With Duplicate_CTE As (Select fname,lname,phone,date,address,category,type,description, ROW_NUMBER() OVER (Partition by fname,lname,phone,date,address,type,description Order By category) As DupCount from Water_Department) Delete from Duplicate_CTE where DupCount > 1;", Con);
            SqlCommand delete_duplicates_records_electricity = new SqlCommand("With Duplicate_CTE As (Select fname,lname,phone,date,address,category,type,description, ROW_NUMBER() OVER (Partition by fname,lname,phone,date,address,type,description Order By category) As DupCount from Electricity_Department) Delete from Duplicate_CTE where DupCount > 1;", Con);
            SqlCommand delete_duplicates_records_road = new SqlCommand("With Duplicate_CTE As (Select fname,lname,phone,date,address,category,type,description, ROW_NUMBER() OVER (Partition by fname,lname,phone,date,address,type,description Order By category) As DupCount from Road_Department) Delete from Duplicate_CTE where DupCount > 1;", Con);

            Con.Open();
            notify_water_dept.ExecuteNonQuery();
            notify_electricity_dept.ExecuteNonQuery();
            notify_road_dept.ExecuteNonQuery();
            Con.Close();

            Con.Open();
            delete_duplicates_records_water.ExecuteNonQuery();
            delete_duplicates_records_electricity.ExecuteNonQuery();
            delete_duplicates_records_road.ExecuteNonQuery();
            Con.Close();



            /*
            --Insert from one table to another
            Insert into Water_Department Select fname,lname,phone,date,address,category,type,description,latitude,longitude from Complaints where cid = 3008;

            --To Find Duplicate Records
            Select fname,lname,phone,date,address,category,type,description,COUNT(*) From test 
            Group By fname,lname,phone,date,address,category,type,description Having COUNT(*) > 1;

              
            --Delete Duplicate Entries
            With Duplicate_CTE As (
              Select fname,lname,phone,date,address,category,type,description, ROW_NUMBER() OVER (Partition by fname,lname,phone,date,address,type,description Order By category) As DupCount 
              from test
             )
             Delete from Duplicate_CTE where DupCount > 1;
             *
             * */
        }
    }
}