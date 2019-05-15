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
    [Authorize(Roles = "Owner,Administrator,Manager,Customer")]
    public class CartsController : Controller
    {
        private readonly UserManager<AppUser> _UserManager;

        private readonly ApplicationDbContext _context;


        public CartsController(ApplicationDbContext context, UserManager<AppUser> userManager)
        {
            _UserManager = userManager;

            _context = context;
        }

        // GET: Carts
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Carts
                .Include(c => c.User);
            GC.Collect();
            Dispose();
            return View(await applicationDbContext.ToListAsync());
        }

        [Authorize(Roles = "Owner,Administrator,Manager,Customer")]
        public IActionResult MyCart()
        {
            ViewData["ViewProduct"] = GetProductQuantity(_context.Carts.Where(c => c.UserId.Equals(_UserManager.GetUserId(User)) && c.OrderId == null).ToList());
            return View();
        }

        // GET: Carts/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cart = await _context.Carts
                .FirstOrDefaultAsync(m => m.Id == id);
            if (cart == null)
            {
                return NotFound();
            }

            return View(cart);
        }

        // GET: Carts/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Carts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CartId,Quantity,ProductSKU,UserId,Id,Name,Description")] Cart cart)
        {
            if (ModelState.IsValid)
            {
                cart.DateCreated = EditHelper<Cart>.GetPresentDateTime();
                cart.DateUpdated = EditHelper<Cart>.GetPresentDateTime();
                cart.CreatedById = Guid.Parse(_UserManager.GetUserId(User));
                cart.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));

                _context.Add(cart);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(cart);
        }

        // GET: Carts/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cart = await _context.Carts.FindAsync(id);
            if (cart == null)
            {
                return NotFound();
            }
            return View(cart);
        }

        // POST: Carts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CartId,Quantity,ProductSKU,UserId,Id,Name,Description")] Cart cart)
        {
            if (id != cart.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    cart.DateUpdated = EditHelper<Cart>.GetPresentDateTime(); ;
                    cart.DateCreated = EditHelper<Cart>.GetDateCreated(_context, id);
                    cart.CreatedById = EditHelper<Cart>.GetCreatedById(_context, id);
                    cart.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));

                    _context.Update(cart);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CartExists(cart.Id))
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
            return View(cart);
        }

        // GET: Carts/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cart = await _context.Carts
                .FirstOrDefaultAsync(m => m.Id == id);
            if (cart == null)
            {
                return NotFound();
            }

            return View(cart);
        }

        // POST: Carts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var cart = await _context.Carts.FindAsync(id);
            _context.Carts.Remove(cart);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CartExists(int id)
        {
            return _context.Carts.Any(e => e.Id == id);
        }

        public int GetCartCount()
        {
            var userId = _UserManager.GetUserAsync(User).Result.Id;

            int count = 0;
            var carts = _context.Carts.Where(c => c.UserId.Equals(userId) && c.OrderId == null).ToList();
            foreach (var cart in carts)
            {
                count += cart.Quantity;
            }
            return count;
        }

        private Cart GetCart(string productSKU, string userId)
        {
            var carts = _context.Carts.Where(e => e.ProductSKU.Equals(productSKU) && e.UserId.Equals(userId) && e.OrderId == null).ToList();
            GC.Collect();
            Dispose();
            if (carts.Any())
            {
                return carts.Last();
            }
            else
            {
                return null;
            }
        }

        [HttpPost, ActionName("AddToCart")]
        [Authorize(Roles = "Owner,Administrator,Manager,Customer")]
        public async Task<JsonResult> AddToCart([FromBody] addToCartArgs args)
        {
            var userId = _UserManager.GetUserAsync(User).Result.Id;

            if (ModelState.IsValid)
            {

                var cart = new Cart();

                cart.DateCreated = EditHelper<Cart>.GetPresentDateTime();
                cart.DateUpdated = EditHelper<Cart>.GetPresentDateTime();
                cart.CreatedById = Guid.Parse(userId);
                cart.UpdatedById = Guid.Parse(userId);

                cart.ProductSKU = args.productSKU;
                cart.UserId = userId;
                cart.OrderId = null;
                cart.Quantity = args.quantity;
                cart.Name = string.Format("{0}-{1}", cart.ProductSKU, cart.CreatedById);

                var existingCart = GetCart(args.productSKU, userId);
                if (existingCart != null)
                {
                    existingCart.DateUpdated = EditHelper<Cart>.GetPresentDateTime();
                    existingCart.UpdatedById = Guid.Parse(userId);
                    existingCart.Quantity += args.quantity;
                    _context.Update(existingCart);
                }
                else
                {
                    _context.Add(cart);
                }
                await _context.SaveChangesAsync();
                return Json(GetCartCount());

            }
            GC.Collect();
            Dispose();
            return Json(false);
        }

        public class addToCartArgs
        {
            public string productSKU { get; set; }
            public int quantity { get; set; }
        }


        private List<ViewProduct> GetProductQuantity(List<Cart> cartList)
        {
            List<ViewProduct> viewProductList = new List<ViewProduct>();
            foreach (var entry in cartList)
            {
                if (entry.ProductSKU.StartsWith('M'))
                {
                    Map map = _context.Maps.Where(m => m.SKU.Equals(entry.ProductSKU)).ToList().First();
                    ViewProduct viewProduct = new ViewProduct()
                    {
                        SKU = map.SKU,
                        ImagePath = _context.Images.Find(map.ImageId).Path,
                        Name = map.Name,
                        Price = map.Price,
                        Quantity = _context.Carts.Where(c => c.ProductSKU.Equals(entry.ProductSKU) && c.UserId.Equals(entry.UserId)).ToList().Last().Quantity,
                        Description = map.Description,
                        Stock = map.Quantity
                    };

                    viewProductList.Add(viewProduct);
                }
                else if (entry.ProductSKU.StartsWith('G'))
                {
                    Globe globe = _context.Globes.Where(g => g.SKU.Equals(entry.ProductSKU)).ToList().First();
                    ViewProduct viewProduct = new ViewProduct()
                    {
                        SKU = globe.SKU,
                        ImagePath = _context.Images.Find(globe.ImageId).Path,
                        Name = globe.Name,
                        Price = globe.Price,
                        Quantity = _context.Carts.Where(c => c.ProductSKU.Equals(entry.ProductSKU) && c.UserId.Equals(entry.UserId)).Last().Quantity,
                        Description = globe.Description,
                        Stock = globe.Quantity
                    };

                    viewProductList.Add(viewProduct);
                }
            }
            GC.Collect();
            Dispose();
            return viewProductList;
        }
    }
}
