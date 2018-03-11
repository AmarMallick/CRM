using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace Staffing.BusinessService.ViewModel
{
    public class MenuViewModel
    {
        public long Id { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(50)]
        public string Name { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(50)]
        public string DisplayName { get; set; }
        [Required(ErrorMessage = "*")]
        public long ParentId { get; set; }
        public string ParentName { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(128)]
        public string LinkUrl { get; set; }
        [Required(ErrorMessage = "*")]
        [StringLength(128)]
        public string ImageUrl { get; set; }
        public bool IsActive { get; set; }
        public string CreatedBy { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "MM/dd/yyyy")]
        [Required(ErrorMessage = "*")]
        public System.DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public System.DateTime ModifiedDate { get; set; }
        public Nullable<int> DisplayOrder { get; set; }
    }
}
