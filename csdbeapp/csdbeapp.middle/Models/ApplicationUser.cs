using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;

namespace csdbeapp.middle.Models
{
    public class ApplicationUser:IdentityUser
    {
        public string FullName { get; set; }
    }
}
