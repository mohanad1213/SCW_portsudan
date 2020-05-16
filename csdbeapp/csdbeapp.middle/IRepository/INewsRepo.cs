using csdbeapp.middle.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace csdbeapp.middle.IRepository
{
    public interface INewsRepo
    {
        List<News> GetAll();
        List<News> GetAllOrderd();
        News Get(long id);
    }
}
