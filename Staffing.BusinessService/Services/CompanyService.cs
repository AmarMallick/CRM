using Staffing.BusinessService.Interfaces;
using Staffing.BusinessService.ViewModel;
using Staffing.Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Staffing.BusinessService.Mappers;
using Staffing.Infrastructure.Model;

namespace Staffing.BusinessService.Services
{
   public class CompanyService: ICompanyService
    { 
       
       #region Private Members

        private readonly ICompanyRepository _companyRepository;
       
        #endregion


       #region Constructor
        public CompanyService(ICompanyRepository companyRepository)
        {
            _companyRepository = companyRepository;
            
        }
        #endregion


        public IEnumerable<CompanyViewModel> GetAllCompaniesByLOVItemValueID(int lovItemValueId, int? page, int? limit, string sortBy, string direction, string searchString, out int total)
       {


           var records = _companyRepository.GetAllCompaniesByLOVItemValueID(lovItemValueId).ToViewModelList();

           total = records.Count();
           if (!string.IsNullOrWhiteSpace(searchString))
           {
               records = records.Where(p => p.Name.Contains(searchString) );
           }
           if (!string.IsNullOrEmpty(sortBy) && !string.IsNullOrEmpty(direction))
           {
               if (direction.Trim().ToLower() == "asc")
               {
                   records = SortHelper.OrderBy(records.AsQueryable(), sortBy);
               }
               else
               {
                   records = SortHelper.OrderByDescending(records.AsQueryable(), sortBy);
               }
           }
           if (page.HasValue && limit.HasValue)
           {
               int start = (page.Value - 1) * limit.Value;
               records = records.Skip(start).Take(limit.Value);
           }
           var result = records.ToList();
           return result;


       }


        public int AddUpdateCompanyByLOVItemID(CompanyViewModel companyViewModel)
        {


            return _companyRepository.AddUpdateCompanyByLOVItemID(companyViewModel.ToModel());

        }


        public IEnumerable<CompanyContactViewModel> GetAllContactByCompanyId(int companyId, int? page, int? limit, string sortBy, string direction, string searchString, out int total)
        {

            var records = _companyRepository.GetAllContactByCompanyId(companyId).ToViewModelList();

            total = records.Count();
            if (!string.IsNullOrWhiteSpace(searchString))
            {
                records = records.Where(p => p.Name.Contains(searchString));
            }
            if (!string.IsNullOrEmpty(sortBy) && !string.IsNullOrEmpty(direction))
            {
                if (direction.Trim().ToLower() == "asc")
                {
                    records = SortHelper.OrderBy(records.AsQueryable(), sortBy);
                }
                else
                {
                    records = SortHelper.OrderByDescending(records.AsQueryable(), sortBy);
                }
            }
            if (page.HasValue && limit.HasValue)
            {
                int start = (page.Value - 1) * limit.Value;
                records = records.Skip(start).Take(limit.Value);
            }
            var result = records.ToList();
            return result;


            
        }


       public int  AddUpdateCompanyContact(CompanyContactViewModel companyContactViewModel)
        {


            var result = _companyRepository.AddUpdateCompanyContact(companyContactViewModel.ToModel());

            return result;

        }



      public int DeleteCompanyByCompanyID(int companyId)
       {
         return  _companyRepository.DeleteCompanyByCompanyID(companyId);

       }
       public int DeleteCompanyContactByContactID(int contactId)
      {

          return _companyRepository.DeleteCompanyContactByContactID(contactId);

      }


      public int AddUpdateCompanyMasterAgreement(DocumentViewModel documentViewModel )
       {

           return _companyRepository.AddUpdateCompanyMasterAgreement(documentViewModel.ToModel());




       }

      public IEnumerable<DocumentViewModel> GetCompanyMasterAgreement(int companyId, int typeId ,int? page, int? limit, string sortBy, string direction, string searchString, out int total)
      {
          var records = _companyRepository.GetCompanyMasterAgreement(companyId,typeId).ToViewModelList();
          
          total = records.Count();
          if (!string.IsNullOrWhiteSpace(searchString))
          {
              records = records.Where(p => p.OriginalName.Contains(searchString));
          }
          if (!string.IsNullOrEmpty(sortBy) && !string.IsNullOrEmpty(direction))
          {
              if (direction.Trim().ToLower() == "asc")
              {
                  records = SortHelper.OrderBy(records.AsQueryable(), sortBy);
              }
              else
              {
                  records = SortHelper.OrderByDescending(records.AsQueryable(), sortBy);
              }
          }
          if (page.HasValue && limit.HasValue)
          {
              int start = (page.Value - 1) * limit.Value;
              records = records.Skip(start).Take(limit.Value);
          }
          var result = records.ToList();
          return result;

        


      }

       




    }
}
