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
    
    public partial class LOVItem
    {
        public LOVItem()
        {
            this.LOVItemValues = new HashSet<LOVItemValue>();
        }
    
        public long Id { get; set; }
        public string ItemName { get; set; }
        public string Description { get; set; }
        public long SortOrder { get; set; }
        public bool IsActive { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public System.DateTime ModifiedDate { get; set; }
    
        public virtual ICollection<LOVItemValue> LOVItemValues { get; set; }
    }
}
