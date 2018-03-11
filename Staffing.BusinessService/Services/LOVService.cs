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
    public class LOVService : ILOVService
    {
         #region Private Members

        private readonly ILOVRepository _LOVRepository;
       
        #endregion


       #region Constructor
        public LOVService(ILOVRepository lOVRepository)
        {
            _LOVRepository = lOVRepository;
            
        }
        #endregion


        #region 

        public List<LOVItemValueViewModel> GetAllLOVItemValueByLOVID(List<long> lOVItemValues)
        {


            var result = _LOVRepository.GetAllLOVItemValueByLOVID(lOVItemValues).ToViewModelList();

            return result;



        }
#endregion 

    }
}
