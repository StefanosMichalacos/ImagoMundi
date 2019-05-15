using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Models
{
    public class Order : ModelBase
    {
        /// <summary>
        /// 
        /// </summary>
        [Required]
        public Guid UserId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required]
        [Range(0, float.MaxValue, ErrorMessage = "Must be a positive number")]
        public float TotalPrice { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int StatusId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required]
        [MaxLength(200)]
        public string Address { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required]
        public string PaymentType { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required]
        public int DiscountId { get; set; }

        public IEnumerable<Cart> Carts { get; set; } 
        public Discount Discount { get; set; }

    }
}
