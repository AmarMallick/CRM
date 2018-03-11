using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Staffing.BusinessService.ViewModel;
using Staffing.Core.Models;
namespace Staffing.BusinessService.Mappers
{
    public static class MapperExtension
    {
        #region Menus
        public static MenuViewModel ToViewModel(this MenuModel model)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<MenuModel, MenuViewModel>());
            return Mapper.Map<MenuModel, MenuViewModel>(model);
        }
        public static IQueryable<MenuViewModel> ToViewModelList(this IQueryable<MenuModel> modelList)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<MenuModel, MenuViewModel>());
            return modelList.Select(Mapper.Map<MenuModel, MenuViewModel>).AsQueryable();
        }
        public static MenuModel ToModel(this MenuViewModel vm)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<MenuViewModel, MenuModel>());
            return Mapper.Map<MenuViewModel, MenuModel>(vm);
        }
        public static IEnumerable<MenuModel> ToModelList(this IEnumerable<MenuViewModel> vmList)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<MenuViewModel, MenuModel>());
            return vmList.Select(Mapper.Map<MenuViewModel, MenuModel>).ToList();
        }
        #endregion

        #region Company
        public static CompanyViewModel ToViewModel(this CompanyModel model)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<CompanyModel, CompanyViewModel>());
            return Mapper.Map<CompanyModel, CompanyViewModel>(model);
        }
        public static IEnumerable<CompanyViewModel> ToViewModelList(this IEnumerable<CompanyModel> modelList)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<CompanyModel, CompanyViewModel>());
            return modelList.Select(Mapper.Map<CompanyModel, CompanyViewModel>).AsQueryable();
        }

        public static CompanyModel ToModel(this CompanyViewModel vm)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<CompanyViewModel, CompanyModel>());
            return Mapper.Map<CompanyViewModel, CompanyModel>(vm);
        }
      
        #endregion

        #region LOV


        #region LOVItemValue
        //public static CompanyViewModel ToViewModel(this CompanyModel model)
        //{
        //    Mapper.Initialize(ifg => ifg.CreateMap<CompanyModel, CompanyViewModel>());
        //    return Mapper.Map<CompanyModel, CompanyViewModel>(model);
        //}
        public static List<LOVItemValueViewModel> ToViewModelList(this IEnumerable<LOVItemValueModel> modelList)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<LOVItemValueModel, LOVItemValueViewModel>());
            return modelList.Select(Mapper.Map<LOVItemValueModel, LOVItemValueViewModel>).ToList();
        }

        public static LOVItemValueModel ToModel(this LOVItemValueViewModel vm)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<LOVItemValueViewModel, LOVItemValueModel>());
            return Mapper.Map<LOVItemValueViewModel, LOVItemValueModel>(vm);
        }

        public static IEnumerable<LOVItemValueModel> ToModelList(this IEnumerable<LOVItemValueViewModel> vmList)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<LOVItemValueViewModel, LOVItemValueModel>());
            return vmList.Select(Mapper.Map<LOVItemValueViewModel, LOVItemValueModel>).AsQueryable();
        }


        #endregion

        #endregion

        #region CompanyContacts
        public static CompanyContactViewModel ToViewModel(this CompanyContactModel model)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<CompanyContactModel, CompanyContactViewModel>());
            return Mapper.Map<CompanyContactModel, CompanyContactViewModel>(model);
        }
        public static IEnumerable<CompanyContactViewModel> ToViewModelList(this IEnumerable<CompanyContactModel> modelList)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<CompanyContactModel, CompanyContactViewModel>());
            return modelList.Select(Mapper.Map<CompanyContactModel, CompanyContactViewModel>).AsQueryable();
        }

        public static CompanyContactModel ToModel(this CompanyContactViewModel vm)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<CompanyContactViewModel, CompanyContactModel>());
            return Mapper.Map<CompanyContactViewModel, CompanyContactModel>(vm);
        }

        #endregion
        #region Document
      
       
        public static DocumentModel ToModel(this DocumentViewModel vm)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<DocumentViewModel, DocumentModel>());
            return Mapper.Map<DocumentViewModel, DocumentModel>(vm);
        }

        public static DocumentViewModel ToViewModel(this DocumentModel model)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<DocumentModel, DocumentViewModel>());
            return Mapper.Map<DocumentModel, DocumentViewModel>(model);
        }

        public static IEnumerable<DocumentViewModel> ToViewModelList(this IEnumerable<DocumentModel> modelList)
        {
            Mapper.Initialize(ifg => ifg.CreateMap<DocumentModel, DocumentViewModel>());
            return modelList.Select(Mapper.Map<DocumentModel, DocumentViewModel>).AsQueryable();
        }

        #endregion




    }
}
