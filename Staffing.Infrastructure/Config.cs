using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;
namespace Staffing.Infrastructure
{
    public class Config
    {
        public static string ApplicationName { get { return WebConfigurationManager.AppSettings["ApplicationName"]; } }
    }
}
