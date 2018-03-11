using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Staffing.BusinessService.ViewModel;
using Staffing.BusinessService.Interfaces;
using Staffing.BusinessService.Mappers;
using Staffing.Core.Interfaces;
using Staffing.Infrastructure.Model;
namespace Staffing.BusinessService.Services
{
    public class MenuService:IMenuService
    {
        #region Private
        private readonly IMenuRepository _menuRepository;
        #endregion

        public MenuService(IMenuRepository menuRepository)
        {
            _menuRepository = menuRepository;
        }
        public List<MenuViewModel> GetAllMenus() 
        {
            return _menuRepository.GetAllMenus().ToViewModelList().ToList();
        }
        public List<MenuViewModel> GetAllMenusForGrid(int? page, int? limit, string sortBy, string direction, string searchString, out int total) 
        {
            var result = _menuRepository.GetAllMenus().ToViewModelList();
            total = result.Count();
            var records = result;
            records = from m in records
                      join p in records on m.ParentId equals p.Id into inners
                      from od in inners.DefaultIfEmpty()
                      select new MenuViewModel
                      {
                          Id=m.Id,
                          Name = m.Name,
                          DisplayName = m.DisplayName,
                          ParentId = m.ParentId,
                          ParentName=(od==null?String.Empty:od.Name),
                          LinkUrl = m.LinkUrl,
                          ImageUrl = m.ImageUrl,
                          IsActive = m.IsActive,
                          CreatedBy = m.CreatedBy,
                          CreatedDate = m.CreatedDate,
                          ModifiedBy = m.ModifiedBy,
                          ModifiedDate = m.ModifiedDate,
                          DisplayOrder=m.DisplayOrder
                      };
            if (!string.IsNullOrWhiteSpace(searchString))
            {
                records = records.Where(p => p.Name.Contains(searchString) || p.DisplayName.Contains(searchString));
            }
            if (!string.IsNullOrEmpty(sortBy) && !string.IsNullOrEmpty(direction))
            {
                if (direction.Trim().ToLower() == "asc")
                {
                    records = SortHelper.OrderBy(records, sortBy);
                }
                else
                {
                    records = SortHelper.OrderByDescending(records, sortBy);
                }
            }
            if (page.HasValue && limit.HasValue)
            {
                int start = (page.Value - 1) * limit.Value;
                records = records.Skip(start).Take(limit.Value);
            }
            //var result= records.ToList();
            return records.ToList();
        }
        public int AddUpdateMenu(MenuViewModel menuVm)
        {
            return (menuVm.Id == 0 ? _menuRepository.AddMenu(menuVm.ToModel()) : _menuRepository.EditMenu(menuVm.ToModel()));
        }
        public int DeleteMenu(long menuId)
        {
            return _menuRepository.DeleteMenu(menuId);
        }
        public string GetSideBarMenu(string rootUrl) 
        {
            return _menuRepository.GetSideBarMenu(rootUrl);
        }
    }
}
