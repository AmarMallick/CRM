using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Staffing.Core.Models
{
  public  class ConsultantModel
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
    }
}
