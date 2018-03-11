using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Staffing.Web.Models;
namespace Staffing.Web.Controllers
{
    public class TestController : Controller
    {
        // GET: Test
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public JsonResult GetPlayers(int? page, int? limit, string sortBy, string direction, string searchString = null)
        {
            int total;
            var records = new GridModel().GetPlayers(page, limit, sortBy, direction, searchString, out total);
            return Json(new { records, total }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Save(Player player)
        {
            new GridModel().Save(player);
            return Json(true);
        }

        [HttpPost]
        public JsonResult Remove(int id)
        {
            new GridModel().Remove(id);
            return Json(true);
        }
    }
}