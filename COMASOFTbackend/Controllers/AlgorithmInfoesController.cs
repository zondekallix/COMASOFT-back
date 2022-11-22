using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using COMASOFTbackend.Models;
using System.IO;
using Microsoft.AspNetCore.Hosting;

namespace COMASOFTbackend.Controllers
{
    [Route("api/Algoritmo")]
    [ApiController]
    public class AlgorithmInfoesController : ControllerBase
    {
        private readonly MaterialInsightContext _context;

        public AlgorithmInfoesController(MaterialInsightContext context, IWebHostEnvironment _webHostEnvironment, IHttpContextAccessor _httpContextAccessor)
        {
            _context = context;
            webHostEnvironment = _webHostEnvironment;
            httpContextAccessor = _httpContextAccessor;
        }

        //GET: api/AlgorithmInfoes
       [HttpGet]
        public async Task<ActionResult<IEnumerable<AlgorithmInfo>>> GetAlgorithmInfo()
        {
            return await _context.AlgorithmInfo.ToListAsync();
        }
        [HttpPost("filter")]
        public async Task<ActionResult<IEnumerable<AlgorithmInfo>>> GetAlgorithmInfoByIdMaterial(AlgorithmInfo dataToFilter)
        {
            var queryMatrix = _context.AlgorithmInfo.Where(elem => 
            elem.IdMtype == dataToFilter.IdMtype && 
            elem.Tipocompuesto == dataToFilter.Tipocompuesto && 
            elem.Tipogeometria == dataToFilter.Tipogeometria);
            return await queryMatrix.ToListAsync();
        }

        // GET: api/AlgorithmInfoes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<AlgorithmInfo>> GetAlgorithmInfo(int id)
        {
            var algorithmInfo = await _context.AlgorithmInfo.FindAsync(id);

            if (algorithmInfo == null)
            {
                return NotFound();
            }

            return algorithmInfo;
        }

        [HttpGet("details")]
        public async Task<ActionResult<AlgorithmInfo>> GetAlgorithmInfo2(int id,string name)
        {
            var algorithmInfo = await _context.AlgorithmInfo.FindAsync(id);

            if (algorithmInfo == null)
            {
                return NotFound();
            }

            return algorithmInfo;
        }


        private IWebHostEnvironment webHostEnvironment;
        private IHttpContextAccessor httpContextAccessor;

        [Produces("application/json")]
        [HttpPost("upload")]
        public IActionResult Upload(IFormFile file)
        {
            try
            {
                var path = Path.Combine(webHostEnvironment.WebRootPath, "uploads", file.FileName);
                using (var filestream = new FileStream(path, FileMode.Create))
                {
                    file.CopyTo(filestream);
                }
                var baseUrl = httpContextAccessor.HttpContext.Request.Scheme +
                    "://" +
                    httpContextAccessor.HttpContext.Request.Host +
                    httpContextAccessor.HttpContext.Request.PathBase;
                return Ok();
            }
            catch
            {

                return BadRequest();
            }
        }

        // PUT: api/AlgorithmInfoes/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAlgorithmInfo(int id, AlgorithmInfo algorithmInfo)
        {
            if (id != algorithmInfo.Idfile)
            {
                return BadRequest();
            }

            _context.Entry(algorithmInfo).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AlgorithmInfoExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/AlgorithmInfoes
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<AlgorithmInfo>> PostAlgorithmInfo(AlgorithmInfo algorithmInfo)
        {
            _context.AlgorithmInfo.Add(algorithmInfo);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAlgorithmInfo", new { id = algorithmInfo.Idfile }, algorithmInfo);
        }

        // DELETE: api/AlgorithmInfoes/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<AlgorithmInfo>> DeleteAlgorithmInfo(int id)
        {
            var algorithmInfo = await _context.AlgorithmInfo.FindAsync(id);
            if (algorithmInfo == null)
            {
                return NotFound();
            }

            _context.AlgorithmInfo.Remove(algorithmInfo);
            await _context.SaveChangesAsync();

            return algorithmInfo;
        }

        private bool AlgorithmInfoExists(int id)
        {
            return _context.AlgorithmInfo.Any(e => e.Idfile == id);
        }
    }
}
