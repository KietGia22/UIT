using Microsoft.AspNetCore.Mvc;
using Playlist.data;

namespace Playlist.Controllers
{
    public class NguoiNgheController : Controller
    {
        private readonly DbConnect _db;
        public NguoiNgheController(DbConnect db)
        {
            _db = db;
        }
        public IActionResult Cau3()
        {
            ViewBag.result = _db.nguoinghe.Select(nn => new
            {
                mann = nn.MaNN,
                tennn = nn.TenNN
            }).ToList();
            return View();
        }
    }
}
