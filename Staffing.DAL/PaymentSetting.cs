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
    
    public partial class PaymentSetting
    {
        public long Id { get; set; }
        public System.DateTime PayrollStartDate { get; set; }
        public int PayCycle { get; set; }
        public Nullable<int> NoOfDays { get; set; }
        public int PayPendingWeeks { get; set; }
        public int TotalTimeSheetsPending { get; set; }
        public decimal MaxNegativeBalance { get; set; }
        public Nullable<bool> HoldLastPayCheck { get; set; }
        public decimal MinimumFutureBalance { get; set; }
        public decimal WhomToTreatBalanceBordering { get; set; }
        public int Client_TotalNumberofMaxPenInvoices { get; set; }
        public decimal Client_MaxPendingAmount { get; set; }
        public int Client_MaxAgeofInvoice { get; set; }
        public int CashFlow { get; set; }
        public Nullable<bool> IsCitizenWaitPayment { get; set; }
        public Nullable<bool> IsCorpWaitPayment { get; set; }
        public decimal CitizenMaxUnpaidPayment { get; set; }
        public int CorpMinimumAging { get; set; }
        public int CorpMaxVendorAging { get; set; }
        public decimal CorpMaxUnpaidPayment { get; set; }
        public int CorpTypePrefence { get; set; }
        public Nullable<int> CitizenTypePrefence { get; set; }
        public Nullable<int> IsActive { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public Nullable<System.DateTime> Modifieddate { get; set; }
    }
}
