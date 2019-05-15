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
    public class CountriesController : Controller
    {
        private readonly UserManager<AppUser> _UserManager;
   
        private readonly ApplicationDbContext _context;

        public CountriesController(ApplicationDbContext context, UserManager<AppUser> userManager)
        {
            _UserManager = userManager;

            _context = context;
        }

        // GET: Countries
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Countries;
            GC.Collect();
            Dispose();
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: Countries/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var country = await _context.Countries.FirstOrDefaultAsync(m => m.Id == id);
            if (country == null)
            {
                return NotFound();
            }

            return View(country);
        }

        // GET: Countries/Create
        public IActionResult Create()
        {var continents = from Enums.Continent c in Enum.GetValues(typeof(Enums.Continent))
                            select new { ID = (int)c, Name = c.ToString() };
            ViewData["ContinentId"] = new SelectList(continents, "ID", "Name");return View();
        }

        // POST: Countries/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ContinentId,Id,Name,Description")] Country country)
        {
            if (ModelState.IsValid)
            {
                country.DateCreated = EditHelper<Country>.GetPresentDateTime();
                country.DateUpdated = EditHelper<Country>.GetPresentDateTime();
                country.CreatedById = Guid.Parse(_UserManager.GetUserId(User));
                country.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));

                _context.Add(country);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            var continents = from Enums.Continent c in Enum.GetValues(typeof(Enums.Continent))
                             select new { ID = (int)c, Name = c.ToString() };
            ViewData["ContinentId"] = new SelectList(continents, "ID", "Name", country.ContinentId); return View(country);
        }

        // GET: Countries/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var country = await _context.Countries.FindAsync(id);
            if (country == null)
            {
                return NotFound();
            }
            //ViewData["ContinentId"] = new SelectList(_context.Continents, "Id", "Name", country.ContinentId);
            var continents = from Enums.Continent c in Enum.GetValues(typeof(Enums.Continent))
                            select new { ID = (int)c, Name = c.ToString() };
            ViewData["ContinentId"] = new SelectList(continents, "ID", "Name", country.ContinentId);

            return View(country);
        }

        // POST: Countries/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ContinentId,Id,Name,Description")] Country country)
        {
            if (id != country.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    country.DateUpdated = EditHelper<Country>.GetPresentDateTime(); ;
                    country.DateCreated = EditHelper<Country>.GetDateCreated(_context, id);
                    country.CreatedById = EditHelper<Country>.GetCreatedById(_context, id);
                    country.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));

                    _context.Update(country);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CountryExists(country.Id))
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
            ViewData["ContinentId"] = new SelectList(Enum.GetValues(typeof(Enums.Continent)).OfType<Enums.Continent>().Select(s => (int)s).ToList(), "Id", "Name", country.ContinentId);
            return View(country);
        }

        // GET: Countries/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var country = await _context.Countries.FirstOrDefaultAsync(m => m.Id == id);
            if (country == null)
            {
                return NotFound();
            }

            return View(country);
        }

        // POST: Countries/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var country = await _context.Countries.FindAsync(id);
            _context.Countries.Remove(country);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CountryExists(int id)
        {
            return _context.Countries.Any(e => e.Id == id);
        }
    }
}
