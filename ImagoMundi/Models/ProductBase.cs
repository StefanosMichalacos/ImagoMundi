using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Models
{
    public class ProductBase : ModelBase
    {
        /// <summary>
        /// 
        /// </summary>
        [Required]
        [Range(0,int.MaxValue,ErrorMessage ="Must be a positive number")]
        public int Quantity { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Range(0, int.MaxValue, ErrorMessage = "Must be a positive number")]
        public int Sales { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Range(0, float.MaxValue, ErrorMessage = "Must be a positive number")]
        public float Price { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int DiscountId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int TaxId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int ImageId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public Discount Discount { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public Tax Tax { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public Image Image { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required]
        public string SKU { get; set; }

        [Required]
        public string Keywords { get; set; }

    }
}
