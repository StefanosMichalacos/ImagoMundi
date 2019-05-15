using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ImagoMundi.Data;
using ImagoMundi.Helpers;
using ImagoMundi.Models;
using Microsoft.AspNetCore.Mvc;

namespace ImagoMundi.Controllers
{
    public class SearchController : Controller
    {
        private readonly ApplicationDbContext _context;


        public class SearchString
        {
            public String SearchS { get; set; }
        }

        public SearchController(ApplicationDbContext context)
        {
            _context = context;

        }
        private void NavBarQueries()
        {

            ViewData["MapTypes"] = MenuRetriever.GetMapTypes(_context);
            ViewData["Materials"] = MenuRetriever.GetMaterials(_context);
            GC.Collect();
            Dispose();
        }

        [HttpPost]
        public IActionResult Results([Bind("SearchS")] SearchString search)
        {
            if (!String.IsNullOrEmpty(search.SearchS))
            {
                var productsRelevance = new SearchHelper<Map>(_context.Maps, _context).SearchByDescription(search.SearchS);
                productsRelevance.AddRange(new SearchHelper<Globe>(_context.Globes,_context).SearchByDescription(search.SearchS));
                var sortedProducts = productsRelevance.OrderByDescending(pr => pr.Relevance).Select(pr => pr.Product).ToList();
                ViewData["ViewProducts"] = sortedProducts;
            }
            NavBarQueries();
            GC.Collect();
            Dispose();
            return View();
        }
    }
}