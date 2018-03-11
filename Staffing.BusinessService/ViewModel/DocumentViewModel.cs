using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Staffing.BusinessService.ViewModel
{
   public class DocumentViewModel
    {
        public long Id { get; set; }
        public Nullable<long> TypeId { get; set; }
        public string OriginalName { get; set; }
        public string FullPath { get; set; }
        public System.DateTime UploadedDate { get; set; }
        public bool IsSigned { get; set; }
        public bool IsActive { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public System.DateTime ModifiedDate { get; set; }

        public int companyId { get; set; }
    }
}
