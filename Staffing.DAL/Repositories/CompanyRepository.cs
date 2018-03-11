using Staffing.Core.Interfaces;
using Staffing.Core.Models;
using Staffing.DAL.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Staffing.DAL.Mappers;

namespace Staffing.DAL.Repositories
{
    public class CompanyRepository : ICompanyRepository
    {
        #region Private
        private readonly StaffingDBContext _staffingDB;
        #endregion

        public CompanyRepository(StaffingDBContext staffingDB)
        {
            _staffingDB = staffingDB;
        }

        public IEnumerable<CompanyModel> GetAllCompaniesByLOVItemValueID(int lovItemValueId)
        {


            var result = (from companies in _staffingDB.Companies
                       //   join lOVItemValue in _staffingDB.LOVItemValues on companies.RelationTypeId equals lOVItemValue.Id into comp

                         // from company in comp.DefaultIfEmpty()
                        

                          join companyAddress in _staffingDB.CompanyAddresses on companies.Id equals companyAddress.CompanyId into companyAdress

                          from compAdrr in companyAdress.DefaultIfEmpty()

                          join address in _staffingDB.Addresses on compAdrr.AddressId equals address.Id into addr

                          from address in addr.DefaultIfEmpty()

                          join companyContact in _staffingDB.CompanyContacts on companies.Id equals companyContact.CompanyId into cmpContact

                          from address1 in cmpContact.DefaultIfEmpty()


                          where companies.RelationTypeId == lovItemValueId

                          select new CompanyModel()
                          {

                              Id = companies.Id,
                              Name = companies.Name,
                              ContactPerson = companies.Name,
                              EmailId = companies.Email,
                              WorkPhone = companies.ContactNo,
                              WebSite = companies.Email,
                              Fax=address.Fax,
                              Address1=address.AddressLine1,
                              Address2=address.AddressLine2,
                              City=address.City,
                              Country=address.Country,
                              State= address.State,
                              ZipCode= address.ZipCode
                             

                          }).ToList();
             


            return result.ToList();


        }


        public int AddUpdateCompanyByLOVItemID(CompanyModel companyModel)
        {
            int result= 0;
            try
            {
                 result = _staffingDB.spCompanyDetailsSet(Convert.ToInt32(companyModel.Id), companyModel.Name, companyModel.WebSite, companyModel.EmailId, companyModel.WorkPhone, companyModel.Fax, companyModel.Address1, companyModel.Address2, companyModel.City, companyModel.State,companyModel.Country, companyModel.ZipCode, companyModel.RelationTypeID);
            }
            catch (Exception ex)
            {

                //throw ex.Message;
            }


           



            return result;

        }


        public IEnumerable<CompanyContactModel> GetAllContactByCompanyId(int companyId)
        {


            var result = _staffingDB.CompanyContacts.Where(m => m.CompanyId == companyId).ToModelList();
            
            


            return result;


        }

        public int AddUpdateCompanyContact(CompanyContactModel companyContactModel)
        {

            int result = _staffingDB.spCompanyContactSet(Convert.ToInt32(companyContactModel.Id), Convert.ToInt32(companyContactModel.CompanyId), companyContactModel.Name, companyContactModel.Email, companyContactModel.ContactNo,Convert.ToInt32(companyContactModel.TypeId), companyContactModel.IsPrimary);

            return result;



        }

        public int DeleteCompanyByCompanyID(int companyId)
        {

            var result = _staffingDB.spDeleteCompanyByCompanyId(companyId);

            return result;

        }

        public int DeleteCompanyContactByContactID(int contactId)
        {
            var result = _staffingDB.spDeleteCompanyContactByContactId(contactId);
            return result;

        }


        public IEnumerable<DocumentModel> GetCompanyMasterAgreement(int companyId, int typeId)
        {

            var document = (from companyDocument in _staffingDB.CompanyDocuments
                                join doc in _staffingDB.Documents on companyDocument.DocumentId equals doc.Id  into group1
                            from g1 in group1.DefaultIfEmpty()
                            where companyDocument.CompanyId==companyId && g1.TypeId==typeId

                                select new DocumentModel()
                                {
                                    Id = g1.Id,
                                    OriginalName= g1.OriginalName,
                                    FullPath= g1.FullPath,
                                    UploadedDate = g1.UploadedDate

                                }).ToList<DocumentModel>();

            return document;

        }



        public int AddUpdateCompanyMasterAgreement(DocumentModel documentModel )
        {

            var result = _staffingDB.spCompanyDocumentSet(Convert.ToInt32(documentModel.Id),Convert.ToInt32(documentModel.TypeId),documentModel.OriginalName,documentModel.FullPath,documentModel.IsSigned,true,documentModel.companyId);



            return result;
        }






    }
}
