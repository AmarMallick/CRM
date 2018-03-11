using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Staffing.Core.Models;
namespace Staffing.Core.Interfaces
{
    public interface ILOVRepository
    {
        IEnumerable<LOVItemModel> GetAll();
        List<LOVItemValueModel> GetAllLOVItemValueByLOVID(List<long> lOVItemValues);
    }
}
