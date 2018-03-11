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
    
    public partial class Document
    {
        public Document()
        {
            this.BillPaymentDocuments = new HashSet<BillPaymentDocument>();
            this.EmployeeDocumentDetails = new HashSet<EmployeeDocumentDetail>();
            this.InvoicePaymentDocuments = new HashSet<InvoicePaymentDocument>();
            this.ProjectDocuments = new HashSet<ProjectDocument>();
            this.TimeSheetDocuments = new HashSet<TimeSheetDocument>();
        }
    
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
    
        public virtual ICollection<BillPaymentDocument> BillPaymentDocuments { get; set; }
        public virtual LOVItemValue LOVItemValue { get; set; }
        public virtual ICollection<EmployeeDocumentDetail> EmployeeDocumentDetails { get; set; }
        public virtual ICollection<InvoicePaymentDocument> InvoicePaymentDocuments { get; set; }
        public virtual ICollection<ProjectDocument> ProjectDocuments { get; set; }
        public virtual ICollection<TimeSheetDocument> TimeSheetDocuments { get; set; }
    }
}