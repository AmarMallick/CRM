using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Staffing.Web.Areas.Staffing.Models
{
    public class MenuModelSingle
    {
        public int id { get; set; }

        public string Name { get; set; }

        public int ParentId { get; set; }

        public List<string> SubMenu { get; set; }
    }

    public class MenuModel
    {
        public MenuModelSingle MenuModelSingle { get; set; }

        public List<MenuModelSingle> MenuList { get; set; }

    }
}