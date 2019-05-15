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
using System.Text;

namespace ImagoMundi.Controllers
{
    [Authorize(Roles = "Owner,Administrator,Manager")]
    public class GlobesController : Controller
    {
        private readonly UserManager<AppUser> _UserManager;
   
        private readonly ApplicationDbContext _context;

        public GlobesController(ApplicationDbContext context, UserManager<AppUser> userManager)
        {
            _UserManager = userManager;

            _context = context;
        }

        // GET: Globes
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Globes.Include(g => g.Discount).Include(g => g.Image).Include(g => g.Material).Include(g => g.Size).Include(g => g.Tax);
            GC.Collect();
            Dispose();
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: Globes/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var globe = await _context.Globes
                .Include(g => g.Discount)
                .Include(g => g.Image)
                .Include(g => g.Material)
                .Include(g => g.Size)
                .Include(g => g.Tax)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (globe == null)
            {
                return NotFound();
            }

            return View(globe);
        }

        // GET: Globes/Create
        public IActionResult Create()
        {
            ViewData["DiscountId"] = new SelectList(_context.Discounts, "Id", "Percentage");
            ViewData["ImageId"] = new SelectList(_context.Images, "Id", "Path");
            ViewData["MaterialId"] = new SelectList(_context.Materials, "Id", "Name");
            ViewData["SizeId"] = new SelectList(_context.Sizes, "Id", "Name");
            ViewData["TaxId"] = new SelectList(_context.Taxes, "Id", "Percentage");
            return View();
        }

        // POST: Globes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,SKU,SizeId,MaterialId,Quantity,Sales,Price,DiscountId,TaxId,ImageId,Name,Description,Keywords")] Globe globe)
        {
            if (ModelState.IsValid)
            {
                globe.DateCreated = EditHelper<Globe>.GetPresentDateTime();
                globe.DateUpdated = EditHelper<Globe>.GetPresentDateTime();
                globe.CreatedById = Guid.Parse(_UserManager.GetUserId(User));
                globe.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));


                globe.Keywords = Misc.PadString(globe.Keywords);
                                            
                _context.Add(globe);        
                await _context.SaveChangesAsync();
                globe.SKU = "G-" + globe.Id;
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["DiscountId"] = new SelectList(_context.Discounts, "Id", "Percentage", globe.DiscountId);
            ViewData["ImageId"] = new SelectList(_context.Images, "Id", "Path", globe.ImageId);
            ViewData["MaterialId"] = new SelectList(_context.Materials, "Id", "Name", globe.MaterialId);
            ViewData["SizeId"] = new SelectList(_context.Sizes, "Id", "Name", globe.SizeId);
            ViewData["TaxId"] = new SelectList(_context.Taxes, "Id", "Percentage", globe.TaxId);
            return View(globe);
        }

        // GET: Globes/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var globe = await _context.Globes.FindAsync(id);
            if (globe == null)
            {
                return NotFound();
            }
            ViewData["DiscountId"] = new SelectList(_context.Discounts, "Id", "Percentage", globe.DiscountId);
            ViewData["ImageId"] = new SelectList(_context.Images, "Id", "Path", globe.ImageId);
            ViewData["MaterialId"] = new SelectList(_context.Materials, "Id", "Name", globe.MaterialId);
            ViewData["SizeId"] = new SelectList(_context.Sizes, "Id", "Name", globe.SizeId);
            ViewData["TaxId"] = new SelectList(_context.Taxes, "Id", "Percentage", globe.TaxId);
            return View(globe);
        }

        // POST: Globes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,SKU,SizeId,MaterialId,Quantity,Sales,Price,DiscountId,TaxId,ImageId,Name,Description,Keywords")] Globe globe)
        {
            if (id != globe.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    globe.DateUpdated = EditHelper<Globe>.GetPresentDateTime(); ;
                    globe.DateCreated = EditHelper<Globe>.GetDateCreated(_context, id);
                    globe.CreatedById = EditHelper<Globe>.GetCreatedById(_context, id);
                    globe.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));
                    globe.SKU = "G-" + globe.Id;


                    globe.Keywords = Misc.PadString(globe.Keywords);

                    _context.Update(globe);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!GlobeExists(globe.Id))
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
            ViewData["DiscountId"] = new SelectList(_context.Discounts, "Id", "Percentage", globe.DiscountId);
            ViewData["ImageId"] = new SelectList(_context.Images, "Id", "Path", globe.ImageId);
            ViewData["MaterialId"] = new SelectList(_context.Materials, "Id", "Name", globe.MaterialId);
            ViewData["SizeId"] = new SelectList(_context.Sizes, "Id", "Name", globe.SizeId);
            ViewData["TaxId"] = new SelectList(_context.Taxes, "Id", "Percentage", globe.TaxId);
            return View(globe);
        }

        // GET: Globes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var globe = await _context.Globes
                .Include(g => g.Discount)
                .Include(g => g.Image)
                .Include(g => g.Material)
                .Include(g => g.Size)
                .Include(g => g.Tax)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (globe == null)
            {
                return NotFound();
            }

            return View(globe);
        }

        // POST: Globes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var globe = await _context.Globes.FindAsync(id);
            _context.Globes.Remove(globe);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool GlobeExists(int id)
        {
            return _context.Globes.Any(e => e.Id == id);
        }
    }
}
