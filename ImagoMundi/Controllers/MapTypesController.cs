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
    public class MapTypesController : Controller
    {
        private readonly UserManager<AppUser> _UserManager;
   
        private readonly ApplicationDbContext _context;

        public MapTypesController(ApplicationDbContext context, UserManager<AppUser> userManager)
        {
            _UserManager = userManager;

            _context = context;
        }

        // GET: MapTypes
        public async Task<IActionResult> Index()
        {
            var aplicationDBContext = _context.MapTypes.Include(g => g.Maps);
            return View(await aplicationDBContext.ToListAsync());
        }

        // GET: MapTypes/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var mapType = await _context.MapTypes
                .Include(g => g.Maps)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (mapType == null)
            {
                return NotFound();
            }

            return View(mapType);
        }

        // GET: MapTypes/Create
        public IActionResult Create()
        {
            ViewData["MapId"] = new SelectList(_context.MapTypes, "Id", "Name");
            return View();
        }

        // POST: MapTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Name,Description")] MapType mapType)
        {
            if (ModelState.IsValid)
            {
                mapType.DateCreated = EditHelper<MapType>.GetPresentDateTime();
                mapType.DateUpdated = EditHelper<MapType>.GetPresentDateTime();
                mapType.CreatedById = Guid.Parse(_UserManager.GetUserId(User));
                mapType.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));

                _context.Add(mapType);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MapId"] = new SelectList(_context.MapTypes, "Id", "Name", mapType.Maps);
            return View(mapType);
        }

        // GET: MapTypes/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var mapType = await _context.MapTypes.FindAsync(id);
            if (mapType == null)
            {
                return NotFound();
            }
            ViewData["MapId"] = new SelectList(_context.MapTypes, "Id", "Name", mapType.Maps);
            return View(mapType);
        }

        // POST: MapTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Name,Description")] MapType mapType)
        {
            if (id != mapType.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    mapType.DateUpdated = EditHelper<MapType>.GetPresentDateTime(); ;
                    mapType.DateCreated = EditHelper<MapType>.GetDateCreated(_context, id);
                    mapType.CreatedById = EditHelper<MapType>.GetCreatedById(_context, id);
                    mapType.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));

                    _context.Update(mapType);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MapTypeExists(mapType.Id))
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
            ViewData["MapId"] = new SelectList(_context.MapTypes, "Id", "Name", mapType.Maps);
            return View(mapType);
        }

        // GET: MapTypes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var mapType = await _context.MapTypes
                .Include(g => g.Maps)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (mapType == null)
            {
                return NotFound();
            }

            return View(mapType);
        }

        // POST: MapTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var mapType = await _context.MapTypes.FindAsync(id);
            _context.MapTypes.Remove(mapType);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MapTypeExists(int id)
        {
            return _context.MapTypes.Any(e => e.Id == id);
        }
    }
}
