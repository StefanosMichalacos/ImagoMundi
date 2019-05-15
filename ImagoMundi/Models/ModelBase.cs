using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Models
{
    /// <summary>
    /// 
    /// </summary>
    public class ModelBase
    {
        /// <summary>
        /// 
        /// </summary>
        [Key]
        public int Id { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required]
        [MaxLength(50)]
        public string Name { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [MaxLength(1000)]
        public string Description { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required]
        [Display(Name = "Date created")]
        public DateTime DateCreated { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required]
        [Display(Name = "Date updated")]
        public DateTime DateUpdated { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required]
        [Display(Name = "Created by")]
        public Guid CreatedById { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required]
        [Display(Name = "Updated by")]
        public Guid UpdatedById { get; set; }
    }
}


