using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace COMASOFTbackend.Models
{
    public partial class AlgorithmInfo
    {
        public int Idfile { get; set; }
        public string Nombrefile { get; set; }
        public string Descripcion { get; set; }
        public int? IdMtype { get; set; }
        public string Tipocompuesto { get; set; }
        public string Tipogeometria { get; set; }
    }
}
