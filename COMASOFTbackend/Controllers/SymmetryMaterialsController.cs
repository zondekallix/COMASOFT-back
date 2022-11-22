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
    public class SymmetryMaterialsController : ControllerBase
    {
        private readonly MaterialInsightContext _context;

        public SymmetryMaterialsController(MaterialInsightContext context)
        {
            _context = context;
        }

        // GET: api/SymmetryMaterials
        [HttpGet]
        public async Task<ActionResult<IEnumerable<SymmetryMaterials>>> GetSymmetryMaterials()
        {
            return await _context.SymmetryMaterials.ToListAsync();
        }

        // GET: api/SymmetryMaterials/5
        [HttpGet("{id}")]
        public async Task<ActionResult<SymmetryMaterials>> GetSymmetryMaterials(int id)
        {
            var symmetryMaterials = await _context.SymmetryMaterials.FindAsync(id);

            if (symmetryMaterials == null)
            {
                return NotFound();
            }

            return symmetryMaterials;
        }

        // PUT: api/SymmetryMaterials/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutSymmetryMaterials(int id, SymmetryMaterials symmetryMaterials)
        {
            if (id != symmetryMaterials.IdSymmetry)
            {
                return BadRequest();
            }

            _context.Entry(symmetryMaterials).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SymmetryMaterialsExists(id))
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

        // POST: api/SymmetryMaterials
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<SymmetryMaterials>> PostSymmetryMaterials(SymmetryMaterials symmetryMaterials)
        {
            _context.SymmetryMaterials.Add(symmetryMaterials);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetSymmetryMaterials", new { id = symmetryMaterials.IdSymmetry }, symmetryMaterials);
        }

        // DELETE: api/SymmetryMaterials/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<SymmetryMaterials>> DeleteSymmetryMaterials(int id)
        {
            var symmetryMaterials = await _context.SymmetryMaterials.FindAsync(id);
            if (symmetryMaterials == null)
            {
                return NotFound();
            }

            _context.SymmetryMaterials.Remove(symmetryMaterials);
            await _context.SaveChangesAsync();

            return symmetryMaterials;
        }

        private bool SymmetryMaterialsExists(int id)
        {
            return _context.SymmetryMaterials.Any(e => e.IdSymmetry == id);
        }
    }
}
