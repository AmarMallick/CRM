using Staffing.BusinessService.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Staffing.BusinessService.ViewModel;
using System.IO;
using Staffing.Core.Models;

namespace Staffing.Web.Controllers
{
    public class VendorController : Controller
    {

        #region Private
        private readonly ICompanyService _companyService;
        private readonly ILOVService _lOVService;

        #endregion

        #region Constructor
        public VendorController(ICompanyService companyService, ILOVService lOVService)
        {
            _companyService = companyService;
            _lOVService = lOVService;

        }

        #endregion
        
        #region Methods

        // GET: Company
        public ActionResult Index()
        {
            ViewBag.Title = "Vendor";
            List<long> LOVIds = new List<long>() { Convert.ToInt32(LovItem.Country), Convert.ToInt32(LovItem.State), Convert.ToInt32(LovItem.ContactType) };



            CompanyViewModel companyViewModel = new CompanyViewModel();
            CompanyContactViewModel companyContactViewModel = new CompanyContactViewModel();

            var LOVItemValuesList = _lOVService.GetAllLOVItemValueByLOVID(LOVIds);
            companyViewModel.CountryList = LOVItemValuesList.Where(m => m.ItemId == Convert.ToInt32(LovItem.Country)).ToList();
            companyViewModel.StateList = LOVItemValuesList.Where(m => m.ItemId == Convert.ToInt32(LovItem.State)).ToList();
            companyContactViewModel.ContactType = LOVItemValuesList.Where(m => m.ItemId == Convert.ToInt32(LovItem.ContactType)).ToList();
            companyViewModel.companyContactViewModel = companyContactViewModel;
            return View(companyViewModel);
        }
        
        [HttpGet]
        public JsonResult GetCompaniesByLOVItemValueID(int? page, int? limit, string sortBy, string direction, string searchString = null)
        {
            int lovItemValueId = Convert.ToInt32(LovItemValue.Vendor);
            int total;
            var records = _companyService.GetAllCompaniesByLOVItemValueID(lovItemValueId, page, limit, sortBy, direction, searchString, out total);
            return Json(new { records, total }, JsonRequestBehavior.AllowGet);
        }

        //[ValidateAjax]
        public ActionResult CreateUpdateCompany(CompanyViewModel companyViewModel)
        {
            int result = 0;
            if (ModelState.IsValid)
            {
                companyViewModel.RelationTypeID = Convert.ToInt32(LovItemValue.Vendor);
                result = _companyService.AddUpdateCompanyByLOVItemID(companyViewModel);
                return Json(result, JsonRequestBehavior.AllowGet);
            }
            return Json(companyViewModel, JsonRequestBehavior.AllowGet);





        }

        public ActionResult GetStatesByCountryId(string countryId)
        {

            if (!string.IsNullOrWhiteSpace(countryId))
            {

                List<long> LOVIds = new List<long>() { Convert.ToInt32(LovItem.State) };




                var states = _lOVService.GetAllLOVItemValueByLOVID(LOVIds).Where(m => m.ParentId == Convert.ToInt64(countryId)).OrderBy(m => m.ItemValue).ToList();
                return Json(states, JsonRequestBehavior.AllowGet);
            }
            else

                return Json("Not Found", JsonRequestBehavior.AllowGet);





        }

        [HttpGet]
        public JsonResult GetContactByCompanyID(string companyId, int? page, int? limit, string sortBy, string direction, string searchString = null)
        {

            int total;
            var records = _companyService.GetAllContactByCompanyId(Convert.ToInt32(companyId), page, limit, sortBy, direction, searchString, out total);
            return Json(new { records, total }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult CreateUpadateCompanyContact(CompanyContactViewModel companyContactViewModel)
        {
            var result = _companyService.AddUpdateCompanyContact(companyContactViewModel);

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteCompany(int companyId)
        {


            var result = _companyService.DeleteCompanyByCompanyID(companyId);

            return Json(result, JsonRequestBehavior.AllowGet);


        }

        public ActionResult DeleteCompanyContact(int contactId)
        {



            var result = _companyService.DeleteCompanyContactByContactID(contactId);

            return Json(result, JsonRequestBehavior.AllowGet);


        }

        public ActionResult GetMasterAgreementByCompanyId(int companyId, int? page, int? limit, string sortBy, string direction, string searchString = null)
        {

            var typeId = Convert.ToInt32(LovItemValue.Vendor);

            int total;

            var records = _companyService.GetCompanyMasterAgreement(companyId, typeId, page, limit, sortBy, direction, searchString, out total);

            foreach (var item in records)
            {
                item.UploadedDate = Convert.ToDateTime(item.UploadedDate.ToShortDateString());

            }

            return Json(new { records, total }, JsonRequestBehavior.AllowGet);



        }

        public ActionResult AddUpdateCompanyMasterAgreement()
        {
            DocumentViewModel documentViewModel = new DocumentViewModel();
            documentViewModel.TypeId = Convert.ToInt32(LovItemValue.Vendor);
            documentViewModel.IsSigned = true;

            // Checking no of files injected in Request object  
            if (Request.Files.Count > 0)
            {
                try
                {
                    documentViewModel.companyId = Convert.ToInt32(Request.Form.GetValues(0)[0]);
                    //  Get all files from Request object  
                    HttpFileCollectionBase files = Request.Files;
                    for (int i = 0; i < files.Count; i++)
                    {
                        //string path = AppDomain.CurrentDomain.BaseDirectory + "Uploads/";  
                        //string filename = Path.GetFileName(Request.Files[i].FileName);  

                        HttpPostedFileBase file = files[i];
                        string fname;

                        // Checking for Internet Explorer  
                        if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                        {
                            string[] testfiles = file.FileName.Split(new char[] { '\\' });
                            fname = testfiles[testfiles.Length - 1];
                        }
                        else
                        {
                            fname = file.FileName;
                        }

                        // Get the complete folder path and store the file inside it.
                        documentViewModel.OriginalName = fname;
                        fname = Path.Combine(Server.MapPath("~/Uploads/"), fname);
                        documentViewModel.FullPath = fname;
                        file.SaveAs(fname);
                    }

                    var result = _companyService.AddUpdateCompanyMasterAgreement(documentViewModel);


                    // Returns message that successfully uploaded  
                    return Json(result);
                }
                catch (Exception ex)
                {
                    return Json("Error occurred. Error details: " + ex.Message);
                }
            }
            else
            {
                return Json("No files selected.");
            }






        }

        public FileResult Download(string ImageName)
        {
            var dir = new System.IO.DirectoryInfo(Server.MapPath("~/Uploads/"));


            return File(dir + ImageName, "application/pdf", ImageName);

        }

        #endregion

    }
}