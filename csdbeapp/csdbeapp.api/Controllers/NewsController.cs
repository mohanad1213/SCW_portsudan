using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using csdbeapp.middle.IRepository;
using csdbeapp.middle.Repository;
using csdbeapp.middle.Models;

namespace csdbeapp.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NewsController : ControllerBase
    {

        private readonly INewsRepo _NewsRepo;

        public NewsController( INewsRepo NewRepo)
        {
            
            _NewsRepo = NewRepo;
        }

        [HttpGet]
        public ActionResult<List<News>> Get()
        {
            return _NewsRepo.GetAllOrderd();
        }

        [HttpGet("{id}", Name = "Get")]
        public ActionResult<News> Get(long id)
        {
            return _NewsRepo.Get(id);
        }


    }
}
