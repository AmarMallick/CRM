using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Staffing.Core.Interfaces;
using Staffing.Core.Models;
using Staffing.DAL.DataModel;
using Staffing.DAL.Mappers;

namespace Staffing.DAL.Repositories
{
    public class LOVRepository:ILOVRepository
    {
         #region Private
        private readonly StaffingDBContext _staffingDB;
        #endregion

        public LOVRepository(StaffingDBContext staffingDB)
        {
            _staffingDB = staffingDB;
        }



        public IEnumerable<LOVItemModel> GetAll()
        {
            return null;
        }

        public List<LOVItemValueModel>GetAllLOVItemValueByLOVID(List<long> lOVItemValues )
        {

            var result = _staffingDB.LOVItemValues.Where(m => lOVItemValues.Contains(m.ItemId)).ToList();

            return result.ToModelList();

        }
    }
}
