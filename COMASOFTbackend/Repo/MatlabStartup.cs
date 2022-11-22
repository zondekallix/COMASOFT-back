using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace COMASOFTbackend.Repo
{
    public class MatlabStartup
    {
        MLApp.MLApp matlab = new MLApp.MLApp();
        public MatlabStartup(IWebHostEnvironment _webHostEnvironment)
        {

            var path = Path.Combine(_webHostEnvironment.WebRootPath, "uploads");
            matlab.Execute(path);
            //matlab.Execute(@"cd 'c:\Users\reynel\Desktop\Temas Tesis\Matlab\Programas'");

        }
    }
}
