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
    
    public partial class Address
    {
        public Address()
        {
            this.CompanyAddresses = new HashSet<CompanyAddress>();
            this.EmployeeAddresses = new HashSet<EmployeeAddress>();
            this.ProjectLocations = new HashSet<ProjectLocation>();
        }
    
        public long Id { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public string ZipCode { get; set; }
        public string Fax { get; set; }
        public bool IsActive { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public System.DateTime ModifiedDate { get; set; }
    
        public virtual ICollection<CompanyAddress> CompanyAddresses { get; set; }
        public virtual ICollection<EmployeeAddress> EmployeeAddresses { get; set; }
        public virtual ICollection<ProjectLocation> ProjectLocations { get; set; }
    }
}
