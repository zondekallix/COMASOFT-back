using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace COMASOFTbackend.Models
{
    public class FunctionResults
    {
        public int[] Data { get; set; }
        public string[] Coeff { get; set; }
        public int msg { get; set; }
        public string msgText { get; set; }
    }
}
