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
    
    public partial class EmployeeDocumentDetail
    {
        public long Id { get; set; }
        public long EmployeeId { get; set; }
        public Nullable<long> DocumentId { get; set; }
        public Nullable<long> StatusId { get; set; }
        public bool IsActive { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public System.DateTime ModifiedDate { get; set; }
    
        public virtual Document Document { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual LOVItemValue LOVItemValue { get; set; }
    }
}
