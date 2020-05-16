using csdbeapp.middle.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace csdbeapp.api.Model
{
    public class HomePage
    {


        public List<Post> PostList;
        public string UpdateTitle { get; set; }


        // Update time
        public double Updated { get; set; }






        // News Title and Desc
        public string NewsTitle { get; set; }
        public string NewsDesc { get; set; }



        // Map
        public string MapTitle { get; set; }
        public string MapDesc { get; set; }



        // Post Title and Desc
        public string PostTitle { get; set; }
        public string PostDesc { get; set; }

        // Post Title and Desc
        public string ContactTitle { get; set; }
        public string ContactDesc { get; set; }

        public string ContactNumber1Title { get; set; }
        public string ContactNumber2Title { get; set; }
        public string ContactNumber3Title { get; set; }

        public string ContactNumber1 { get; set; }
        public string ContactNumber2 { get; set; }
        public string ContactNumber3 { get; set; }




        // Statistical 
        public int Cases { get; set; }
        public int TodayCases { get; set; }
        public int Deaths { get; set; }
        public int Recovered { get; set; }
        public int Active { get; set; }
        public int Critical { get; set; }

    }
}
