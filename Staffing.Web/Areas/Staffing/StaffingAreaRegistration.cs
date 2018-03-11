using System.Web.Mvc;

namespace Staffing.Web.Areas.Staffing
{
    public class StaffingAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Staffing";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {


           // context.MapRoute(
           //    "",
           //    "",
           //    defaults: new { controller = "Home", action = "Index", status = UrlParameter.Optional }
           //);

        }
    }
}