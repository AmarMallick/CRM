using Staffing.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Staffing.Core.Interfaces
{
  public  interface IConsultantRepository
    {

       IEnumerable<CompanyModel> GetAllVendor(int LovItemValueId);
    }
}
