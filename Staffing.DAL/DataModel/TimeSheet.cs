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
    
    public partial class TimeSheet
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TimeSheet()
        {
            this.BillTimeSheetDetails = new HashSet<BillTimeSheetDetail>();
            this.PayRollTimeSheetDetails = new HashSet<PayRollTimeSheetDetail>();
            this.TimeSheetAlerts = new HashSet<TimeSheetAlert>();
            this.TimeSheetDocuments = new HashSet<TimeSheetDocument>();
            this.TimeSheetEntries = new HashSet<TimeSheetEntry>();
        }
    
        public long Id { get; set; }
        public string DisplayName { get; set; }
        public System.DateTime StartDate { get; set; }
        public System.DateTime EndDate { get; set; }
        public long ProjectId { get; set; }
        public long EmployeeId { get; set; }
        public string Notes { get; set; }
        public Nullable<long> StatusId { get; set; }
        public Nullable<System.DateTime> UploadedDate { get; set; }
        public bool IsActive { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public System.DateTime ModifiedDate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BillTimeSheetDetail> BillTimeSheetDetails { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual LOVItemValue LOVItemValue { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PayRollTimeSheetDetail> PayRollTimeSheetDetails { get; set; }
        public virtual Project Project { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TimeSheetAlert> TimeSheetAlerts { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TimeSheetDocument> TimeSheetDocuments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TimeSheetEntry> TimeSheetEntries { get; set; }
    }
}