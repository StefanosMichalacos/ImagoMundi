using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Helpers
{
    public static class Enums
    {
        public enum Status
        {
            Received = 1,
            Shipped = 2,
            Delivered = 3,
            Cancelled = -1
        }
        
        public enum Continent
        {
            Europe = 2,
            Asia = 4,
            North_America = 5,
            South_America = 7,
            Africa = 8,
            Oceania = 9,
            Antarctica = 10,
            World = 11,
            Atlantis = 12,
        }
    }
}
