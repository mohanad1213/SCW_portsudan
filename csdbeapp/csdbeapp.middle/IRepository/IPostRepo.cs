using csdbeapp.middle.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace csdbeapp.middle.IRepository
{
    
        public interface IPostRepo
        {
            List<Post> GetAll();
        List<Post> GetAllOrderd();
        Post Get(long id);
        }

}
