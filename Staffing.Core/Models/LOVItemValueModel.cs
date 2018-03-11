using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Staffing.Core.Models
{
  public  class LOVItemValueModel
    {
        public long Id { get; set; }
        public string ItemValue { get; set; }
        public long ItemId { get; set; }
        public Nullable<long> ParentId { get; set; }
        public bool IsActive { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public System.DateTime ModifiedDate { get; set; }
    }
}
