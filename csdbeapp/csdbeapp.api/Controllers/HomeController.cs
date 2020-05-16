using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using csdbeapp.api.Model;
using System.Net.Http;
using Newtonsoft.Json;
using System.Net.Http.Headers;
using System.Globalization;
using csdbeapp.middle.Common.Helper;
using csdbeapp.middle.IRepository;
using csdbeapp.middle.Repository;
using csdbeapp.middle.Common.Helper;

namespace csdbeapp.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {

        TimeHelper timeHelper = new TimeHelper();
        

        [HttpGet]
        public ActionResult<HomePage> Get()
        {

            PostRepo RepoPost = new PostRepo();
            try
            {
                using (HttpClient client = new HttpClient())
                {
                    client.BaseAddress = new Uri("https://corona.lmao.ninja/v2/countries/sudan");
                    MediaTypeWithQualityHeaderValue contentType = new MediaTypeWithQualityHeaderValue("application/json");
                    client.DefaultRequestHeaders.Accept.Add(contentType);
                    HttpResponseMessage response = client.GetAsync("").Result;
                    string stringData = response.Content.ReadAsStringAsync().Result;
                    HomePage home = JsonConvert.DeserializeObject<HomePage>(stringData);

                    home.UpdateTitle = "اخر تحديث للاحصاءات قبل: " +timeHelper.TimeAgoFromUnixtime(home.Updated);
                    home.MapTitle = "الخريطة التفاعلية قريباً";
                    home.MapDesc = "توضح كل الاماكن التي لا ينصح بالتجول حولها";
                    home.NewsTitle = "اخر الاخبار";
                    home.NewsDesc = "كل الاخبار من المصادر الرسمية";

                    //Map Secion
                    home.MapTitle = "الخريطة التفاعلية - قريباً";
                    home.NewsDesc = "خريطة توضح كل الاماكن التي ينصح بتجنبها";

                    // post Secion
                    home.PostTitle = "نصائح وارشادات عامة";
                    home.PostDesc = "الرجاء الاطلاع لتفادي الاصابة بالفايروس";

                    // Contact Section // For All 
                    //home.ContactTitle = "للاتصال";
                    //home.ContactDesc = "إذا كنت بشعر بالاعراض الرجاء الاتصال ليقومو بتوجيهك";
                    //home.ContactNumber1Title = "الخرطوم - 221";
                    //home.ContactNumber2Title = "الولايات - 9090";
                    //home.ContactNumber3Title = "الولايات - 9090";

                    //home.ContactNumber1 = "221";
                    //home.ContactNumber2 = "9090";

                    // For Portsudan Version
                    home.ContactTitle = "للاتصال";
                    home.ContactDesc = "إذا كنت بشعر بالاعراض الرجاء الاتصال ليقومو بتوجيهك";
                    home.ContactNumber1Title = "0123390015";
                    home.ContactNumber2Title = "0129129460";
                    home.ContactNumber3Title = "0122374116";

                    home.ContactNumber1 = "0123390015";
                    home.ContactNumber2 = "0129129460";
                    home.ContactNumber3 = "0122374116";



                    home.PostList = RepoPost.GetAllOrderd();


                    return Ok(home);
                }
            }
            catch (Exception ex)
            {

                return new HomePage()
                {
                    UpdateTitle = "خطاء في جلب البيانات",
                
                    
                };
            }
        }

      
        // POST: api/Home
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Home/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }


     
    }
}
