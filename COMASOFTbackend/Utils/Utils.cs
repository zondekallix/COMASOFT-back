using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace COMASOFTbackend.Utils
{
    public static class UtilsFunctions
    {
        public static string removeExtension(string fileName)
        {
            int dotPos = fileName.LastIndexOf('.');
            return dotPos>0 ? fileName.Substring(0, dotPos): fileName;
        }
        public static double[] fractionVariation(int amount)
        {
            var ran = new Random();
            double[] output = new double[amount];
            double accumulator = 0;

            for (int i = 0; i < amount; i++)
            {
                output[i] = ran.Next(1, 100);
                accumulator += output[i];
            }
            for (int i = 0; i < amount; i++)
            {
                output[i] /= accumulator;
            }

            foreach (var item in output)
            {
                Console.WriteLine(item);
            }
            return output;
        }
        public static (double, double) generatePairSum_One()
        {
            var ran = new Random();
            int first = ran.Next(0, 100);
            int second = ran.Next(0, 100);
            int aux = first + second;
            return ((Math.Floor(100 * (double)first / aux)) / 100, Math.Ceiling(100 * (double)second / aux) / 100);
        }
        public static double generateNewDouble()
        {
            var ran = new Random();
            return (double)ran.Next(1,100)/100;
        }
    }
}
