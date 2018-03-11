using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Staffing.Core.Interfaces;
using Staffing.Core.Models;
using Staffing.DAL.DataModel;
using Staffing.DAL.Mappers;

namespace Staffing.DAL.Repositories
{
    public class MenuRepository:IMenuRepository
    {
        #region Private
        private readonly StaffingDBContext _staffingDB;
        #endregion

        public MenuRepository(StaffingDBContext staffingDB) 
        {
            _staffingDB = staffingDB;
        }
        public IQueryable<MenuModel> GetAllMenus() 
        {
            return _staffingDB.Menus.ToModelList().AsQueryable();
        }
        public int AddMenu(MenuModel menuModel)
        {
            var menuEntity = menuModel.ToEntity();
            System.Data.Entity.Core.Objects.ObjectParameter Id=new System.Data.Entity.Core.Objects.ObjectParameter("Id",System.Data.DbType.Int64);
            return _staffingDB.spMenuInsert(Id, menuEntity.Name, menuEntity.DisplayName, menuEntity.ParentId, menuEntity.LinkUrl, menuEntity.ImageUrl, menuEntity.IsActive,
                menuEntity.CreatedBy, menuEntity.CreatedDate, menuEntity.ModifiedBy, menuEntity.ModifiedDate,menuModel.DisplayOrder);
        }
        public int EditMenu(MenuModel menuModel)
        {
            var menuEntity = menuModel.ToEntity();
            return _staffingDB.spMenuUpdate(menuEntity.Id, menuEntity.Name, menuEntity.DisplayName, menuEntity.ParentId, menuEntity.LinkUrl, menuEntity.ImageUrl, menuEntity.IsActive,
                menuEntity.CreatedBy, menuEntity.CreatedDate, menuEntity.ModifiedBy, menuEntity.ModifiedDate, menuModel.DisplayOrder);
        }
        public int DeleteMenu(long menuId)
        {
            return _staffingDB.spMenuDelete(menuId);
        }
        public string GetSideBarMenu(string rootUrl)
        {
            var result = _staffingDB.spGetSideBarMenu(rootUrl).FirstOrDefault<string>();
            return result;
        }
    }
}
