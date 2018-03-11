using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Staffing.BusinessService.Interfaces;
using Staffing.BusinessService.ViewModel;
using Staffing.Infrastructure;
namespace Staffing.Web.Controllers
{
    public class MenuController : Controller
    {
        #region Private
        private readonly IMenuService _menuService;

        #endregion
        public MenuController(IMenuService menuService) 
        {
            _menuService = menuService;
        }
        // GET: Menu
        public ActionResult Index()
        {
            ViewBag.ApplicationName = Config.ApplicationName;
            var menus = _menuService.GetAllMenus();
            var menuVm = new MenuVM { menuList = menus, menuViewModel = new MenuViewModel() };
            return View(menuVm);
        }

        [HttpGet]
        public JsonResult GetMenus(int? page, int? limit, string sortBy, string direction, string searchString=null)
        {
            int total;
            var records = _menuService.GetAllMenusForGrid(page, limit, sortBy, direction, searchString,out total);
            return Json(new { records, total }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Save(MenuVM menuVm)
        {
            if (ModelState.IsValid)
            {
                menuVm.menuViewModel.CreatedBy = User.Identity.Name;
                menuVm.menuViewModel.CreatedDate = DateTime.Now;
                menuVm.menuViewModel.ModifiedBy = User.Identity.Name;
                menuVm.menuViewModel.ModifiedDate = DateTime.Now;
                _menuService.AddUpdateMenu(menuVm.menuViewModel);
                ModelState.AddModelError("", "Saved successfully ...");
                return View("Index",menuVm);
            }
            ModelState.AddModelError("","Failed to save Menu details ...");
            return View("Index", menuVm);
        }
        //public JsonResult Save(MenuVM menuVm)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        menuVm.menuViewModel.CreatedBy = User.Identity.Name;
        //        menuVm.menuViewModel.CreatedDate = DateTime.Now;
        //        menuVm.menuViewModel.ModifiedBy = User.Identity.Name;
        //        menuVm.menuViewModel.ModifiedDate = DateTime.Now;
        //        _menuService.AddUpdateMenu(menuVm.menuViewModel);
        //        return Json(true);
        //    }
        //    return Json(false);
        //}
        [HttpPost]
        public JsonResult Remove(long id)
        {
            _menuService.DeleteMenu(id);
            return Json(true);
        }
        [HttpGet]
        public ActionResult GetSideBarMenu()
        {
            var result=_menuService.GetSideBarMenu(Url.Content("~/"));
            return Content(result, "text/html");
        }
    }
}