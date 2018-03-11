using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Staffing.BusinessService.ViewModel;
namespace Staffing.BusinessService.Interfaces
{
    public interface IMenuService
    {
        List<MenuViewModel> GetAllMenus();
        List<MenuViewModel> GetAllMenusForGrid(int? page, int? limit, string sortBy, string direction, string searchString, out int total);
        int AddUpdateMenu(MenuViewModel menuVm);
        int DeleteMenu(long menuId);
        string GetSideBarMenu(string rootUrl);
    }
}
