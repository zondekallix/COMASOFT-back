using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace COMASOFTbackend.Models
{
    public class FibrousDesigner
    {
        public int MatrixCoeffId { get; set; }
        public int FibrousCoeffId { get; set; }
        public double Fraction { get; set; }
        public int Angle { get; set; }
        public int Geometry { get; set; }
        public string FunctionName { get; set; }
        public int IdMtype { get; set; }

    }
}
