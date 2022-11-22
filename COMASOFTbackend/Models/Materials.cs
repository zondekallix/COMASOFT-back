using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace COMASOFTbackend.Models
{
    public partial class Materials
    {
        public string NameMaterial { get; set; }
        public string? Description { get; set; }
        public int IdMaterial { get; set; }
        public int? IdMtype { get; set; }
        public int? IdSymmetry { get; set; }
        public double? Angle { get; set; }
        public string? CellGeometry { get; set; }
        public string? SheerGeometry { get; set; }
        public int? MaterialDiscriminator { get; set; }
    }
}
