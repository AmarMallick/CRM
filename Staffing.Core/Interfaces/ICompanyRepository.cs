using Staffing.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Staffing.Core.Interfaces
{
    public interface ICompanyRepository
    {
        IEnumerable<CompanyModel> GetAllCompaniesByLOVItemValueID(int lovItemValueId);
        int AddUpdateCompanyByLOVItemID(CompanyModel companyModel);
        IEnumerable<CompanyContactModel> GetAllContactByCompanyId(int companyId);
        int AddUpdateCompanyContact(CompanyContactModel companyContactModel);
        int DeleteCompanyByCompanyID(int companyId);
        int DeleteCompanyContactByContactID(int contactId);
        int AddUpdateCompanyMasterAgreement(DocumentModel documentModel);
        IEnumerable<DocumentModel> GetCompanyMasterAgreement(int companyId, int typeId);
    }
}
