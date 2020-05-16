using System;
using System.Collections.Generic;
using System.Text;
using csdbeapp.middle.Data;
using Microsoft.EntityFrameworkCore;

namespace csdbeapp.middle.Repository
{
    public abstract class BaseRepo
    {
        protected readonly ApplicationDbContext _db;
        public BaseRepo()
        {
            _db = new ApplicationDbContext(options: new DbContextOptions<ApplicationDbContext>());
        }
    }
}
