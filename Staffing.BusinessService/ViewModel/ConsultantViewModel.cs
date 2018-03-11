using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Staffing.BusinessService.ViewModel
{
  public  class ConsultantViewModel
    {
        public long Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailId { get; set; }
        public string ContactNo { get; set; }
        public long LegalStatusId { get; set; }
        public string SSN { get; set; }
        public string WorkPhone { get; set; }
        public string HomePhone { get; set; }
        public DateTime VisaExpirationDate { get; set; }
        public double TotalExperience { get; set; }
        public long EmploymentTypeId { get; set; }
        public List<LOVItemValueViewModel> ConsultantType { get; set; }
        public int ConsultantTypeID { get; set; }
        public List<LOVItemValueViewModel> ConsultantClassification { get; set; }
        public int ConsultantClassificationID { get; set; }
        public List<LOVItemValueViewModel> EmploymentType { get; set; }
        public int EmploymentTypeID { get; set; }
        public String Feedback { get; set; }
        public List<CompanyViewModel> Vendors { get; set; }
        public int VendorId { get; set; }
        public List<LOVItemValueViewModel> LegalStatus { get; set; }

       
        public string PrimarySkills { get; set; }



    }
}
