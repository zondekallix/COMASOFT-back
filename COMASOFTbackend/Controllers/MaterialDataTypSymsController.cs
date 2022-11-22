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
    public class MaterialDataTypSymsController : ControllerBase
    {
        private readonly MaterialInsightContext _context;

        public MaterialDataTypSymsController(MaterialInsightContext context)
        {
            _context = context;
        }

        // GET: api/MaterialDataTypSyms
        [HttpGet]
        public async Task<ActionResult<IEnumerable<MaterialDataTypSym>>> GetMaterialDataTypSym()
        {
            return await _context.MaterialDataTypSym.ToListAsync();
        }

        // GET: api/MaterialDataTypSyms/5
        [HttpGet("{id}")]
        public async Task<ActionResult<MaterialDataTypSym>> GetMaterialDataTypSym(int id)
        {
            var materialDataTypSym = await _context.MaterialDataTypSym.FindAsync(id);

            if (materialDataTypSym == null)
            {
                return NotFound();
            }

            return materialDataTypSym;
        }

        // PUT: api/MaterialDataTypSyms/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMaterialDataTypSym(int id, MaterialDataTypSym materialDataTypSym)
        {
            if (id != materialDataTypSym.IdMaterial)
            {
                return BadRequest();
            }

            _context.Entry(materialDataTypSym).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MaterialDataTypSymExists(id))
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

        // POST: api/MaterialDataTypSyms
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<MaterialDataTypSym>> PostMaterialDataTypSym(MaterialDataTypSym materialDataTypSym)
        {
            _context.MaterialDataTypSym.Add(materialDataTypSym);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetMaterialDataTypSym", new { id = materialDataTypSym.IdMaterial }, materialDataTypSym);
        }

        // DELETE: api/MaterialDataTypSyms/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<MaterialDataTypSym>> DeleteMaterialDataTypSym(int id)
        {
            var materialDataTypSym = await _context.MaterialDataTypSym.FindAsync(id);
            if (materialDataTypSym == null)
            {
                return NotFound();
            }

            _context.MaterialDataTypSym.Remove(materialDataTypSym);
            await _context.SaveChangesAsync();

            return materialDataTypSym;
        }

        private bool MaterialDataTypSymExists(int id)
        {
            return _context.MaterialDataTypSym.Any(e => e.IdMaterial == id);
        }
    }
}
