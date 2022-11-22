using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace COMASOFTbackend.Models
{
    public class MaterialDataTypSym
    {
        public int IdMaterial { get; set; }
        public string NameMaterial { get; set; }
        public string Description { get; set; }
        public string NameMType { get; set; }
        public string SymmetryName { get; set; }
        public int IdMType { get; set; }
        public int IdSymmetry { get; set; }
    }
}
