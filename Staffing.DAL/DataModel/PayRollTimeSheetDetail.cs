//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Staffing.DAL.DataModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class PayRollTimeSheetDetail
    {
        public long Id { get; set; }
        public Nullable<long> PayRollId { get; set; }
        public Nullable<long> TimeSheetId { get; set; }
        public bool IsActive { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public System.DateTime ModifiedDate { get; set; }
    
        public virtual PayRoll PayRoll { get; set; }
        public virtual TimeSheet TimeSheet { get; set; }
    }
}
