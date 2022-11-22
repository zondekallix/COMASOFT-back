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
    public class MaterialTypesController : ControllerBase
    {
        private readonly MaterialInsightContext _context;

        public MaterialTypesController(MaterialInsightContext context)
        {
            _context = context;
        }

        // GET: api/MaterialTypes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<MaterialTypes>>> GetMaterialTypes()
        {
            return await _context.MaterialTypes.ToListAsync();
        }

        // GET: api/MaterialTypes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<MaterialTypes>> GetMaterialTypes(int id)
        {
            var materialTypes = await _context.MaterialTypes.FindAsync(id);

            if (materialTypes == null)
            {
                return NotFound();
            }

            return materialTypes;
        }

        // PUT: api/MaterialTypes/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMaterialTypes(int id, MaterialTypes materialTypes)
        {
            if (id != materialTypes.IdMtype)
            {
                return BadRequest();
            }

            _context.Entry(materialTypes).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MaterialTypesExists(id))
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

        // POST: api/MaterialTypes
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<MaterialTypes>> PostMaterialTypes(MaterialTypes materialTypes)
        {
            _context.MaterialTypes.Add(materialTypes);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetMaterialTypes", new { id = materialTypes.IdMtype }, materialTypes);
        }

        // DELETE: api/MaterialTypes/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<MaterialTypes>> DeleteMaterialTypes(int id)
        {
            var materialTypes = await _context.MaterialTypes.FindAsync(id);
            if (materialTypes == null)
            {
                return NotFound();
            }

            _context.MaterialTypes.Remove(materialTypes);
            await _context.SaveChangesAsync();

            return materialTypes;
        }

        private bool MaterialTypesExists(int id)
        {
            return _context.MaterialTypes.Any(e => e.IdMtype == id);
        }
    }
}
