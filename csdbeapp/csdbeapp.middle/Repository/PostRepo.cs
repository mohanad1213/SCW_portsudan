using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using csdbeapp.middle.IRepository;
using csdbeapp.middle.Models;

namespace csdbeapp.middle.Repository
{
    public class PostRepo : BaseRepo, IPostRepo
    {
        public List<Post> GetAll()
        {
            return _db.Post.ToList();
        }

        public Post Get(long id)
        {
            return _db.Post.Find(id);
        }

        public List<Post> GetAllOrderd()
        {
            return _db.Post.OrderBy(a => a.Order).ToList();
        }
    }
}
