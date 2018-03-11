using Staffing.BusinessService.Interfaces;
using Staffing.BusinessService.ViewModel;
using Staffing.Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Staffing.BusinessService.Mappers;

namespace Staffing.BusinessService.Services
{
   public class ConsultantService : IConsultantService
    {
        #region Private Members

       private readonly IConsultantRepository _consultantRepository;
       
        #endregion


       #region Constructor
       public ConsultantService(IConsultantRepository consultantRepository)
        {
            _consultantRepository = consultantRepository;
            
        }
        #endregion


       public IEnumerable<CompanyViewModel> GetAllVendor(int LovItemValueId)
       {

           var result= _consultantRepository.GetAllVendor(LovItemValueId) ;

           return result.ToViewModelList();
       }
    }
}
