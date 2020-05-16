using System;
using System.Collections.Generic;
using System.Text;
using csdbeapp.middle.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace csdbeapp.middle.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            // Online
             optionsBuilder.UseSqlServer("Server=SQL6009.site4now.net;Database=DB_A3DC39_csdappDB;User Id=DB_A3DC39_csdappDB_admin;password=1213@Prog;MultipleActiveResultSets=true");

            // Offline Version:-
             // optionsBuilder.UseSqlServer("Server=.\\;Database=csdappDB;Trusted_Connection=True;User Id=sa;password=1;MultipleActiveResultSets=true");
        }

        public DbSet<News> News { get; set; }

        public DbSet<Post> Post { get; set; }

    }
}
