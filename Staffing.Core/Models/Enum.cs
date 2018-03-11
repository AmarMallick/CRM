using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Staffing.Core.Models
{
    public enum LovItem
    {
        Company = 1,
        Country = 2,
        State = 3,
        ContactType = 4,
        ConsultantType = 5,
        ConsultantClasification=6,
        EmploymentType=7,
        LegalStatus=8

    }
    public enum LovItemValue
    {
        Client = 1,
        Vendor = 2,
        India = 3,
        USA = 4,
        FullTime = 89,
        C1099 = 90,
        CorpToCorp = 91


    }
}
