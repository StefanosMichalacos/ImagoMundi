using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Models
{
    public class Size : ModelBase
    {
        /// <summary>
        /// 
        /// </summary>
        [Required]
        [MaxLength(100)]
        public string Type { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public IEnumerable<Map> Maps { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public IEnumerable<Globe> Globes { get; set; }
    }
}
