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
    public class AppUsersController : Controller
    {
        private readonly UserManager<AppUser> _UserManager;
   
        private readonly ApplicationDbContext _context;

        public AppUsersController(ApplicationDbContext context, UserManager<AppUser> userManager)
        {
            _UserManager = userManager;

            _context = context;
        }

        // GET: AppUsers
        public async Task<IActionResult> Index()
        {
            GC.Collect();
            Dispose();
            return View(await _context.AppUsers.ToListAsync());
        }

        // GET: AppUsers/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var appUser = await _context.AppUsers
                .FirstOrDefaultAsync(m => m.Id == id);
            if (appUser == null)
            {
                return NotFound();
            }

            return View(appUser);
        }

        //// GET: Globes/Create
        //public IActionResult Create()
        //{
        //    ViewData["DiscountId"] = new SelectList(_context.Discounts, "Id", "Percentage");
        //    ViewData["ImageId"] = new SelectList(_context.Images, "Id", "Path");
        //    ViewData["MaterialId"] = new SelectList(_context.Materials, "Id", "Name");
        //    ViewData["SizeId"] = new SelectList(_context.Sizes, "Id", "Name");
        //    ViewData["TaxId"] = new SelectList(_context.Taxes, "Id", "Percentage");
        //    return View();
        //}

        //// POST: Globes/Create
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Create([Bind("SizeId,MaterialId,Quantity,Sales,Price,DiscountId,TaxId,ImageId,Id,Name,Description,Keywords")] Globe globe)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        globe.DateCreated = EditHelper<Globe>.GetPresentDateTime();
        //        globe.DateUpdated = EditHelper<Globe>.GetPresentDateTime();
        //        globe.CreatedById = Guid.Parse(_UserManager.GetUserId(User));
        //        globe.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));
        //        globe.SKU = "G-" + globe.Id;


        //        globe.Keywords = AddFrontAndBackSpace(globe.Keywords);

        //        _context.Add(globe);
        //        await _context.SaveChangesAsync();
        //        return RedirectToAction(nameof(Index));
        //    }
        //    ViewData["DiscountId"] = new SelectList(_context.Discounts, "Id", "Percentage", globe.DiscountId);
        //    ViewData["ImageId"] = new SelectList(_context.Images, "Id", "Path", globe.ImageId);
        //    ViewData["MaterialId"] = new SelectList(_context.Materials, "Id", "Name", globe.MaterialId);
        //    ViewData["SizeId"] = new SelectList(_context.Sizes, "Id", "Name", globe.SizeId);
        //    ViewData["TaxId"] = new SelectList(_context.Taxes, "Id", "Percentage", globe.TaxId);
        //    return View(globe);
        //}

        //// GET: Globes/Edit/5
        //public async Task<IActionResult> Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return NotFound();
        //    }

        //    var globe = await _context.Globes.FindAsync(id);
        //    if (globe == null)
        //    {
        //        return NotFound();
        //    }
        //    ViewData["DiscountId"] = new SelectList(_context.Discounts, "Id", "Percentage", globe.DiscountId);
        //    ViewData["ImageId"] = new SelectList(_context.Images, "Id", "Path", globe.ImageId);
        //    ViewData["MaterialId"] = new SelectList(_context.Materials, "Id", "Name", globe.MaterialId);
        //    ViewData["SizeId"] = new SelectList(_context.Sizes, "Id", "Name", globe.SizeId);
        //    ViewData["TaxId"] = new SelectList(_context.Taxes, "Id", "Percentage", globe.TaxId);
        //    return View(globe);
        //}

        //// POST: Globes/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Edit(int id, [Bind("SizeId,MaterialId,Quantity,Sales,Price,DiscountId,TaxId,ImageId,Id,Name,Description,Keywords")] Globe globe)
        //{
        //    if (id != globe.Id)
        //    {
        //        return NotFound();
        //    }

        //    if (ModelState.IsValid)
        //    {
        //        try
        //        {
        //            globe.DateUpdated = EditHelper<Globe>.GetPresentDateTime(); ;
        //            globe.DateCreated = EditHelper<Globe>.GetDateCreated(_context, id);
        //            globe.CreatedById = EditHelper<Globe>.GetCreatedById(_context, id);
        //            globe.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));
        //            globe.SKU = "G-" + globe.Id;


        //            globe.Keywords = AddFrontAndBackSpace(globe.Keywords);

        //            _context.Update(globe);
        //            await _context.SaveChangesAsync();
        //        }
        //        catch (DbUpdateConcurrencyException)
        //        {
        //            if (!GlobeExists(globe.Id))
        //            {
        //                return NotFound();
        //            }
        //            else
        //            {
        //                throw;
        //            }
        //        }
        //        return RedirectToAction(nameof(Index));
        //    }
        //    ViewData["DiscountId"] = new SelectList(_context.Discounts, "Id", "Percentage", globe.DiscountId);
        //    ViewData["ImageId"] = new SelectList(_context.Images, "Id", "Path", globe.ImageId);
        //    ViewData["MaterialId"] = new SelectList(_context.Materials, "Id", "Name", globe.MaterialId);
        //    ViewData["SizeId"] = new SelectList(_context.Sizes, "Id", "Name", globe.SizeId);
        //    ViewData["TaxId"] = new SelectList(_context.Taxes, "Id", "Percentage", globe.TaxId);
        //    return View(globe);
        //}

        // GET: AppUsers/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
                if (id == null)
                {
                    return NotFound();
                }

                var appUser = await _context.AppUsers
                    .FirstOrDefaultAsync(m => m.Id == id);
                if (appUser == null)
                {
                    return NotFound();
                }

                return View(appUser);
        }

        // POST: Globes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var appUser = await _context.AppUsers.FindAsync(id);
            _context.AppUsers.Remove(appUser);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool AppUserExists(string id)
        {
            return _context.AppUsers.Any(e => e.Id == id);
        }
    }
}
