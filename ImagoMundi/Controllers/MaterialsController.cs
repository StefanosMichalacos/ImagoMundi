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
using Microsoft.AspNetCore.Authorization;

namespace ImagoMundi.Controllers
{
    [Authorize(Roles = "Owner,Administrator,Manager")]
    public class MaterialsController : Controller
    {
        private readonly UserManager<AppUser> _UserManager;
   
        private readonly ApplicationDbContext _context;

        public MaterialsController(ApplicationDbContext context, UserManager<AppUser> userManager)
        {
            _UserManager = userManager;

            _context = context;
        }

        // GET: Materials
        public async Task<IActionResult> Index()
        {
            var aplicationDBContext = _context.Materials.Include(g => g.Maps).Include(g => g.Globes);
            return View(await aplicationDBContext.ToListAsync());
        }

        // GET: Materials/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var material = await _context.Materials
                .Include(g => g.Maps)
                .Include(g => g.Globes)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (material == null)
            {
                return NotFound();
            }

            return View(material);
        }

        // GET: Materials/Create
        public IActionResult Create()
        {
            ViewData["MapId"] = new SelectList(_context.Materials, "Id", "Name");
            ViewData["GlobeId"] = new SelectList(_context.Materials, "Id", "Name");
            return View();
        }

        // POST: Materials/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Type,Id,Name,Description")] Material material)
        {
            if (ModelState.IsValid)
            {
                material.DateCreated = EditHelper<Material>.GetPresentDateTime();
                material.DateUpdated = EditHelper<Material>.GetPresentDateTime();
                material.CreatedById = Guid.Parse(_UserManager.GetUserId(User));
                material.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));

                _context.Add(material);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MapId"] = new SelectList(_context.Materials, "Id", "Name", material.Maps);
            ViewData["GlobeId"] = new SelectList(_context.Materials, "Id", "Name", material.Globes);
            return View(material);
        }

        // GET: Materials/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var material = await _context.Materials.FindAsync(id);
            if (material == null)
            {
                return NotFound();
            }
            ViewData["MapId"] = new SelectList(_context.Materials, "Id", "Name", material.Maps);
            ViewData["GlobeId"] = new SelectList(_context.Materials, "Id", "Name", material.Globes);
            return View(material);
        }

        // POST: Materials/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Type,Id,Name,Description")] Material material)
        {
            if (id != material.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {

                try
                {
                    material.DateUpdated = EditHelper<Material>.GetPresentDateTime(); ;
                    material.DateCreated = EditHelper<Material>.GetDateCreated(_context, id);
                    material.CreatedById = EditHelper<Material>.GetCreatedById(_context, id);
                    material.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));

                    _context.Update(material);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MaterialExists(material.Id))
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
            ViewData["MapId"] = new SelectList(_context.Materials, "Id", "Name", material.Maps);
            ViewData["GlobeId"] = new SelectList(_context.Materials, "Id", "Name", material.Globes);
            return View(material);
        }

        // GET: Materials/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var material = await _context.Materials
                .Include(g => g.Maps)
                .Include(g => g.Globes)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (material == null)
            {
                return NotFound();
            }

            return View(material);
        }

        // POST: Materials/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var material = await _context.Materials.FindAsync(id);
            _context.Materials.Remove(material);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MaterialExists(int id)
        {
            return _context.Materials.Any(e => e.Id == id);
        }
    }
}
