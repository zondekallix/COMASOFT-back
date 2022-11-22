using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace COMASOFTbackend.Utils
{
    public static class MatlabFunctions
    {
        public static MLApp.MLApp GenerateMatlabEnviroment(string path)
        {
            MLApp.MLApp matlab = new MLApp.MLApp();
            //var path = Path.Combine(IWebHostEnvironment.WebRootPath, "uploads");
            matlab.Execute(path);
            return matlab;
        }
        public static (double[], bool) MatlabCallFibrous(MLApp.MLApp matlabEnv, string algorithmName, double[] matrix, double[] fibrous, double lam, double angle)
        {
            string path = @"cd 'c:\Users\reynel\Desktop\Temas Tesis\Matlab\Programas'";
            matlabEnv.Execute(path);
            matlabEnv.Feval(algorithmName, 1, out object resultVar, matrix, fibrous, lam);
            object[] res = resultVar as object[];
            double[,] res2 = (double[,])res[0];
            double[] outputJson = new double[7];
            bool indefinedVal = false;
            for (int i = 0; i < res2.GetLength(1); i++)
            {
                if (Double.IsNaN(res2[0, i])) { indefinedVal = true; break; }
                outputJson[i] = res2[0, i];
            }
            return (outputJson, indefinedVal);
        }

    }
}

//matlab.Execute(@"cd 'c:\Users\reynel\Desktop\Temas Tesis\Matlab\Programas'");
//matlab.Execute(@"cd 'c:\Users\reynel\Documents\tesis dani\mathlab\Programas\Programas'");