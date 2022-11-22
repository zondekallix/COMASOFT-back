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
    public class FibrousDesignerController : Controller
    {
        private readonly MaterialInsightContext _context;
        private IWebHostEnvironment webHostEnvironment;
        private MLApp.MLApp matlabEnv;
        private string path;

        public FibrousDesignerController(MaterialInsightContext context, IWebHostEnvironment _webHostEnvironment)
        {
            _context = context;
            webHostEnvironment = _webHostEnvironment;
            this.path = Path.Combine(webHostEnvironment.WebRootPath, "uploads");
            matlabEnv = Utils.MatlabFunctions.GenerateMatlabEnviroment(path);
        }

        [HttpPut("[action]")]
        public ActionResult putData(FibrousDesigner fibrousDesigner)
        {
            if (fibrousDesigner.FibrousCoeffId == 0 || fibrousDesigner.MatrixCoeffId == 0) return Json(new { data = new double[] { }, coeff = new string[] { " " }, msg = 0 }); ;
            try
            {
                (double[] matrix,double[] fibrous) = RepoCall(fibrousDesigner);
                (double[] outputJson,bool indefinedVal) = MatlabFunctions.MatlabCallFibrous(matlabEnv,UtilsFunctions.removeExtension(fibrousDesigner.FunctionName), matrix, fibrous, fibrousDesigner.Fraction, fibrousDesigner.Angle);
                if (!indefinedVal)
                return Json(new { data = outputJson, coeff = new string[] { "C11", "C12", "C13", "C33", "C44", "C55", "C66" }, msg = 1 });
            else
                return Json(new { data = new double[] { }, coeff = new string[] { " " }, msg = -1 });
            }
            catch (IndexOutOfRangeException e){return Json(new { data = new double[] { }, coeff = new string[] { " " }, msg = -1 });}


        }


        [HttpPut("[action]")]
        public ActionResult putDataMult(FibrousDesigner fibrousDesigner)
        {
            if (fibrousDesigner.FibrousCoeffId == 0 || fibrousDesigner.MatrixCoeffId == 0) return Json(new { data = new double[] { }, coeff = new string[] { " " }, msg = 0 }); ;
            try
            {


                int iterations = 10;
                (double[] matrix, double[] fibrous) = RepoCall(fibrousDesigner);
                List<double[]> outpuJsonMul = new List<double[]>();
                double lam = 0.1;
                for (int i = 0; i < iterations; i++)
                {

                    (double[] outputJson, bool indefinedVal) = Utils.MatlabFunctions.MatlabCallFibrous(matlabEnv, UtilsFunctions.removeExtension(fibrousDesigner.FunctionName), matrix, fibrous, lam, fibrousDesigner.Angle);
                    if (!indefinedVal) outpuJsonMul.Add(outputJson);
                    lam += 0.1;
                }
                FunctionResultsMultiple functionResultsMultiple = new FunctionResultsMultiple();
                functionResultsMultiple.Coeff = new string[] { "C11", "C12", "C13", "C33", "C44", "C55", "C66" };
                functionResultsMultiple.Data = outpuJsonMul.ToArray();

                functionResultsMultiple.msg = 1;
                return Json(functionResultsMultiple);
                //else
                //{
                //    functionResultsMultiple.msg = 0;
                //    return Json(new { data = new double[] { }, coeff = new string[] { " " }, msg = -1 });
                //}

            }
            catch (IndexOutOfRangeException e) { return Json(new { data = new double[] { }, coeff = new string[] { " " }, msg = -1 }); }
            catch { return Json(new { data = new double[] { }, coeff = new string[] { " " }, msg = -1 }); }

        }

        [HttpGet("[action]/{idMaterial}")]
        public IActionResult getCoeff(int idMaterial)
        {
            var coeffList = _context.Coefficients.Where(data => data.IdMaterial == idMaterial);
            var listCoeff = coeffList.ToList();
            return Json(new { listCoeff });

        }
        public (double[],double[]) RepoCall(FibrousDesigner fibrousDesigner)
        {
            var queryTemp = _context.MaterialTypesCoefficientTypes.Where(data => data.IdMtype == fibrousDesigner.IdMtype);
            var queryMatrix = _context.Materials.Join(_context.Coefficients,
                mat => mat.IdMaterial,
                coef => coef.IdMaterial,
                (mat, coef) => new
                {
                    MaterialId = mat.IdMaterial,
                    CoefficientValue = coef.Value,
                    IdCType = coef.IdCtype
                }).Where(newView => newView.MaterialId == fibrousDesigner.MatrixCoeffId);
            var queryFibrous = _context.Materials.Join(_context.Coefficients,
                mat => mat.IdMaterial,
                coef => coef.IdMaterial,
                (mat, coef) => new
                {
                    MaterialId = mat.IdMaterial,
                    CoefficientValue = coef.Value,
                    IdCType = coef.IdCtype

                }).Where(newView => newView.MaterialId == fibrousDesigner.FibrousCoeffId);

            var trueQueryMatrix = queryTemp.Join(queryMatrix,
                temp => temp.IdCtype,
                query => query.IdCType,
                (temp, query) => new
                {
                    MaterialId = query.MaterialId,
                    CoefficientValue = query.CoefficientValue,
                });
            var trueQueryFibrous = queryTemp.Join(queryFibrous,
               temp => temp.IdCtype,
               query => query.IdCType,
               (temp, query) => new
               {
                   MaterialId = query.MaterialId,
                   CoefficientValue = query.CoefficientValue,
               });

            var dataMatrix = trueQueryMatrix.ToList();
            var dataFibrous = trueQueryFibrous.ToList();

            double[] matrix = dataMatrix.Select(data => data.CoefficientValue).ToArray();
            double[] fibrous = dataFibrous.Select(data => data.CoefficientValue).ToArray();

            return (matrix, fibrous);
        }



    }
}