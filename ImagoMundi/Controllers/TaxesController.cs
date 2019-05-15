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
    public class TaxesController : Controller
    {
        private readonly UserManager<AppUser> _UserManager;
   
        private readonly ApplicationDbContext _context;

        public TaxesController(ApplicationDbContext context, UserManager<AppUser> userManager)
        {
            _UserManager = userManager;

            _context = context;
        }

        // GET: Taxes
        public async Task<IActionResult> Index()
        {
            return View(await _context.Taxes.ToListAsync());
        }

        // GET: Taxes/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tax = await _context.Taxes
                .FirstOrDefaultAsync(m => m.Id == id);
            if (tax == null)
            {
                return NotFound();
            }

            return View(tax);
        }

        // GET: Taxes/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Taxes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Percentage,Id,Name,Description")] Tax tax)
        {
            if (ModelState.IsValid)
            {
                tax.DateCreated = EditHelper<Tax>.GetPresentDateTime();
                tax.DateUpdated = EditHelper<Tax>.GetPresentDateTime();
                tax.CreatedById = Guid.Parse(_UserManager.GetUserId(User));
                tax.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));

                _context.Add(tax);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(tax);
        }

        // GET: Taxes/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tax = await _context.Taxes.FindAsync(id);
            if (tax == null)
            {
                return NotFound();
            }
            return View(tax);
        }

        // POST: Taxes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Percentage,Id,Name,Description")] Tax tax)
        {
            if (id != tax.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    tax.DateUpdated = EditHelper<Tax>.GetPresentDateTime(); ;
                    tax.DateCreated = EditHelper<Tax>.GetDateCreated(_context, id);
                    tax.CreatedById = EditHelper<Tax>.GetCreatedById(_context, id);
                    tax.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));

                    _context.Update(tax);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TaxExists(tax.Id))
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
            return View(tax);
        }

        // GET: Taxes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tax = await _context.Taxes
                .FirstOrDefaultAsync(m => m.Id == id);
            if (tax == null)
            {
                return NotFound();
            }

            return View(tax);
        }

        // POST: Taxes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var tax = await _context.Taxes.FindAsync(id);
            _context.Taxes.Remove(tax);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TaxExists(int id)
        {
            return _context.Taxes.Any(e => e.Id == id);
        }
    }
}
