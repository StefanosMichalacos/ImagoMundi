using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ImagoMundi.Models;
using ImagoMundi.Data;
using Microsoft.AspNetCore.Mvc.Rendering;
using ImagoMundi.Helpers;

namespace ImagoMundi.Controllers
{
    public class HomeController : Controller
    {
        private readonly ApplicationDbContext _context;

        
        public HomeController(ApplicationDbContext context)
        {
            _context = context;

        }

        private void NavBarQueries()
        {
                   
            ViewData["MapTypes"] = MenuRetriever.GetMapTypes(_context);
            ViewData["Materials"] = MenuRetriever.GetMaterials(_context);
        }

        private void BringTopSixProducts()
        {
            var topSixProducts = (from map in _context.Maps
                                  join image in _context.Images on map.ImageId equals image.Id
                                  select new ViewProduct()
                                  {
                                      SKU = map.SKU,
                                      Name = map.Name,
                                      Price = map.Price,
                                      ImageId = map.ImageId,
                                      Description = map.Description,
                                      Sales = map.Sales,
                                      MaterialId = map.MaterialId,
                                      ImagePath = image.Path
                                  }).Union(
                                (from globe in _context.Globes
                                 join image in _context.Images on globe.ImageId equals image.Id
                                 select new ViewProduct()
                                 {
                                     SKU = globe.SKU,
                                     Name = globe.Name,
                                     Price = globe.Price,
                                     ImageId = globe.ImageId,
                                     Description = globe.Description,
                                     Sales = globe.Sales,
                                     MaterialId = -1,
                                     ImagePath = image.Path
                                 })).OrderByDescending(x => x.Sales).Take(6);
            ViewData["ViewProducts"] =  topSixProducts.ToList();

        }

        public IActionResult Index()
        {
            NavBarQueries();
            BringTopSixProducts();
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";
            NavBarQueries();

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";
            NavBarQueries();

            return View();
        }

        public IActionResult Privacy()
        {
            NavBarQueries();

            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
