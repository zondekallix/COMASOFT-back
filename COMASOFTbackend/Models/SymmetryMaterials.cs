using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace COMASOFTbackend.Models
{
    public partial class SymmetryMaterials
    {
        public SymmetryMaterials()
        {
            //IndexTables = new HashSet<IndexTables>();
            //Materials = new HashSet<Materials>();
        }

        public int IdSymmetry { get; set; }
        public string SymmetryName { get; set; }
        public string DescriptionSymmetry { get; set; }
    }
}
