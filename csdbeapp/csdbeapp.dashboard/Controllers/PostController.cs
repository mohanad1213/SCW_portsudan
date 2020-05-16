using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using csdbeapp.middle.Data;
using csdbeapp.middle.Models;
using csdbeapp.middle.Repository;
using csdbeapp.middle.IRepository;
using Microsoft.AspNetCore.Authorization;

namespace csdbeapp.dashboard.Controllers
{
    //[Authorize(Roles ="Admin")]
    public class PostController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IPostRepo _PostRepo;

        public PostController(ApplicationDbContext context,IPostRepo postRepo)
        {
            _context = context;
            _PostRepo = postRepo;
        }


        // GET: News
        public IActionResult Index()
        {
            return View(_PostRepo.GetAll());
        }

       
        // GET: News/Details/5
        public async Task<IActionResult> Details(int id)
        {
           
            return View(_PostRepo.Get(id));
        }

        
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Title,Order,Content")] Post post)
        {
            if (ModelState.IsValid)
            {
                post.CreateDate = DateTime.UtcNow.AddHours(2);

                _context.Post.Add(post);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(post);
        }

        // GET: News/Edit/5
        public async Task<IActionResult> Edit(long id)
        {
          

            var news = await _context.Post.FindAsync(id);
            if (news == null)
            {
                return NotFound();
            }
            return View(news);
        }

        // POST: News/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Id,Title,Order,Content")] Post post)
        {
            if (id != post.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(post);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!NewsExists((int)post.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(post);
        }

        // GET: News/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var news = await _context.News
                .FirstOrDefaultAsync(m => m.Id == id);
            if (news == null)
            {
                return NotFound();
            }

            return View(news);
        }

        // POST: News/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
            var news = await _context.News.FindAsync(id);
            _context.News.Remove(news);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool NewsExists(long id)
        {
            return _context.News.Any(e => e.Id == id);
        }
    }
}
