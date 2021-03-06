﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Models
{
    public class Tax : ModelBase
    {
        /// <summary>
        /// 
        /// </summary>
        [Required]
        [Range(0, 1, ErrorMessage = "Must be a positive decimal from 0.00 to 1.00")]
        public float Percentage { get; set; }
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
