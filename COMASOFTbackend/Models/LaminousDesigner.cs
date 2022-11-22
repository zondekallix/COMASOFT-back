using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace COMASOFTbackend.Models
{
    public class LaminousDesigner
    {
       public int[] MaterialIdList { get; set; }
       public int Geometry { get; set; }
       public int[] FractionList { get; set; }
       public string FunctionName { get; set; }
       public int IdMtype { get; set; }
    }
}
