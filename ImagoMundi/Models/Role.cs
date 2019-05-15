using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Models
{
    public class Role : IdentityRole
    {
        /// <summary>
        /// 
        /// </summary>
        [Required]
        [MaxLength(50)]
        public string Description { get; set; }
    }
}
