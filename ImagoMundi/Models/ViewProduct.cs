using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Models
{
    public class ViewProduct
    {
        public string SKU { get; set; }
        public string Name { get; set; }
        public int Sales { get; set; }
        public float Price { get; set; }
        public int Quantity { get; set; }
        public int Stock { get; set; }
        public string Description { get; set; }
        public int ImageId { get; set; }
        public string ImagePath { get; set; }
        public Type ProductType { get; set; }
        public int MaterialId { get; set; }

        // Product properties
        public int MapTypeId { get; set; }
        public int SizeId { get; set; }
        public int CountryId { get; set; }
        public MapType MapType { get; set; }
        public Size Size { get; set; }
        public Country Country { get; set; }
        public Material Material { get; set; }

    }
}
