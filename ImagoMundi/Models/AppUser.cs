using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Models
{
    public class AppUser : IdentityUser
    {
        [PersonalData]
        [RegularExpression("[a-zA-Z]+", ErrorMessage = "First name must not contain numeric values and in English")]
        [MaxLength(50)]
        public string FirstName { get; set; }

        [PersonalData]
        [RegularExpression("[a-zA-Z]+", ErrorMessage = "Last name must not contain numeric values and in English")]
        [MaxLength(70)]
        public string LastName { get; set; }

        //[StringLength(9, ErrorMessage = "ΑFM should be 9 characters long")]
        //[MinLength(9)]
        //[RegularExpression("^[0-9]*$", ErrorMessage = "AFM must be numeric with no spaces")]
        //public string Afm { get; set; }

        [PersonalData]
        [MaxLength(100)]
        public string SrteetAddress { get; set; }

        [RegularExpression("[a-zA-Z]+", ErrorMessage = "City must not contain numeric values and in English")]
        [MaxLength(70)]
        public string City { get; set; }

        [RegularExpression("[a-zA-Z]+", ErrorMessage = "State name must not contain numeric values and in English")]
        [MaxLength(70)]
        public string State { get; set; }

        [StringLength(5, ErrorMessage = "Zip Code should be 5 characters long")]
        [MinLength(5)]
        [RegularExpression("^[0-9]*$", ErrorMessage = "Zip code must be numeric with no spaces")]
        public string Zip { get; set; }
        
        public IEnumerable<Order> Orders { get; set; }
        public IEnumerable<Cart> Carts { get; set; }

        //public string AppUserID { get; internal set; }
    }
}
