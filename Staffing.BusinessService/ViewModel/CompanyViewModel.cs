using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Staffing.BusinessService.ViewModel
{
   public class CompanyViewModel
    {
        public long Id { get; set; }

       [Required(ErrorMessage = "Name is required")]
       [RegularExpression("[a-zA-Z ]*$", ErrorMessage = "Special Characters and Numbers are not allowed")]
        public string Name { get; set; }

       
        public string ContactPerson { get; set; }

        [Required(ErrorMessage = "Email is required")]
        [RegularExpression(@"^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$", ErrorMessage = "Please Enter Correct Email Address")]
        public string EmailId { get; set; }

        [Required(ErrorMessage = "Phone Number is required")]
        [StringLength(10, ErrorMessage = "The Mobile must contains 10 characters", MinimumLength = 10)]
        public string WorkPhone { get; set; }

        [Required(ErrorMessage = "Website is required")]
        public string WebSite { get; set; }

       
        public string Fax { get; set; }

        [Required(ErrorMessage = "Address1 is required")]
        public string Address1  { get; set; }

        [Required(ErrorMessage = "Address2 is required")]
        public string Address2 { get; set; }

        [Required(ErrorMessage = "City is required")]
        public string City { get; set; }

        [Required(ErrorMessage = "State is required")]
        public string State { get; set; }

        [Required(ErrorMessage = "Country is required")]
        public string Country { get; set; }

        
        public string ZipCode { get; set; }

        public int RelationTypeID { get; set; }
       
        public List<LOVItemValueViewModel> CountryList { get; set; }
        
        public List<LOVItemValueViewModel> StateList { get; set; }

        public CompanyContactViewModel companyContactViewModel { get; set; }
    }
}
