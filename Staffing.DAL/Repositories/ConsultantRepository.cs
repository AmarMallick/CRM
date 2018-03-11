using Staffing.Core.Interfaces;
using Staffing.Core.Models;
using Staffing.DAL.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Staffing.DAL.Repositories
{
    public class ConsultantRepository : IConsultantRepository
    {
        #region Private
        private readonly StaffingDBContext _staffingDB;
        #endregion


        #region Constructor
        public ConsultantRepository(StaffingDBContext staffingDB)
        {
            _staffingDB = staffingDB;
        }
        #endregion

        public IEnumerable<CompanyModel> GetAllVendor(int LovItemValueId)
        {

          var reult=from data in _staffingDB.Companies where data.RelationTypeId== LovItemValueId select new CompanyModel()
          {
              Id= data.Id,
              Name= data.Name
          };


          return reult.ToList();
        }

    }
}
