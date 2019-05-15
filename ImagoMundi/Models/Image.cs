using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Models
{
    public class Image : ModelBase
    {
        /// <summary>
        /// 
        /// </summary>
        [Required]
        //[DataType(DataType.Text)]
        public string Path { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public ICollection<Map> Maps { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public ICollection<Globe> Globes { get; set; }
    }
}
