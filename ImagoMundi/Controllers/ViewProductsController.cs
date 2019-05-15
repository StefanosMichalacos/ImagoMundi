using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ImagoMundi.Data;
using ImagoMundi.Helpers;
using ImagoMundi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ImagoMundi.Controllers
{
    public class ViewProductsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ViewProductsController(ApplicationDbContext context)
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

        private void GetMapSize()
        {

            var mapSizes = from map in _context.Maps
                           join size in _context.Sizes on map.SizeId equals size.Id
                           select new Size { Id = size.Id, Name = size.Name };

            ViewData["Sizes"] = mapSizes.Distinct().ToList();
            GC.Collect();
            Dispose();
        }

        private void GetContCount()
        {
            var countries = from map in _context.Maps
                            join country in _context.Countries on map.CountryId equals country.Id
                            select new Country { Id = country.Id, Name = country.Name, ContinentId = country.ContinentId };

            ViewData["Countries"] = countries.Distinct().ToList();

            var continentIds = from map in _context.Maps
                               join country in _context.Countries on map.CountryId equals country.Id
                               select country.ContinentId;
            ViewData["Continents"] = continentIds.Select(c => ((Helpers.Enums.Continent)c).ToString());
            GC.Collect();
            Dispose();
        }

        private List<ViewProduct> ProductsToViewProducts<T>(List<T> products) where T : ProductBase
        {
            var keys = Request.Query.Keys;
            foreach (var key in keys)
            {
                var value = Request.Query[key][0];
                products = products.Where(product => product.GetType().GetProperty(key).GetValue(product, null).ToString().Equals(value)).ToList();
            }

            var viewProducts = from product in products
                               join image in _context.Images on product.ImageId equals image.Id
                               select new ViewProduct()
                               {
                                   SKU = product.SKU,
                                   Name = product.Name,
                                   Price = product.Price,
                                   ImageId = product.ImageId,
                                   Description = product.Description,
                                   Sales = product.Sales,
                                   ImagePath = image.Path,
                                   ProductType = product.GetType(),
                               };
            GC.Collect();
            Dispose();
            return viewProducts.ToList();
        }

        public List<Map> GetAllMaps()
        {
            var mapsQuery = from map in _context.Maps
                            select new Map()
                            {
                                Id = map.Id,
                                SKU = map.SKU,
                                Name = map.Name,
                                Price = map.Price,
                                ImageId = map.ImageId,
                                Description = map.Description,
                                Sales = map.Sales,
                                CountryId = map.CountryId,
                                MaterialId = map.MaterialId,
                                MapTypeId = map.MapTypeId
                            };
            GC.Collect();
            Dispose();
            return mapsQuery.ToList();
        }
        private List<Globe> GetAllGlobes()
        {
            var globesQuery = from globe in _context.Globes
                              join image in _context.Images on globe.ImageId equals image.Id
                              select new Globe()
                              {
                                  Id = globe.Id,
                                  SKU = globe.SKU,
                                  Name = globe.Name,
                                  Price = globe.Price,
                                  ImageId = globe.ImageId,
                                  Description = globe.Description,
                                  Sales = globe.Sales,
                                  MaterialId = globe.MaterialId,
                                  SizeId = globe.SizeId,
                              };
            GC.Collect();
            Dispose();
            return globesQuery.ToList();
        }
        private void PrepareView()
        {
            NavBarQueries();
            GetMapSize();
            GetContCount();
            GC.Collect();
            Dispose();
        }

        public IActionResult Maps()
        {
            ViewData["ViewProducts"] = ProductsToViewProducts<Map>(GetAllMaps());
            PrepareView();
            GC.Collect();
            Dispose();
            return View("Index");
        }


        public IActionResult Globes()
        {
            ViewData["ViewProducts"] = ProductsToViewProducts<Globe>(GetAllGlobes());
            PrepareView();
            GC.Collect();
            Dispose();
            return View("Index");
        }

        public IActionResult Details(string sku)
        {
            if (sku.StartsWith("M")) return View(ProductsToViewProducts<Map>(GetAllMaps().Where(m => m.SKU.Equals(sku)).ToList()).FirstOrDefault());
            else if (sku.StartsWith("G")) return View(ProductsToViewProducts<Globe>(GetAllGlobes().Where(g => g.SKU.Equals(sku)).ToList()).FirstOrDefault());
            else return View();
        }

        public IActionResult Index()
        {
            return View();
        }


    }
}

