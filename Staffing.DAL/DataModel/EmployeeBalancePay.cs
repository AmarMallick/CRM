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
    
    public partial class EmployeeBalancePay
    {
        public long Id { get; set; }
        public long EmployeeId { get; set; }
        public Nullable<decimal> TotalInvoiceRaised { get; set; }
        public Nullable<decimal> TotalInvoiceReceived { get; set; }
        public Nullable<decimal> TotalAmountPaid { get; set; }
        public Nullable<decimal> Balance { get; set; }
        public Nullable<decimal> FutureBalance { get; set; }
        public Nullable<decimal> BalanceAfterPayRoll { get; set; }
        public Nullable<decimal> ActualPay { get; set; }
        public Nullable<decimal> PromiseToPay { get; set; }
        public bool IsActive { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public System.DateTime ModifiedDate { get; set; }
    
        public virtual Employee Employee { get; set; }
    }
}
