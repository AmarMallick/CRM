using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Staffing.Core.Models
{
   public class CompanyModel
    {
        public long Id { get; set; }
        public string Name { get; set; }

        public string ContactPerson { get; set; }
        public string EmailId { get; set; }

        public string WorkPhone { get; set; }
        public string WebSite { get; set; }

        public string Fax { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public int RelationTypeID { get; set; }



    }
}
