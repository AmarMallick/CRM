//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Staffing.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class InvoicePayment
    {
        public long Id { get; set; }
        public long InvoiceId { get; set; }
        public long PaymentId { get; set; }
        public bool IsActive { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public System.DateTime ModifiedDate { get; set; }
    
        public virtual Invoice Invoice { get; set; }
        public virtual Payment Payment { get; set; }
    }
}
