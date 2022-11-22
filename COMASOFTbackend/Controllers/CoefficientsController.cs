using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using COMASOFTbackend.Models;

namespace COMASOFTbackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CoefficientsController : ControllerBase
    {
        private readonly MaterialInsightContext _context;

        public CoefficientsController(MaterialInsightContext context)
        {
            _context = context;
        }

        // GET: api/Coefficients
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Coefficients>>> GetCoefficients()
        {
            return await _context.Coefficients.ToListAsync();
        }

        // GET: api/Coefficients/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Coefficients>> GetCoefficients(int id)
        {
            var coefficients = await _context.Coefficients.FindAsync(id);

            if (coefficients == null)
            {
                return NotFound();
            }

            return coefficients;
        }

        [HttpGet("[action]/{idMaterial}")]
        public async Task<ActionResult<IEnumerable<Coefficients>>> GetCoeffbyMaterial(int idMaterial)
        {
            return await _context.Coefficients.Where(data => data.IdMaterial == idMaterial).ToListAsync();
        }

        // PUT: api/Coefficients/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCoefficients(int id, Coefficients coefficients)
        {
            if (id != coefficients.IdCoefficient)
            {
                return BadRequest();
            }

            _context.Entry(coefficients).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CoefficientsExists(id))
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

        // POST: api/Coefficients
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Coefficients>> PostCoefficients(Coefficients coefficients)
        {
            _context.Coefficients.Add(coefficients);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCoefficients", new { id = coefficients.IdCoefficient }, coefficients);
        }

        // DELETE: api/Coefficients/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Coefficients>> DeleteCoefficients(int id)
        {
            var coefficients = await _context.Coefficients.FindAsync(id);
            if (coefficients == null)
            {
                return NotFound();
            }

            _context.Coefficients.Remove(coefficients);
            await _context.SaveChangesAsync();

            return coefficients;
        }

        private bool CoefficientsExists(int id)
        {
            return _context.Coefficients.Any(e => e.IdCoefficient == id);
        }
    }
}
