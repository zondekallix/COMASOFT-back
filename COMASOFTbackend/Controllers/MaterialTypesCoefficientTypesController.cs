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
    public class MaterialTypesCoefficientTypesController : ControllerBase
    {
        private readonly MaterialInsightContext _context;

        public MaterialTypesCoefficientTypesController(MaterialInsightContext context)
        {
            _context = context;
        }

        // GET: api/MaterialTypesCoefficientTypes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<MaterialTypesCoefficientTypes>>> GetMaterialTypesCoefficientTypes()
        {
            return await _context.MaterialTypesCoefficientTypes.ToListAsync();
        }

        // GET: api/MaterialTypesCoefficientTypes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<MaterialTypesCoefficientTypes>> GetMaterialTypesCoefficientTypes(int id)
        {
            var materialTypesCoefficientTypes = await _context.MaterialTypesCoefficientTypes.FindAsync(id);

            if (materialTypesCoefficientTypes == null)
            {
                return NotFound();
            }

            return materialTypesCoefficientTypes;
        }

        // PUT: api/MaterialTypesCoefficientTypes/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMaterialTypesCoefficientTypes(int id, MaterialTypesCoefficientTypes materialTypesCoefficientTypes)
        {
            if (id != materialTypesCoefficientTypes.IdCm)
            {
                return BadRequest();
            }

            _context.Entry(materialTypesCoefficientTypes).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MaterialTypesCoefficientTypesExists(id))
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

        // POST: api/MaterialTypesCoefficientTypes
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<MaterialTypesCoefficientTypes>> PostMaterialTypesCoefficientTypes(MaterialTypesCoefficientTypes materialTypesCoefficientTypes)
        {
            _context.MaterialTypesCoefficientTypes.Add(materialTypesCoefficientTypes);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetMaterialTypesCoefficientTypes", new { id = materialTypesCoefficientTypes.IdCm }, materialTypesCoefficientTypes);
        }

        // DELETE: api/MaterialTypesCoefficientTypes/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<MaterialTypesCoefficientTypes>> DeleteMaterialTypesCoefficientTypes(int id)
        {
            var materialTypesCoefficientTypes = await _context.MaterialTypesCoefficientTypes.FindAsync(id);
            if (materialTypesCoefficientTypes == null)
            {
                return NotFound();
            }

            _context.MaterialTypesCoefficientTypes.Remove(materialTypesCoefficientTypes);
            await _context.SaveChangesAsync();

            return materialTypesCoefficientTypes;
        }

        private bool MaterialTypesCoefficientTypesExists(int id)
        {
            return _context.MaterialTypesCoefficientTypes.Any(e => e.IdCm == id);
        }
    }
}
