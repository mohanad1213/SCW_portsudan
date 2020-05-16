using csdbeapp.middle.IRepository;
using csdbeapp.middle.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.EntityFrameworkCore;

namespace csdbeapp.middle.Repository
{
    public class NewsRepo : BaseRepo,INewsRepo
    {
        public List<News> GetAll()
        {
            return _db.News.ToList();
        }

        public News Get(long id)
        {
            return _db.News.Find(id);
        }

        public List<News> GetAllOrderd()
        {
            return _db.News.OrderBy(a => a.Order).ToList();
        }
    }
}
