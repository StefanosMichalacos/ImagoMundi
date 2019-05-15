using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Models
{
    [Serializable]
    public class Cart : ModelBase
    {
        /// <summary>
        /// 
        /// </summary>
        [Required]
        [Range(1, int.MaxValue, ErrorMessage = "Must be a positive number")]
        public int Quantity { set; get; }
        /// <summary>
        /// 
        /// </summary>
        [Required]
        public string ProductSKU { set; get; }
        /// <summary>
        /// 
        /// </summary>
        [Required]
        public string UserId { set; get; }
        /// <summary>
        /// 
        /// </summary>
        public int? OrderId { set; get; }

        public AppUser User { get; set; }
        public Order Order { get; set; }
    }
}
