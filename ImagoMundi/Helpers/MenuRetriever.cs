using ImagoMundi.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ImagoMundi.Models;

namespace ImagoMundi.Helpers
{
    public class MenuRetriever
    {
        public static List<MapType> GetMapTypes(ApplicationDbContext _context)
        {
            var mapTypeQuery = from map in _context.Maps
                               join type in _context.MapTypes on map.MapTypeId equals type.Id
                               select new MapType { Id = type.Id, Name = type.Name };

            return mapTypeQuery.Distinct().ToList();
        }


        public static List<Material> GetMaterials(ApplicationDbContext _context)
        {
            var materialQuery = from globe in _context.Globes
                                join material in _context.Materials on globe.MaterialId equals material.Id
                                select new Material { Id = material.Id, Name = material.Name };

            return materialQuery.Distinct().ToList();
        }

    }
}
