using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ImagoMundi.Helpers
{
    public sealed class AppSettings
    {
        private static readonly Lazy<AppSettings>
            lazy =
            new Lazy<AppSettings>
                (() => new AppSettings());

        public static AppSettings Instance { get { return lazy.Value; } }

        public string DbConnectionString;
        public static readonly string IMAGE_FOLDER_NAME = "images";

        private AppSettings()
        {
        }
    }
}