using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Models
{
    public class MapType : ModelBase
    {
        /// <summary>
        /// 
        /// </summary>
        public ICollection<Map> Maps { get; set; }
    }
}
