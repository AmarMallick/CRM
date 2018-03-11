﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class StaffingDBContext : DbContext
    {
        public StaffingDBContext()
            : base("name=StaffingDB")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Address> Addresses { get; set; }
        public virtual DbSet<Bill> Bills { get; set; }
        public virtual DbSet<BillPayment> BillPayments { get; set; }
        public virtual DbSet<BillPaymentDocument> BillPaymentDocuments { get; set; }
        public virtual DbSet<BillTimeSheetDetail> BillTimeSheetDetails { get; set; }
        public virtual DbSet<Budget> Budgets { get; set; }
        public virtual DbSet<Company> Companies { get; set; }
        public virtual DbSet<CompanyAddress> CompanyAddresses { get; set; }
        public virtual DbSet<CompanyContact> CompanyContacts { get; set; }
        public virtual DbSet<Document> Documents { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<EmployeeAddress> EmployeeAddresses { get; set; }
        public virtual DbSet<EmployeeBalancePay> EmployeeBalancePays { get; set; }
        public virtual DbSet<EmployeeDocumentDetail> EmployeeDocumentDetails { get; set; }
        public virtual DbSet<EmployeeFinanceBenefit> EmployeeFinanceBenefits { get; set; }
        public virtual DbSet<EmployeeFinanceDeal> EmployeeFinanceDeals { get; set; }
        public virtual DbSet<EmployeeFromVendor> EmployeeFromVendors { get; set; }
        public virtual DbSet<EmployeeProjectRate> EmployeeProjectRates { get; set; }
        public virtual DbSet<EmployeeQualificationDetail> EmployeeQualificationDetails { get; set; }
        public virtual DbSet<EmployeeSalary> EmployeeSalaries { get; set; }
        public virtual DbSet<EmployeeSkill> EmployeeSkills { get; set; }
        public virtual DbSet<Invoice> Invoices { get; set; }
        public virtual DbSet<InvoiceFollowUpDetail> InvoiceFollowUpDetails { get; set; }
        public virtual DbSet<InvoicePayment> InvoicePayments { get; set; }
        public virtual DbSet<InvoicePaymentDocument> InvoicePaymentDocuments { get; set; }
        public virtual DbSet<LOVItem> LOVItems { get; set; }
        public virtual DbSet<LOVItemValue> LOVItemValues { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<MenuActivity> MenuActivities { get; set; }
        public virtual DbSet<MenuActivityPermission> MenuActivityPermissions { get; set; }
        public virtual DbSet<PayCycle> PayCycles { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }
        public virtual DbSet<PaymentSetting> PaymentSettings { get; set; }
        public virtual DbSet<PayRoll> PayRolls { get; set; }
        public virtual DbSet<PayRollTimeSheetDetail> PayRollTimeSheetDetails { get; set; }
        public virtual DbSet<Project> Projects { get; set; }
        public virtual DbSet<ProjectDocument> ProjectDocuments { get; set; }
        public virtual DbSet<ProjectLocation> ProjectLocations { get; set; }
        public virtual DbSet<ProjectSetting> ProjectSettings { get; set; }
        public virtual DbSet<Requisition> Requisitions { get; set; }
        public virtual DbSet<RequisitionApproval> RequisitionApprovals { get; set; }
        public virtual DbSet<RequisitionDetail> RequisitionDetails { get; set; }
        public virtual DbSet<TimeSheet> TimeSheets { get; set; }
        public virtual DbSet<TimeSheetAlert> TimeSheetAlerts { get; set; }
        public virtual DbSet<TimeSheetDocument> TimeSheetDocuments { get; set; }
        public virtual DbSet<TimeSheetEntry> TimeSheetEntries { get; set; }
        public virtual DbSet<CompanyDocument> CompanyDocuments { get; set; }
    
        public virtual int spCompanyContactSet(Nullable<int> id, Nullable<int> companyId, string name, string email, string contactNo, Nullable<int> typeId, Nullable<bool> isPrimary)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(int));
    
            var companyIdParameter = companyId.HasValue ?
                new ObjectParameter("CompanyId", companyId) :
                new ObjectParameter("CompanyId", typeof(int));
    
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            var contactNoParameter = contactNo != null ?
                new ObjectParameter("ContactNo", contactNo) :
                new ObjectParameter("ContactNo", typeof(string));
    
            var typeIdParameter = typeId.HasValue ?
                new ObjectParameter("TypeId", typeId) :
                new ObjectParameter("TypeId", typeof(int));
    
            var isPrimaryParameter = isPrimary.HasValue ?
                new ObjectParameter("IsPrimary", isPrimary) :
                new ObjectParameter("IsPrimary", typeof(bool));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spCompanyContactSet", idParameter, companyIdParameter, nameParameter, emailParameter, contactNoParameter, typeIdParameter, isPrimaryParameter);
        }
    
        public virtual int spCompanyDetailsSet(Nullable<int> id, string name, string webSite, string emailId, string workPhone, string fax, string address1, string address2, string city, string state, string country, string zipCode, Nullable<int> relatiTypeID)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(int));
    
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            var webSiteParameter = webSite != null ?
                new ObjectParameter("WebSite", webSite) :
                new ObjectParameter("WebSite", typeof(string));
    
            var emailIdParameter = emailId != null ?
                new ObjectParameter("EmailId", emailId) :
                new ObjectParameter("EmailId", typeof(string));
    
            var workPhoneParameter = workPhone != null ?
                new ObjectParameter("WorkPhone", workPhone) :
                new ObjectParameter("WorkPhone", typeof(string));
    
            var faxParameter = fax != null ?
                new ObjectParameter("Fax", fax) :
                new ObjectParameter("Fax", typeof(string));
    
            var address1Parameter = address1 != null ?
                new ObjectParameter("Address1", address1) :
                new ObjectParameter("Address1", typeof(string));
    
            var address2Parameter = address2 != null ?
                new ObjectParameter("Address2", address2) :
                new ObjectParameter("Address2", typeof(string));
    
            var cityParameter = city != null ?
                new ObjectParameter("City", city) :
                new ObjectParameter("City", typeof(string));
    
            var stateParameter = state != null ?
                new ObjectParameter("State", state) :
                new ObjectParameter("State", typeof(string));
    
            var countryParameter = country != null ?
                new ObjectParameter("Country", country) :
                new ObjectParameter("Country", typeof(string));
    
            var zipCodeParameter = zipCode != null ?
                new ObjectParameter("ZipCode", zipCode) :
                new ObjectParameter("ZipCode", typeof(string));
    
            var relatiTypeIDParameter = relatiTypeID.HasValue ?
                new ObjectParameter("RelatiTypeID", relatiTypeID) :
                new ObjectParameter("RelatiTypeID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spCompanyDetailsSet", idParameter, nameParameter, webSiteParameter, emailIdParameter, workPhoneParameter, faxParameter, address1Parameter, address2Parameter, cityParameter, stateParameter, countryParameter, zipCodeParameter, relatiTypeIDParameter);
        }
    
        public virtual ObjectResult<string> spGetSideBarMenu(string rootUrl)
        {
            var rootUrlParameter = rootUrl != null ?
                new ObjectParameter("rootUrl", rootUrl) :
                new ObjectParameter("rootUrl", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("spGetSideBarMenu", rootUrlParameter);
        }
    
        public virtual int spMenuDelete(Nullable<long> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spMenuDelete", idParameter);
        }
    
        public virtual int spMenuInsert(ObjectParameter id, string name, string displayName, Nullable<long> parentId, string linkUrl, string imageUrl, Nullable<bool> isActive, string createdBy, Nullable<System.DateTime> createdDate, string modifiedBy, Nullable<System.DateTime> modifiedDate, Nullable<int> displayOrder)
        {
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            var displayNameParameter = displayName != null ?
                new ObjectParameter("DisplayName", displayName) :
                new ObjectParameter("DisplayName", typeof(string));
    
            var parentIdParameter = parentId.HasValue ?
                new ObjectParameter("ParentId", parentId) :
                new ObjectParameter("ParentId", typeof(long));
    
            var linkUrlParameter = linkUrl != null ?
                new ObjectParameter("LinkUrl", linkUrl) :
                new ObjectParameter("LinkUrl", typeof(string));
    
            var imageUrlParameter = imageUrl != null ?
                new ObjectParameter("ImageUrl", imageUrl) :
                new ObjectParameter("ImageUrl", typeof(string));
    
            var isActiveParameter = isActive.HasValue ?
                new ObjectParameter("IsActive", isActive) :
                new ObjectParameter("IsActive", typeof(bool));
    
            var createdByParameter = createdBy != null ?
                new ObjectParameter("CreatedBy", createdBy) :
                new ObjectParameter("CreatedBy", typeof(string));
    
            var createdDateParameter = createdDate.HasValue ?
                new ObjectParameter("CreatedDate", createdDate) :
                new ObjectParameter("CreatedDate", typeof(System.DateTime));
    
            var modifiedByParameter = modifiedBy != null ?
                new ObjectParameter("ModifiedBy", modifiedBy) :
                new ObjectParameter("ModifiedBy", typeof(string));
    
            var modifiedDateParameter = modifiedDate.HasValue ?
                new ObjectParameter("ModifiedDate", modifiedDate) :
                new ObjectParameter("ModifiedDate", typeof(System.DateTime));
    
            var displayOrderParameter = displayOrder.HasValue ?
                new ObjectParameter("DisplayOrder", displayOrder) :
                new ObjectParameter("DisplayOrder", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spMenuInsert", id, nameParameter, displayNameParameter, parentIdParameter, linkUrlParameter, imageUrlParameter, isActiveParameter, createdByParameter, createdDateParameter, modifiedByParameter, modifiedDateParameter, displayOrderParameter);
        }
    
        public virtual int spMenuUpdate(Nullable<long> id, string name, string displayName, Nullable<long> parentId, string linkUrl, string imageUrl, Nullable<bool> isActive, string createdBy, Nullable<System.DateTime> createdDate, string modifiedBy, Nullable<System.DateTime> modifiedDate, Nullable<int> displayOrder)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(long));
    
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            var displayNameParameter = displayName != null ?
                new ObjectParameter("DisplayName", displayName) :
                new ObjectParameter("DisplayName", typeof(string));
    
            var parentIdParameter = parentId.HasValue ?
                new ObjectParameter("ParentId", parentId) :
                new ObjectParameter("ParentId", typeof(long));
    
            var linkUrlParameter = linkUrl != null ?
                new ObjectParameter("LinkUrl", linkUrl) :
                new ObjectParameter("LinkUrl", typeof(string));
    
            var imageUrlParameter = imageUrl != null ?
                new ObjectParameter("ImageUrl", imageUrl) :
                new ObjectParameter("ImageUrl", typeof(string));
    
            var isActiveParameter = isActive.HasValue ?
                new ObjectParameter("IsActive", isActive) :
                new ObjectParameter("IsActive", typeof(bool));
    
            var createdByParameter = createdBy != null ?
                new ObjectParameter("CreatedBy", createdBy) :
                new ObjectParameter("CreatedBy", typeof(string));
    
            var createdDateParameter = createdDate.HasValue ?
                new ObjectParameter("CreatedDate", createdDate) :
                new ObjectParameter("CreatedDate", typeof(System.DateTime));
    
            var modifiedByParameter = modifiedBy != null ?
                new ObjectParameter("ModifiedBy", modifiedBy) :
                new ObjectParameter("ModifiedBy", typeof(string));
    
            var modifiedDateParameter = modifiedDate.HasValue ?
                new ObjectParameter("ModifiedDate", modifiedDate) :
                new ObjectParameter("ModifiedDate", typeof(System.DateTime));
    
            var displayOrderParameter = displayOrder.HasValue ?
                new ObjectParameter("DisplayOrder", displayOrder) :
                new ObjectParameter("DisplayOrder", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spMenuUpdate", idParameter, nameParameter, displayNameParameter, parentIdParameter, linkUrlParameter, imageUrlParameter, isActiveParameter, createdByParameter, createdDateParameter, modifiedByParameter, modifiedDateParameter, displayOrderParameter);
        }
    
        public virtual int spDeleteCompanyByCompanyId(Nullable<int> companyId)
        {
            var companyIdParameter = companyId.HasValue ?
                new ObjectParameter("CompanyId", companyId) :
                new ObjectParameter("CompanyId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spDeleteCompanyByCompanyId", companyIdParameter);
        }
    
        public virtual int spDeleteCompanyContactByContactId(Nullable<int> contactId)
        {
            var contactIdParameter = contactId.HasValue ?
                new ObjectParameter("ContactId", contactId) :
                new ObjectParameter("ContactId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spDeleteCompanyContactByContactId", contactIdParameter);
        }
    
        public virtual int spCompanyDocumentSet(Nullable<int> id, Nullable<int> typeId, string originalName, string fullPath, Nullable<bool> isSigned, Nullable<bool> isActive, Nullable<int> companyId)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(int));
    
            var typeIdParameter = typeId.HasValue ?
                new ObjectParameter("TypeId", typeId) :
                new ObjectParameter("TypeId", typeof(int));
    
            var originalNameParameter = originalName != null ?
                new ObjectParameter("OriginalName", originalName) :
                new ObjectParameter("OriginalName", typeof(string));
    
            var fullPathParameter = fullPath != null ?
                new ObjectParameter("FullPath", fullPath) :
                new ObjectParameter("FullPath", typeof(string));
    
            var isSignedParameter = isSigned.HasValue ?
                new ObjectParameter("IsSigned", isSigned) :
                new ObjectParameter("IsSigned", typeof(bool));
    
            var isActiveParameter = isActive.HasValue ?
                new ObjectParameter("IsActive", isActive) :
                new ObjectParameter("IsActive", typeof(bool));
    
            var companyIdParameter = companyId.HasValue ?
                new ObjectParameter("CompanyId", companyId) :
                new ObjectParameter("CompanyId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spCompanyDocumentSet", idParameter, typeIdParameter, originalNameParameter, fullPathParameter, isSignedParameter, isActiveParameter, companyIdParameter);
        }
    }
}