using Microsoft.AspNetCore.Mvc;
using MayBay.data;
using MayBay.Models;


namespace MayBay.Controllers
{
    public class HanhKhachController : Controller
    {
        private readonly DbConnect _db;
        public HanhKhachController(DbConnect db)
        {
            _db = db;
        }
        public IActionResult Cau1()
        {
            return View();
        }
        public IActionResult ThemKH(HanhKhach hk)
        {
            _db.hanhkhach.Add(hk);
            _db.SaveChanges();
            return View("Cau1");
        }
    }
}
