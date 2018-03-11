using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Staffing.Web.Areas.Staffing.Controllers
{
    public class HomeController : Controller
    {
        // GET: Staffing/Home
        public ActionResult Index()
        {
            return View();
        }
    }
}