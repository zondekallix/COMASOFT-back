using COMASOFTbackend.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace COMASOFTbackend.Services
{
    public class AlgorithmInfoService
    {
        private readonly MaterialInsightContext _context;

        public AlgorithmInfoService(MaterialInsightContext context)
        {
            _context = context;
        }
        public async Task<ActionResult<IEnumerable<AlgorithmInfo>>> GetAlgorithmInfo()
        {
            return await _context.AlgorithmInfo.ToListAsync();
        }
    }
}
