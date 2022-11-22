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
    public class CoefficientTypesController : ControllerBase
    {
        private readonly MaterialInsightContext _context;

        public CoefficientTypesController(MaterialInsightContext context)
        {
            _context = context;
        }

        // GET: api/CoefficientTypes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CoefficientTypes>>> GetCoefficientTypes()
        {
            return await _context.CoefficientTypes.ToListAsync();
        }

        // GET: api/CoefficientTypes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CoefficientTypes>> GetCoefficientTypes(int id)
        {
            var coefficientTypes = await _context.CoefficientTypes.FindAsync(id);

            if (coefficientTypes == null)
            {
                return NotFound();
            }

            return coefficientTypes;
        }

        // PUT: api/CoefficientTypes/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCoefficientTypes(int id, CoefficientTypes coefficientTypes)
        {
            if (id != coefficientTypes.IdCtype)
            {
                return BadRequest();
            }

            _context.Entry(coefficientTypes).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CoefficientTypesExists(id))
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

        // POST: api/CoefficientTypes
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<CoefficientTypes>> PostCoefficientTypes(CoefficientTypes coefficientTypes)
        {
            _context.CoefficientTypes.Add(coefficientTypes);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCoefficientTypes", new { id = coefficientTypes.IdCtype }, coefficientTypes);
        }

        // DELETE: api/CoefficientTypes/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<CoefficientTypes>> DeleteCoefficientTypes(int id)
        {
            var coefficientTypes = await _context.CoefficientTypes.FindAsync(id);
            if (coefficientTypes == null)
            {
                return NotFound();
            }

            _context.CoefficientTypes.Remove(coefficientTypes);
            await _context.SaveChangesAsync();

            return coefficientTypes;
        }

        private bool CoefficientTypesExists(int id)
        {
            return _context.CoefficientTypes.Any(e => e.IdCtype == id);
        }
    }
}
