﻿using System.Web;
using System.Web.Mvc;

namespace Prajwal_GIF_Demo
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
