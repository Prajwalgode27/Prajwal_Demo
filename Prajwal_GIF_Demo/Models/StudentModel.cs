using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Prajwal_GIF_Demo.Models
{
    public class StudentModel
    {
        public int Id { get; set; }
        public string StudentName { get; set; }
        public string ParentName { get; set; }
        public string ClassName { get; set; }
        public string ParentEmail { get; set; }
        public string ParentMobile { get; set; }
        public bool Active { get; set; }

        public class ActiveList
        {
            public int Id { get; set; }
            public bool Active { get; set; }
        }


        string Data = ConfigurationManager.ConnectionStrings["StudentTest"].ConnectionString;
        public List<StudentModel> GetStudentList()
        {
            List<StudentModel> lstStudent = new List<StudentModel>();
            using (SqlConnection con = new SqlConnection(Data))
            {
                con.Open();
                SqlCommand com = new SqlCommand("usp_GetStudentList", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = com.ExecuteReader();
                while (rdr.Read())
                {
                    lstStudent.Add(new StudentModel
                    {
                        Id = Convert.ToInt32(rdr["Id"]),
                        StudentName = rdr["StudentName"].ToString(),
                        ParentName = rdr["ParentName"].ToString(),
                        ClassName = rdr["ClassName"].ToString(),
                        ParentEmail = rdr["ParentEmail"].ToString(),
                        ParentMobile = rdr["ParentMobile"].ToString(),
                        Active = (bool)rdr["Active"],
                    });
                }
                return lstStudent;
            }
        }
        public int UpdateStudent(StudentModel student)
        {
            int i;
            using (SqlConnection con = new SqlConnection(Data))
            {
                con.Open();
                SqlCommand com = new SqlCommand("usp_UpdateStudent", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@Action", "Update");
                com.Parameters.AddWithValue("@Id", student.Id);
                com.Parameters.AddWithValue("@StudentName", student.StudentName);
                com.Parameters.AddWithValue("@ParentName", student.ParentName);
                com.Parameters.AddWithValue("@ParentEmail", student.ParentEmail);
                com.Parameters.AddWithValue("@ParentMobile", student.ParentMobile);
                com.Parameters.AddWithValue("@Active", student.Active);
                com.Parameters.AddWithValue("@ClassName", student.ClassName);
                i = com.ExecuteNonQuery();
            }
            return i;
        }

        public int UpdateIsActive(List<ActiveList> students)
        {
            int i=0;
            if (students != null)
            {
                for (int j = 0; j < students.Count; j++)
                {
                    using (SqlConnection con = new SqlConnection(Data))
                    {
                        con.Open();
                        SqlCommand com = new SqlCommand("usp_UpdateStudent", con);
                        com.CommandType = CommandType.StoredProcedure;
                        com.Parameters.AddWithValue("@Id", students[j].Id);
                        com.Parameters.AddWithValue("@Active", students[j].Active);
                        com.Parameters.AddWithValue("@Action", "UpdateIsActive");
                        i = com.ExecuteNonQuery();
                    }
                }
            }
            return i;
        }
    }
}