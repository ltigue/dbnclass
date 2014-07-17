using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(nclassthurs.Startup))]
namespace nclassthurs
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
