using Staffing.BusinessService.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Staffing.BusinessService.Interfaces
{
   public interface ILOVService
    {
       List<LOVItemValueViewModel> GetAllLOVItemValueByLOVID(List<long> lOVItemValues);
    }
}
