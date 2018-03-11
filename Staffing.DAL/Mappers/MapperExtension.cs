using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Staffing.Core.Models;
using Staffing.DAL.DataModel;
namespace Staffing.DAL.Mappers
{
    public static class MapperExtension
    {
        #region Menus
        public static MenuModel ToModel(this Menu entity)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<Menu, MenuModel>());
            return Mapper.Map<Menu, MenuModel>(entity);
        }
        public static IEnumerable<MenuModel> ToModelList(this IEnumerable<Menu> entityList)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<Menu, MenuModel>());
            return entityList.Select(Mapper.Map<Menu, MenuModel>).ToList();
        }
        public static Menu ToEntity(this MenuModel model)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<MenuModel, Menu>());
            return Mapper.Map<MenuModel, Menu>(model);
        }
        public static IEnumerable<Menu> ToEntityList(this IEnumerable<MenuModel> modelList)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<MenuModel, Menu>());
            return modelList.Select(Mapper.Map<MenuModel, Menu>).ToList();
        }
        #endregion

        #region Company

        //public static CompanyModel ToModel(this Menu entity)
        //{
        //    Mapper.Initialize(ifg => ifg.CreateMap<Menu, MenuModel>());
        //    return Mapper.Map<Menu, MenuModel>(entity);
        //}
        //public static IEnumerable<MenuModel> ToModelList(this IEnumerable<Menu> entityList)
        //{
        //    Mapper.Initialize(ifg => ifg.CreateMap<Menu, MenuModel>());
        //    return entityList.Select(Mapper.Map<Menu, MenuModel>).ToList();
        //}


        #endregion
        #region LovItem

        public static LOVItemValueModel ToModel(this LOVItemValue entity)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<LOVItemValue, LOVItemValueModel>());
            return Mapper.Map<LOVItemValue, LOVItemValueModel>(entity);
        }
      
        public static List<LOVItemValueModel> ToModelList(this IEnumerable<LOVItemValue> entityList)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<LOVItemValue, LOVItemValueModel>());
            return entityList.Select(Mapper.Map<LOVItemValue, LOVItemValueModel>).ToList();
        }


        #endregion

        #region CompanyContact

        //public static companymodel tomodel(this menu entity)
        //{
        //    mapper.initialize(ifg => ifg.createmap<menu, menumodel>());
        //    return mapper.map<menu, menumodel>(entity);
        //}
        public static IEnumerable<CompanyContactModel> ToModelList(this IEnumerable<CompanyContact> entitylist)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<CompanyContact, CompanyContactModel>());
            return entitylist.Select(Mapper.Map<CompanyContact, CompanyContactModel>).ToList();
        }
        

        #endregion




    }
}
