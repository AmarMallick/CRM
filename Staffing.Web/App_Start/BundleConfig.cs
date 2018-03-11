using System.Web;
using System.Web.Optimization;

namespace Staffing.Web
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            //bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
            //            "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate.min.js",
                        "~/Scripts/jquery.validate.unobtrusive.js*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Content/plugins/jQuery/jquery-2.2.3.min.js",
                      "~/Content/bootstrap/js/bootstrap.min.js",
                      "~/Scripts/grid-0.4.3.js",
                      "~/Content/plugins/iCheck/icheck.min.js"
                      ));
            bundles.Add(new ScriptBundle("~/bundles/gijgo").Include(
                     "~/Content/gijgo/js/grid.min.js",
                     "~/Content/gijgo/js/dialog.min.js",
                     "~/Content/gijgo/js/draggable.min.js"
                     ));
            bundles.Add(new ScriptBundle("~/bundles/charts").Include(
                      "~/Content/plugins/morris/morris.min.js",
                      "~/Content/plugins/sparkline/jquery.sparkline.min.js",
                      "~/Content/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js",
                      "~/Content/plugins/jvectormap/jquery-jvectormap-world-mill-en.js",
                      "~/Content/plugins/knob/jquery.knob.js"));

            bundles.Add(new ScriptBundle("~/bundles/controls").Include(
                      "~/Content/plugins/daterangepicker/daterangepicker.js",
                      "~/Content/plugins/datepicker/bootstrap-datepicker.js",
                      "~/Content/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js",
                      "~/Content/plugins/slimScroll/jquery.slimscroll.min.js",
                      "~/Content/plugins/fastclick/fastclick.js",
                      "~/Content/dist/js/app.min.js",
                      "~/Scripts/dialog.js",
                      "~/Scripts/draggable.js"));

            bundles.Add(new ScriptBundle("~/bundles/dashboard").Include(
                      "~/Content/dist/js/pages/dashboard.js",
                      "~/Content/dist/js/demo.js"));

            bundles.Add(new StyleBundle("~/styles/css").Include(
                      "~/Content/bootstrap/css/bootstrap.css",
                      "~/Content/dist/css/AdminLTE.min.css",
                       "~/Content/Basic.css"));

            bundles.Add(new StyleBundle("~/styles/skinscss").Include(
                      "~/Content/plugins/iCheck/square/blue.css"));

            bundles.Add(new StyleBundle("~/styles/adminskinscss").Include(
                      "~/Content/dist/css/skins/_all-skins.min.css"));

            bundles.Add(new StyleBundle("~/styles/chartscss").Include(
                      "~/Content/plugins/iCheck/flat/blue.css",
                      "~/Content/plugins/morris/morris.css",
                      "~/Content/plugins/jvectormap/jquery-jvectormap-1.2.2.css"));

            bundles.Add(new StyleBundle("~/styles/controlscss").Include(
                      "~/Content/plugins/daterangepicker/daterangepicker.css",
                      "~/Content/plugins/datepicker/datepicker3.css",
                      "~/Content/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css",
                      "~/Content/grid-0.4.3.css",
                      "~/Content/dialog.css"));
            bundles.Add(new StyleBundle("~/styles/gijgocss").Include(
                     "~/Content/gijgo/css/grid.min.css",
                     "~/Content/gijgo/css/dialog.min.css"));
        }
    }
}
