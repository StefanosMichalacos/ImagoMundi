using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Models
{
    public class Map : ProductBase
    {
        /// <summary>
        /// 
        /// </summary>
        public int MapTypeId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int SizeId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int CountryId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int MaterialId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public MapType MapType { get; set; }        
        /// <summary>
        /// 
        /// </summary>
        public Size Size { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public Country Country { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public Material Material { get; set; }
    }
}
