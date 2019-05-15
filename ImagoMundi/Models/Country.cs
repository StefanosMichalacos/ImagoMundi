using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Models
{
    public class Country : ModelBase
    {     
        /// <summary>
        /// 
        /// </summary>
        [Display(Name="Continent")]
        public int ContinentId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public IEnumerable<Map> Maps { get; internal set; }  
    }
}
