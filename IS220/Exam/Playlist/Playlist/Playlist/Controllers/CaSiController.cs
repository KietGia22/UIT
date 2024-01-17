using Microsoft.AspNetCore.Mvc;
using Playlist.data;

namespace Playlist.Controllers
{
    public class CaSiController : Controller
    {
        private readonly DbConnect _db;
        public CaSiController(DbConnect db)
        {
            _db = db;
        }
        public IActionResult Cau2()
        {
            ViewBag.NamSinh = _db.casi.Select(c => c.NamSinh).ToList();
            return View();
        }
        public IActionResult LietKeCaSiCoNgaySinhDuocChon(DateTime NamSinh)
        {
            ViewBag.TCaSi = (from cs in _db.casi
                               where cs.NamSinh == NamSinh
                               select new
                               {
                                   tencs = cs.TenCaSi
                               }).ToList();
            return View();
        }
    }
}
