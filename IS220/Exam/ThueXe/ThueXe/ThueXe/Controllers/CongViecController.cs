using Microsoft.AspNetCore.Mvc;
using ThueXe.data;
using ThueXe.Models;

namespace ThueXe.Controllers
{
    public class CongViecController : Controller
    {
        private readonly DbConnect _db;
        public CongViecController(DbConnect db)
        {
            _db = db;
        }
        public IActionResult Cau1()
        {
            return View();
        }
        public IActionResult ThemCongViec(CongViec cv)
        {
            _db.congviec.Add(cv);
            _db.SaveChanges();
            return View("Cau1");
        }
    }
}
