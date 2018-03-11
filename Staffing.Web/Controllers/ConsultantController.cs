using Staffing.BusinessService.Interfaces;
using Staffing.BusinessService.ViewModel;
using Staffing.Core.Models;
using Staffing.Web.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Staffing.Web.Controllers
{
    public class ConsultantController : Controller
    {

         #region Private
        private readonly IConsultantService _consultantService;
        private readonly ILOVService _lOVService;

        #endregion

        #region Constructor
        public ConsultantController( ILOVService lOVService,IConsultantService consultantService)
        {
            _consultantService = consultantService;
            _lOVService = lOVService;

        }

        #endregion




        #region Methods

        // GET: Consultant
        public ActionResult Index()
        {
            ViewBag.Title = "Consultant";
            ConsultantViewModel consultantViewModel = new ConsultantViewModel();
            List<long> LOVIds = new List<long>() { Convert.ToInt32(LovItem.ConsultantType), Convert.ToInt32(LovItem.LegalStatus), Convert.ToInt32(LovItem.ConsultantClasification), Convert.ToInt32(LovItem.EmploymentType) };
      

            try
            {
                

                
                var LOVItemValuesList = _lOVService.GetAllLOVItemValueByLOVID(LOVIds);
                consultantViewModel.ConsultantType = LOVItemValuesList.Where(m=>m.ItemId==Convert.ToInt32(LovItem.ConsultantType)).ToList();
                consultantViewModel.Vendors = _consultantService.GetAllVendor(Convert.ToInt32(LovItemValue.Vendor)).ToList();
                consultantViewModel.LegalStatus = LOVItemValuesList.Where(m => m.ItemId == Convert.ToInt32(LovItem.LegalStatus)).ToList();
                consultantViewModel.ConsultantClassification = LOVItemValuesList.Where(m => m.ItemId == Convert.ToInt32(LovItem.ConsultantClasification)).ToList();
                consultantViewModel.EmploymentType = LOVItemValuesList.Where(m => m.ItemId == Convert.ToInt32(LovItem.EmploymentType)).ToList();
            }
            catch (Exception ex)
            {
                Logger.Error(ex);

            }
           
            return View(consultantViewModel);
        }

        #endregion
    }
}