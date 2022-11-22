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
    public class IndexTablesController : ControllerBase
    {
        private readonly MaterialInsightContext _context;

        public IndexTablesController(MaterialInsightContext context)
        {
            _context = context;
        }

        // GET: api/IndexTables
        [HttpGet]
        public async Task<ActionResult<IEnumerable<IndexTables>>> GetIndexTables()
        {
            return await _context.IndexTables.ToListAsync();
        }

        // GET: api/IndexTables/5
        [HttpGet("{id}")]
        public async Task<ActionResult<IndexTables>> GetIndexTables(int id)
        {
            var indexTables = await _context.IndexTables.FindAsync(id);

            if (indexTables == null)
            {
                return NotFound();
            }

            return indexTables;
        }

        // PUT: api/IndexTables/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutIndexTables(int id, IndexTables indexTables)
        {
            if (id != indexTables.IdIndex)
            {
                return BadRequest();
            }

            _context.Entry(indexTables).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!IndexTablesExists(id))
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

        // POST: api/IndexTables
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<IndexTables>> PostIndexTables(IndexTables indexTables)
        {
            _context.IndexTables.Add(indexTables);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetIndexTables", new { id = indexTables.IdIndex }, indexTables);
        }

        // DELETE: api/IndexTables/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<IndexTables>> DeleteIndexTables(int id)
        {
            var indexTables = await _context.IndexTables.FindAsync(id);
            if (indexTables == null)
            {
                return NotFound();
            }

            _context.IndexTables.Remove(indexTables);
            await _context.SaveChangesAsync();

            return indexTables;
        }

        private bool IndexTablesExists(int id)
        {
            return _context.IndexTables.Any(e => e.IdIndex == id);
        }
    }
}
