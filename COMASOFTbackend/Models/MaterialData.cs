using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace COMASOFTbackend.Models
{
    public partial class MaterialData
    {
        public string NameMaterial { get; set; }
        public string? Description { get; set; }
        public int IdMaterial { get; set; }
        public string? NameMtype { get; set; }
        public string? SymmetryName { get; set; }
        public int? IndexNumber { get; set; }
        public string? NameCtype { get; set; }
        public string? Prefix { get; set; }
        public string? MeasureUnit { get; set; }
        public double? Value { get; set; }
        public int? Index { get; set; }
    }
}
