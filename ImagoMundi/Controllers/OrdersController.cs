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
    public class OrdersController : Controller
    {
        private readonly UserManager<AppUser> _UserManager;

        private readonly ApplicationDbContext _context;

        public OrdersController(ApplicationDbContext context, UserManager<AppUser> userManager)
        {
            _UserManager = userManager;

            _context = context;
        }

        // GET: Orders
        public async Task<IActionResult> Index()
        {
            GC.Collect();
            Dispose();
            return View(await _context.Orders.ToListAsync());
        }

        // GET: Orders/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var order = await _context.Orders
                .FirstOrDefaultAsync(m => m.Id == id);
            if (order == null)
            {
                return NotFound();
            }

            return View(order);
        }

        // GET: Orders/Create
        public IActionResult Create()
        {
            var statuses = from Enums.Status c in Enum.GetValues(typeof(Enums.Status))
                             select new { ID = (int)c, Name = c.ToString() };
            ViewData["StatusId"] = new SelectList(statuses, "ID", "Name");
            return View();
        }

        // POST: Orders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("UserId,CartId,TotalPrice,StatusId,Address,PaymentType,DiscountId,ImageId,Id,Name,Description")] Order order)
        {
            if (ModelState.IsValid)
            {
                order.DateCreated = EditHelper<Order>.GetPresentDateTime();
                order.DateUpdated = EditHelper<Order>.GetPresentDateTime();
                order.CreatedById = Guid.Parse(_UserManager.GetUserId(User));
                order.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));

                _context.Add(order);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            var statuses = from Enums.Status c in Enum.GetValues(typeof(Enums.Status))
                             select new { ID = (int)c, Name = c.ToString() };
            ViewData["StatusId"] = new SelectList(statuses, "ID", "Name", order.StatusId);
            return View(order);
        }

        // GET: Orders/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var order = await _context.Orders.FindAsync(id);
            if (order == null)
            {
                return NotFound();
            }
            var statuses = from Enums.Status c in Enum.GetValues(typeof(Enums.Status))
                           select new { ID = (int)c, Name = c.ToString() };
            ViewData["StatusId"] = new SelectList(statuses, "ID", "Name", order.StatusId);
            return View(order);
        }

        // POST: Orders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("UserId,CartId,TotalPrice,StatusId,Address,PaymentType,DiscountId,ImageId,Id,Name,Description")] Order order)
        {
            if (id != order.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    order.DateUpdated = EditHelper<Order>.GetPresentDateTime(); ;
                    order.DateCreated = EditHelper<Order>.GetDateCreated(_context, id);
                    order.CreatedById = EditHelper<Order>.GetCreatedById(_context, id);
                    order.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));

                    _context.Update(order);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OrderExists(order.Id))
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
            ViewData["StatusId"] = new SelectList(Enum.GetValues(typeof(Enums.Status)).OfType<Enums.Status>().Select(s => (int)s).ToList(), "Id", "Name", order.StatusId);
            return View(order);
        }

        // GET: Orders/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var order = await _context.Orders
                .FirstOrDefaultAsync(m => m.Id == id);
            if (order == null)
            {
                return NotFound();
            }

            return View(order);
        }

        // POST: Orders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var order = await _context.Orders.FindAsync(id);
            _context.Orders.Remove(order);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool OrderExists(int id)
        {
            return _context.Orders.Any(e => e.Id == id);
        }

        // POST: Orders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[Authorize(Roles = "Owner,Administrator,Manager,Customer")]
        [AllowAnonymous]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateOrderFromCart(string PaymentType, string Name)
        {
            var userId = _UserManager.GetUserAsync(User).Result.Id;
            if (ModelState.IsValid)
            {
                var order = new Order();
                order.DateCreated = EditHelper<Order>.GetPresentDateTime();
                order.DateUpdated = EditHelper<Order>.GetPresentDateTime();
                order.CreatedById = Guid.Parse(_UserManager.GetUserId(User));
                order.UpdatedById = Guid.Parse(_UserManager.GetUserId(User));
                order.Address = _UserManager.GetUserAsync(User).Result.SrteetAddress;
                order.StatusId = (int)Helpers.Enums.Status.Received;
                order.DiscountId = _context.Discounts.Where(d => d.Percentage == 0f).ToList().First().Id;
                order.PaymentType = PaymentType;
                order.Name = Name + userId;
                order.UserId = Guid.Parse(userId);
                var productList = CheckProductStock(order.CreatedById);
                if (!productList.Contains(false))
                {

                    await UpdateAndSaveAsync<Order>(order);
                    int orderId = GetOrder(order.UserId, order.DateCreated).Id;
                    await UpdateEntriesAsync(Guid.Parse(userId), orderId);
                }
                else
                {
                    return Redirect("Carts/MyCart") ;
                }
                return RedirectToAction("Index","Home");
            }
            return RedirectToAction(nameof(Index));
        }


        private async Task UpdateEntriesAsync(Guid userId, int orderId)
        {
            var cart = _context.Carts.Where(c => c.CreatedById.Equals(userId) && c.OrderId == null).ToList();
            foreach (var entry in cart)
            {
                await DecreaseProductQuantityAsync(entry.ProductSKU, entry.Quantity);

            }
             GC.Collect();
            Dispose();
            await UpdateCartAsync(cart,orderId);
        }

        private async Task UpdateCartAsync(List<Cart> cart, int orderId)
        {
            foreach (var entry in cart)
            {
                entry.OrderId = orderId;
                await UpdateAndSaveAsync<Cart>(entry);
            }

        }

        private List<bool> CheckProductStock(Guid userId)
        {
            List<bool> productStockList = new List<bool>();
            var cart = _context.Carts.Where(c => c.UserId.Equals(userId.ToString()) && c.OrderId == null).ToList();
            foreach (var entry in cart)
            {
                int stock = GetProductQuantity(entry.ProductSKU);
                bool stockIsEnough = entry.Quantity <= stock;
                productStockList.Add(stockIsEnough);
            }
             GC.Collect();
            Dispose();
            return productStockList;
        }

        private int GetProductQuantity(string productSKU)
        {
            if (productSKU.StartsWith('M'))
            {
                GC.Collect();
                Dispose();
                return _context.Maps.Where(m => m.SKU.Equals(productSKU)).ToList().First().Quantity;
            }
            else if (productSKU.StartsWith('G'))
            {
                GC.Collect();
                Dispose();
                return _context.Globes.Where(g => g.SKU.Equals(productSKU)).ToList().First().Quantity;
            }
            else
            {
                return -1;
            }
        }


        private async Task DecreaseProductQuantityAsync(string productSKU, int quantity)
        {
            try
            {

                if (productSKU.StartsWith('M'))
                {
                    var map = _context.Maps.Where(m => m.SKU.Equals(productSKU)).ToList().First();
                    map.Quantity -= quantity;
                    await UpdateAndSaveAsync<Map>(map);
                }
                else if (productSKU.StartsWith('G'))
                {
                    var globe = _context.Globes.Where(g => g.SKU.Equals(productSKU)).ToList().First();
                    globe.Quantity -= quantity;
                    await UpdateAndSaveAsync<Globe>(globe);
                }
            }
            catch (DbUpdateConcurrencyException)
            {

            }
            GC.Collect();
            Dispose();

        }

        private Order GetOrder(Guid userId, DateTime dateCreated)
        {
            GC.Collect();
            Dispose();
            return _context.Orders.Where(o => o.CreatedById.Equals(userId) && o.DateCreated.Equals(dateCreated)).ToList().Last();
        }

        private async Task UpdateAndSaveAsync<T>(T t) where T : ModelBase
        {
            _context.Update(t);
            await _context.SaveChangesAsync();
        }
    }
}
