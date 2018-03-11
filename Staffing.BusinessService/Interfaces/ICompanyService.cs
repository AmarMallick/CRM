using Staffing.BusinessService.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Staffing.BusinessService.Interfaces
{
   public interface ICompanyService
    {


       IEnumerable<CompanyViewModel> GetAllCompaniesByLOVItemValueID(int lovItemValueId, int? page, int? limit, string sortBy, string direction, string searchString, out int total);
       int AddUpdateCompanyByLOVItemID(CompanyViewModel companyModel);
       IEnumerable<CompanyContactViewModel> GetAllContactByCompanyId(int companyId, int? page, int? limit, string sortBy, string direction, string searchString, out int total);
       int AddUpdateCompanyContact(CompanyContactViewModel companyContactViewModel);
       int DeleteCompanyByCompanyID(int companyId);
       int DeleteCompanyContactByContactID(int contactId);
       int AddUpdateCompanyMasterAgreement(DocumentViewModel documentViewModel);
       IEnumerable<DocumentViewModel> GetCompanyMasterAgreement(int companyId, int typeId, int? page, int? limit, string sortBy, string direction, string searchString, out int total);

       
    }
}
