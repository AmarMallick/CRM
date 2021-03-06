﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Staffing.BusinessService.ViewModel
{
    public class MenuActivityViewModel
    {
        public long Id { get; set; }
        public long MenuId { get; set; }
        public long MenuActivityId { get; set; }
        public bool IsActive { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public System.DateTime ModifiedDate { get; set; }
    }
}
