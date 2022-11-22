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
    public class PropertiesCoeffsController : ControllerBase
    {
        private readonly MaterialInsightContext _context;

        public PropertiesCoeffsController(MaterialInsightContext context)
        {
            _context = context;
        }

        // GET: api/PropertiesCoeffs
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PropertiesCoeffs>>> GetPropertiesCoeffs()
        {
            return await _context.PropertiesCoeffs.ToListAsync();
        }

        // GET: api/PropertiesCoeffs/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PropertiesCoeffs>> GetPropertiesCoeffs(int id)
        {
            var propertiesCoeffs = await _context.PropertiesCoeffs.FindAsync(id);

            if (propertiesCoeffs == null)
            {
                return NotFound();
            }

            return propertiesCoeffs;
        }

        // PUT: api/PropertiesCoeffs/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPropertiesCoeffs(int id, PropertiesCoeffs propertiesCoeffs)
        {
            if (id != propertiesCoeffs.IdProperties)
            {
                return BadRequest();
            }

            _context.Entry(propertiesCoeffs).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PropertiesCoeffsExists(id))
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

        // POST: api/PropertiesCoeffs
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<PropertiesCoeffs>> PostPropertiesCoeffs(PropertiesCoeffs propertiesCoeffs)
        {
            _context.PropertiesCoeffs.Add(propertiesCoeffs);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPropertiesCoeffs", new { id = propertiesCoeffs.IdProperties }, propertiesCoeffs);
        }

        // DELETE: api/PropertiesCoeffs/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<PropertiesCoeffs>> DeletePropertiesCoeffs(int id)
        {
            var propertiesCoeffs = await _context.PropertiesCoeffs.FindAsync(id);
            if (propertiesCoeffs == null)
            {
                return NotFound();
            }

            _context.PropertiesCoeffs.Remove(propertiesCoeffs);
            await _context.SaveChangesAsync();

            return propertiesCoeffs;
        }

        private bool PropertiesCoeffsExists(int id)
        {
            return _context.PropertiesCoeffs.Any(e => e.IdProperties == id);
        }
    }
}
