using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Staffing.Web.Startup))]
namespace Staffing.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
