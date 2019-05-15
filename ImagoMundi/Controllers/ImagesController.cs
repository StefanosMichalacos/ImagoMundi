using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ImagoMundi.Data;
using ImagoMundi.Models;
using Microsoft.AspNetCore.Identity;
using ImagoMundi.Helpers;
using Microsoft.AspNetCore.Http;
using System.IO;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Authorization;

namespace ImagoMundi.Controllers
{
    [Authorize(Roles = "Owner,Administrator,Manager")]
    public class ImagesController : Controller
    {
        // SignInManager<IdentityUser> SignInManager;
        private readonly UserManager<AppUser> _UserManager;
        private readonly ApplicationDbContext _context;
        private IHostingEnvironment _hostingEnvironment;

        public ImagesController(ApplicationDbContext context, UserManager<AppUser> userManager, IHostingEnvironment environment)
        {
            _UserManager = userManager;
            _context = context;
            _hostingEnvironment = environment;
        }

        // GET: Images
        public async Task<IActionResult> Index()
        {
            GC.Collect();
            Dispose();
            return View(await _context.Images.ToListAsync());
        }

        // GET: Images/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var image = await _context.Images
                .FirstOrDefaultAsync(m => m.Id == id);
            if (image == null)
            {
                return NotFound();
            }

            return View(image);
        }

        // GET: Images/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Images/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ImageId,Path,Id,Name,Description,File")] Image image, IFormFile file)
        {
            var uploadPath = Path.Combine(AppSettings.IMAGE_FOLDER_NAME, image.Path, file.FileName);
            image.Path = Path.Combine("\\", AppSettings.IMAGE_FOLDER_NAME, image.Path, file.FileName);
            image.Path = image.Path.Replace("\\", "/");
            if (ModelState.IsValid)
            {
                image.DateCreated = EditHelper<Image>.GetPresentDateTime();
                image.DateUpdated = EditHelper<Image>.GetPresentDateTime();
                image.CreatedById = Guid.Parse(_UserManager.GetUserId(User));
                image.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));

                _context.Add(image);
                await _context.SaveChangesAsync();

                await UploadImage(file, uploadPath);
                return RedirectToAction(nameof(Index));
            }
            return View(image);
        }

        // GET: Images/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var image = await _context.Images.FindAsync(id);
            if (image == null)
            {
                return NotFound();
            }
            return View(image);
        }

        // POST: Images/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ImageId,Path,Id,Name,Description")] Image image)
        {
            if (id != image.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    image.DateUpdated = EditHelper<Image>.GetPresentDateTime(); ;
                    image.DateCreated = EditHelper<Image>.GetDateCreated(_context, id);
                    image.CreatedById = EditHelper<Image>.GetCreatedById(_context, id);
                    image.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));

                    _context.Update(image);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ImageExists(image.Id))
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
            return View(image);
        }

        // GET: Images/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var image = await _context.Images
                .FirstOrDefaultAsync(m => m.Id == id);
            if (image == null)
            {
                return NotFound();
            }

            return View(image);
        }

        // POST: Images/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var image = await _context.Images.FindAsync(id);
            _context.Images.Remove(image);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ImageExists(int id)
        {
            return _context.Images.Any(e => e.Id == id);
        }

        [HttpPost]
        public async Task<IActionResult> UploadImage(IFormFile file, string path)
        {
            var uploadPath = Path.Combine(_hostingEnvironment.WebRootPath, path);
            if (file.Length > 0)
                Directory.CreateDirectory(Path.GetDirectoryName(uploadPath));
            {
                using (var fileStream = new FileStream(uploadPath, FileMode.Create))
                {
                    await file.CopyToAsync(fileStream);
                }
            }

            return Ok();
        }
    }
}
