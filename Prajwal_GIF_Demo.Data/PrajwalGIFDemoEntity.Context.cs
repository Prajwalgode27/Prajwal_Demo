﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Prajwal_GIF_Demo.Data
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class GifTestEntities : DbContext
    {
        public GifTestEntities()
            : base("name=GifTestEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tblParentStudent> tblParentStudents { get; set; }
        public virtual DbSet<tblSchoolClass> tblSchoolClasses { get; set; }
        public virtual DbSet<tblStudentClass> tblStudentClasses { get; set; }
        public virtual DbSet<tblUser> tblUsers { get; set; }
    
        public virtual ObjectResult<usp_GetStudentList_Result> usp_GetStudentList()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<usp_GetStudentList_Result>("usp_GetStudentList");
        }
    
        public virtual int usp_UpdateStudent(Nullable<int> id, string studentName, string parentEmail, string parentMobile, Nullable<bool> active, string className, string parentName)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(int));
    
            var studentNameParameter = studentName != null ?
                new ObjectParameter("StudentName", studentName) :
                new ObjectParameter("StudentName", typeof(string));
    
            var parentEmailParameter = parentEmail != null ?
                new ObjectParameter("ParentEmail", parentEmail) :
                new ObjectParameter("ParentEmail", typeof(string));
    
            var parentMobileParameter = parentMobile != null ?
                new ObjectParameter("ParentMobile", parentMobile) :
                new ObjectParameter("ParentMobile", typeof(string));
    
            var activeParameter = active.HasValue ?
                new ObjectParameter("Active", active) :
                new ObjectParameter("Active", typeof(bool));
    
            var classNameParameter = className != null ?
                new ObjectParameter("ClassName", className) :
                new ObjectParameter("ClassName", typeof(string));
    
            var parentNameParameter = parentName != null ?
                new ObjectParameter("ParentName", parentName) :
                new ObjectParameter("ParentName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("usp_UpdateStudent", idParameter, studentNameParameter, parentEmailParameter, parentMobileParameter, activeParameter, classNameParameter, parentNameParameter);
        }
    }
}
