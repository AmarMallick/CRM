using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Staffing.BusinessService.ViewModel
{
    public class CompanyContactViewModel
    {
        public long Id { get; set; }

        public Nullable<long> CompanyId { get; set; }
        [Required(ErrorMessage = "Contact Name is required")]
        [RegularExpression("[a-zA-Z ]*$", ErrorMessage = "Special Characters and Numbers are not allowed")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Contact Email is required")]
        [RegularExpression(@"^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$", ErrorMessage = "Please Enter Correct Email Address")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Contact Number is required")]
        [StringLength(10, ErrorMessage = "The Mobile must contains 10 characters", MinimumLength = 10)]
        public string ContactNo { get; set; }
        [Required(ErrorMessage = "Type is required")]
        public Nullable<long> TypeId { get; set; }
        [Required(ErrorMessage = "Primary is required")]
        public bool IsPrimary { get; set; }
        public bool IsActive { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public System.DateTime ModifiedDate { get; set; }
        public List<LOVItemValueViewModel> ContactType { get; set; }


    }
}
