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
    public class CoefTypePropViewsController : ControllerBase
    {
        private readonly MaterialInsightContext _context;

        public CoefTypePropViewsController(MaterialInsightContext context)
        {
            _context = context;
        }

        // GET: api/CoefTypePropViews
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CoefTypePropView>>> GetCoefTypePropView()
        {
            return await _context.CoefTypePropView.ToListAsync();
        }

        // GET: api/CoefTypePropViews/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CoefTypePropView>> GetCoefTypePropView(int id)
        {
            var coefTypePropView = await _context.CoefTypePropView.FindAsync(id);

            if (coefTypePropView == null)
            {
                return NotFound();
            }

            return coefTypePropView;
        }

        // PUT: api/CoefTypePropViews/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCoefTypePropView(int id, CoefTypePropView coefTypePropView)
        {
            if (id != coefTypePropView.IdCtype)
            {
                return BadRequest();
            }

            _context.Entry(coefTypePropView).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CoefTypePropViewExists(id))
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

        // POST: api/CoefTypePropViews
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<CoefTypePropView>> PostCoefTypePropView(CoefTypePropView coefTypePropView)
        {
            _context.CoefTypePropView.Add(coefTypePropView);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCoefTypePropView", new { id = coefTypePropView.IdCtype }, coefTypePropView);
        }

        // DELETE: api/CoefTypePropViews/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<CoefTypePropView>> DeleteCoefTypePropView(int id)
        {
            var coefTypePropView = await _context.CoefTypePropView.FindAsync(id);
            if (coefTypePropView == null)
            {
                return NotFound();
            }

            _context.CoefTypePropView.Remove(coefTypePropView);
            await _context.SaveChangesAsync();

            return coefTypePropView;
        }

        private bool CoefTypePropViewExists(int id)
        {
            return _context.CoefTypePropView.Any(e => e.IdCtype == id);
        }
    }
}
