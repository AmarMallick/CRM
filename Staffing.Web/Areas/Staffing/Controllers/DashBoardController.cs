using Staffing.Web.Areas.Staffing.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Staffing.Web.Areas.Staffing.Controllers
{
    public class DashBoardController : Controller
    {
        // GET: Staffing/DashBoard
        public ActionResult Index()
        {
            List<string> submenu = new List<string>() { "Test", "Test1" };

            MenuModel menuModelResult = new MenuModel();
            MenuModelSingle menuModel = new MenuModelSingle();
            List<MenuModelSingle> menuModelList = new List<MenuModelSingle>()
            {

                new MenuModelSingle{id=1,Name="AccountPayable"},
                 new MenuModelSingle{id=2,Name="Admin"},
                  new MenuModelSingle{id=3,Name="Sales",ParentId=1,SubMenu=submenu},
                   new MenuModelSingle{id=4,Name="Legal",ParentId=2,SubMenu=submenu},
                   new MenuModelSingle{id=5,Name="Reports"},
                   new MenuModelSingle{id=6,Name="EmployeeManagement"},
                   new MenuModelSingle{id=7,Name="Account"},
                   new MenuModelSingle{id=8,Name="Requisition"},
                   new MenuModelSingle{id=9,Name="TimeSheet"},
                   new MenuModelSingle{id=10,Name="Recruiter"}
                 


            };
               
            menuModelResult.MenuList = menuModelList;
            return View(menuModelResult);
        }


        public ActionResult SideMenu()
        {
            MenuModel menuModelResult = new MenuModel();
            MenuModelSingle menuModel = new MenuModelSingle();
            List<MenuModelSingle> menuModelList = new List<MenuModelSingle>()
            {

                new MenuModelSingle{id=1,Name="AccountPayable"},
                 new MenuModelSingle{id=2,Name="Admin"},
                  new MenuModelSingle{id=3,Name="Sales"},
                   new MenuModelSingle{id=4,Name="Legal"},
                   new MenuModelSingle{id=5,Name="Reports"},
                   new MenuModelSingle{id=6,Name="EmployeeManagement"},
                   new MenuModelSingle{id=7,Name="Account"},
                   new MenuModelSingle{id=8,Name="Requisition"},
                   new MenuModelSingle{id=9,Name="TimeSheet"},
                   new MenuModelSingle{id=10,Name="Recruiter"}
                 


            };

            menuModelResult.MenuList = menuModelList;
            return View("_SideBarMenu", menuModelResult);

        }


        public ActionResult AccountPayable()
        {
            MenuModel menuModelResult = new MenuModel();
            MenuModelSingle menuModel = new MenuModelSingle();
            List<MenuModelSingle> menuModelList = new List<MenuModelSingle>()
            {

                new MenuModelSingle{id=1,Name="AccountPayable"},
                 new MenuModelSingle{id=2,Name="Admin"},
                  new MenuModelSingle{id=3,Name="Sales"},
                   new MenuModelSingle{id=4,Name="Legal"},
                   new MenuModelSingle{id=5,Name="Reports"},
                   new MenuModelSingle{id=6,Name="EmployeeManagement"},
                   new MenuModelSingle{id=7,Name="Account"},
                   new MenuModelSingle{id=8,Name="Requisition"},
                   new MenuModelSingle{id=9,Name="TimeSheet"},
                   new MenuModelSingle{id=10,Name="Recruiter"}
                 


            };

            menuModelResult.MenuList = menuModelList;
            return View(menuModelResult);

           
        }
    }
}