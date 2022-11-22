using COMASOFTbackend.Models;
using COMASOFTbackend.Utils;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;


namespace COMASOFTbackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LaminousDesignerController : Controller
    {
        private readonly MaterialInsightContext _context;
        private bool indefinedVal;
        private IWebHostEnvironment webHostEnvironment;

        public LaminousDesignerController(MaterialInsightContext context, IWebHostEnvironment _webHostEnvironment)
        {
            _context = context;
            indefinedVal = false;
            webHostEnvironment = _webHostEnvironment;
        }

        [HttpPut("[action]")]
        public ActionResult putData(LaminousDesigner LaminousDesigner)
        {

            try
            {
                if (LaminousDesigner.MaterialIdList.Length == 0) return Json(new { data = new double[] { }, coeff = new string[] { " " }, msg = 0 }); ;

                var queryTemp = _context.MaterialTypesCoefficientTypes.Where(data => data.IdMtype == LaminousDesigner.IdMtype);
                var queryMatrix = _context.Materials.Join(_context.Coefficients,
                    mat => mat.IdMaterial,
                    coef => coef.IdMaterial,
                    (mat, coef) => new
                    {
                        MaterialId = mat.IdMaterial,
                        CoefficientValue = coef.Value,
                        IdCType = coef.IdCtype
                    }).Where(newView => newView.MaterialId == LaminousDesigner.MaterialIdList[0]);


                var trueQueryMatrix = queryTemp.Join(queryMatrix,
                    temp => temp.IdCtype,
                    query => query.IdCType,
                    (temp, query) => new
                    {
                        MaterialId = query.MaterialId,
                        CoefficientValue = query.CoefficientValue,
                    });

                var dataMatrix = trueQueryMatrix.ToList();



                MLApp.MLApp matlab = new MLApp.MLApp();
                var path = Path.Combine(webHostEnvironment.WebRootPath, "uploads");
                matlab.Execute(path);

                //matlab.Execute(@"cd 'c:\Users\reynel\Desktop\Temas Tesis\Matlab\Programas'");
                //matlab.Execute(@"cd 'c:\Users\reynel\Documents\tesis dani\mathlab\Programas\Programas'");

                double[] matrix = dataMatrix.Select(data => data.CoefficientValue).ToArray();
                double lam = LaminousDesigner.FractionList[0];
                string algorithmSelector = LaminousDesigner.Geometry == 1 ? "AHMelasticoHex" : "AHMelasticoSqr";
                string algorithmSelector2 = UtilsFunctions.removeExtension(LaminousDesigner.FunctionName);
                object result = null;

                matlab.Feval(algorithmSelector2, 1, out result, matrix, lam);

                object[] res = result as object[];
                double[,] res2 = (double[,])res[0];

                double[] outputJson = new double[7];

                indefinedVal = false;
                for (int i = 0; i < res2.GetLength(1); i++)
                {
                    if (Double.IsNaN(res2[0, i])) { indefinedVal = true; break; }
                    outputJson[i] = res2[0, i];
                }

                if (!indefinedVal)
                    return Json(new { data = outputJson, coeff = new string[] { "C11", "C12", "C13", "C33", "C44", "C55", "C66" }, msg = 1 });
                else
                    return Json(new { data = new double[] { }, coeff = new string[] { " " }, msg = -1 });

            }
            catch (IndexOutOfRangeException e)
            {
                return Json(new { data = new double[] { }, coeff = new string[] { " " }, msg = -1 });
            }
        }
        [HttpGet("[action]/{idMaterial}")]
        public IActionResult getCoeff(int idMaterial)
        {
            var coeffList = _context.Coefficients.Where(data => data.IdMaterial == idMaterial);
            var listCoeff = coeffList.ToList();
            return Json(new { listCoeff });

        }
    }
}