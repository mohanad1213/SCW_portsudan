using System;
using System.Collections.Generic;
using System.Text;

namespace csdbeapp.middle.Models
{
    public class Post
    {
        public long Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public int Order { get; set; }
        public DateTime CreateDate { get; set; }
        public ApplicationUser User { get; set; }
    }
}
