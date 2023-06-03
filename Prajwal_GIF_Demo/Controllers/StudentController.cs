using Microsoft.AspNetCore.Mvc;
using Prajwal_GIF_Demo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static Prajwal_GIF_Demo.Models.StudentModel;

namespace Prajwal_GIF_Demo.Controllers
{
    public class StudentController : Controller
    {
        // GET: Student
        public System.Web.Mvc.ActionResult Index()
        {
            return View();
        }
        StudentModel studb = new StudentModel();

        public JsonResult StudentList()
        {
            return Json(studb.GetStudentList(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetbyID(int ID)
        {
            var Student = studb.GetStudentList().Find(x => x.Id.Equals(ID));
            return Json(Student, JsonRequestBehavior.AllowGet);
        }

        public JsonResult UpdateStudent(StudentModel student)
        {
            return Json(studb.UpdateStudent(student), JsonRequestBehavior.AllowGet);
        }
        public JsonResult UpdateIsActive(List<ActiveList> students)
        {
            return Json(studb.UpdateIsActive(students), JsonRequestBehavior.AllowGet);
        }
    }
}