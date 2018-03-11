using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Staffing.Core.Models;
namespace Staffing.Core.Interfaces
{
    public interface IMenuRepository
    {
        IQueryable<MenuModel> GetAllMenus();
        int AddMenu(MenuModel model);
        int EditMenu(MenuModel model);
        int DeleteMenu(long menuId);
        string GetSideBarMenu(string rootUrl);
    }
}
