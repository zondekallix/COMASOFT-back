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
    public class IndexTableMaterialTcoefTsController : ControllerBase
    {
        private readonly MaterialInsightContext _context;

        public IndexTableMaterialTcoefTsController(MaterialInsightContext context)
        {
            _context = context;
        }

        // GET: api/IndexTableMaterialTcoefTs
        [HttpGet]
        public async Task<ActionResult<IEnumerable<IndexTableMaterialTcoefT>>> GetIndexTableMaterialTcoefT()
        {
            return await _context.IndexTableMaterialTcoefT.ToListAsync();
        }

        // GET: api/IndexTableMaterialTcoefTs/5
        [HttpGet("{id}")]
        public async Task<ActionResult<IndexTableMaterialTcoefT>> GetIndexTableMaterialTcoefT(int id)
        {
            var indexTableMaterialTcoefT = await _context.IndexTableMaterialTcoefT.FindAsync(id);

            if (indexTableMaterialTcoefT == null)
            {
                return NotFound();
            }

            return indexTableMaterialTcoefT;
        }

        // PUT: api/IndexTableMaterialTcoefTs/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutIndexTableMaterialTcoefT(int id, IndexTableMaterialTcoefT indexTableMaterialTcoefT)
        {
            if (id != indexTableMaterialTcoefT.IdIndex)
            {
                return BadRequest();
            }

            _context.Entry(indexTableMaterialTcoefT).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!IndexTableMaterialTcoefTExists(id))
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

        // POST: api/IndexTableMaterialTcoefTs
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<IndexTableMaterialTcoefT>> PostIndexTableMaterialTcoefT(IndexTableMaterialTcoefT indexTableMaterialTcoefT)
        {
            _context.IndexTableMaterialTcoefT.Add(indexTableMaterialTcoefT);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetIndexTableMaterialTcoefT", new { id = indexTableMaterialTcoefT.IdIndex }, indexTableMaterialTcoefT);
        }

        // DELETE: api/IndexTableMaterialTcoefTs/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<IndexTableMaterialTcoefT>> DeleteIndexTableMaterialTcoefT(int id)
        {
            var indexTableMaterialTcoefT = await _context.IndexTableMaterialTcoefT.FindAsync(id);
            if (indexTableMaterialTcoefT == null)
            {
                return NotFound();
            }

            _context.IndexTableMaterialTcoefT.Remove(indexTableMaterialTcoefT);
            await _context.SaveChangesAsync();

            return indexTableMaterialTcoefT;
        }

        private bool IndexTableMaterialTcoefTExists(int id)
        {
            return _context.IndexTableMaterialTcoefT.Any(e => e.IdIndex == id);
        }
    }
}
