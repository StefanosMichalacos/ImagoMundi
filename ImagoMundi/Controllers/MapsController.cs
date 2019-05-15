using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ImagoMundi.Data;
using ImagoMundi.Models;
using ImagoMundi.Helpers;
using Microsoft.AspNetCore.Authorization;
using System.Text;

namespace ImagoMundi.Controllers
{
    [Authorize(Roles = "Owner,Administrator,Manager")]
    public class MapsController : Controller
    {
        private readonly UserManager<AppUser> _UserManager;

        private readonly ApplicationDbContext _context;

        public MapsController(ApplicationDbContext context, UserManager<AppUser> userManager)
        {
            _UserManager = userManager;

            _context = context;
        }

        // GET: Maps
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Maps.Include(m => m.Country).Include(m => m.Discount).Include(m => m.Image).Include(m => m.MapType).Include(m => m.Material).Include(m => m.Size).Include(m => m.Tax);
            GC.Collect();
            Dispose();
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: Maps/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var map = await _context.Maps
                .Include(m => m.Country)
                .Include(m => m.Discount)
                .Include(m => m.Image)
                .Include(m => m.MapType)
                .Include(m => m.Material)
                .Include(m => m.Size)
                .Include(m => m.Tax)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (map == null)
            {
                return NotFound();
            }

            return View(map);
        }

        // GET: Maps/Create
        public IActionResult Create()
        {
            ViewData["CountryId"] = new SelectList(_context.Countries, "Id", "Name");
            ViewData["DiscountId"] = new SelectList(_context.Discounts, "Id", "Percentage");
            ViewData["ImageId"] = new SelectList(_context.Images, "Id", "Path");
            ViewData["MapTypeId"] = new SelectList(_context.MapTypes, "Id", "Name");
            ViewData["MaterialId"] = new SelectList(_context.Materials, "Id", "Name");
            ViewData["SizeId"] = new SelectList(_context.Sizes, "Id", "Name");
            ViewData["TaxId"] = new SelectList(_context.Taxes, "Id", "Percentage");
            return View();
        }

        // POST: Maps/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("SKU,MapTypeId,SizeId,CountryId,MaterialId,Quantity,Sales,Price,DiscountId,TaxId,ImageId,Name,Description,Keywords")] Map map)
        {
            if (ModelState.IsValid)
            {
                map.DateCreated = EditHelper<Map>.GetPresentDateTime();
                map.DateUpdated = EditHelper<Map>.GetPresentDateTime();
                map.CreatedById = Guid.Parse(_UserManager.GetUserId(User));
                map.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));

                map.Keywords = Misc.PadString(map.Keywords);

                _context.Add(map);
                await _context.SaveChangesAsync();
                map.SKU = "M-" + map.Id;
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CountryId"] = new SelectList(_context.Countries, "Id", "Name", map.CountryId);
            ViewData["DiscountId"] = new SelectList(_context.Discounts, "Id", "Percentage", map.DiscountId);
            ViewData["ImageId"] = new SelectList(_context.Images, "Id", "Path", map.ImageId);
            ViewData["MapTypeId"] = new SelectList(_context.MapTypes, "Id", "Name", map.MapTypeId);
            ViewData["MaterialId"] = new SelectList(_context.Materials, "Id", "Name", map.MaterialId);
            ViewData["SizeId"] = new SelectList(_context.Sizes, "Id", "Name", map.SizeId);
            ViewData["TaxId"] = new SelectList(_context.Taxes, "Id", "Percentage", map.TaxId);
            return View(map);
        }

        // GET: Maps/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var map = await _context.Maps.FindAsync(id);
            if (map == null)
            {
                return NotFound();
            }
            ViewData["CountryId"] = new SelectList(_context.Countries, "Id", "Name", map.CountryId);
            ViewData["DiscountId"] = new SelectList(_context.Discounts, "Id", "Percentage", map.DiscountId);
            ViewData["ImageId"] = new SelectList(_context.Images, "Id", "Path", map.ImageId);
            ViewData["MapTypeId"] = new SelectList(_context.MapTypes, "Id", "Name", map.MapTypeId);
            ViewData["MaterialId"] = new SelectList(_context.Materials, "Id", "Name", map.MaterialId);
            ViewData["SizeId"] = new SelectList(_context.Sizes, "Id", "Name", map.SizeId);
            ViewData["TaxId"] = new SelectList(_context.Taxes, "Id", "Percentage", map.TaxId);
            return View(map);
        }

        // POST: Maps/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,SKU,MapTypeId,SizeId,CountryId,MaterialId,Quantity,Sales,Price,DiscountId,TaxId,ImageId,Name,Description,Keywords")] Map map)
        {
            if (id != map.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    map.DateUpdated = EditHelper<Map>.GetPresentDateTime();
                    map.DateCreated = EditHelper<Map>.GetDateCreated(_context, id);
                    map.CreatedById = EditHelper<Map>.GetCreatedById(_context, id);
                    map.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));

                    map.SKU = "M-" + map.Id;
                    map.Keywords = Misc.PadString(map.Keywords);


                    _context.Update(map);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MapExists(map.Id))
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
            ViewData["CountryId"] = new SelectList(_context.Countries, "Id", "Name", map.CountryId);
            ViewData["DiscountId"] = new SelectList(_context.Discounts, "Id", "Percentage", map.DiscountId);
            ViewData["ImageId"] = new SelectList(_context.Images, "Id", "Path", map.ImageId);
            ViewData["MapTypeId"] = new SelectList(_context.MapTypes, "Id", "Name", map.MapTypeId);
            ViewData["MaterialId"] = new SelectList(_context.Materials, "Id", "Name", map.MaterialId);
            ViewData["SizeId"] = new SelectList(_context.Sizes, "Id", "Name", map.SizeId);
            ViewData["TaxId"] = new SelectList(_context.Taxes, "Id", "Percentage", map.TaxId);
            return View(map);
        }



        // GET: Maps/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var map = await _context.Maps
                .Include(m => m.Country)
                .Include(m => m.Discount)
                .Include(m => m.Image)
                .Include(m => m.MapType)
                .Include(m => m.Material)
                .Include(m => m.Size)
                .Include(m => m.Tax)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (map == null)
            {
                return NotFound();
            }

            return View(map);
        }

        // POST: Maps/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var map = await _context.Maps.FindAsync(id);
            _context.Maps.Remove(map);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MapExists(int id)
        {
            return _context.Maps.Any(e => e.Id == id);
        }
    }
}
