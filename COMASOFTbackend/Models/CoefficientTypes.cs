using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace COMASOFTbackend.Models
{
    public partial class CoefficientTypes
    {
        public int IdCtype { get; set; }
        public string NameCtype { get; set; }
        public string Prefix { get; set; }
        public string MeasureUnit { get; set; }
        public int? IdProperties { get; set; }
    }
}
