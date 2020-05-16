using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using csdbeapp.api.Model;

namespace csdbeapp.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AboutAppController : ControllerBase
    {
        [HttpGet]
        public ActionResult<AboutAppPage> Get()
        {
            return new AboutAppPage()
            {
                AboutAppTitle = "عن التطبيق",
                AboutAppContent = "هذا التطبيق  غير رسمي فقط يقوم بنقل المعلومات والارشادات من وزاة الصحة السودانية لتوفير بعض المساعدة خلال فترة انتشار فيروس كرونا",
            };
        }
    }
}