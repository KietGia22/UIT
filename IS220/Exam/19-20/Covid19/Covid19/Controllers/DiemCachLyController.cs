using Microsoft.AspNetCore.Mvc;
using Covid19.Models;
using Covid19.data;
using Microsoft.EntityFrameworkCore;


namespace Covid19.Controllers
{
    public class DiemCachLyController : Controller
    {
        private readonly DbContest _db;
        public DiemCachLyController(DbContest db)
        {
           _db = db;   
        }
        public IActionResult Cau1()
        {
            return View();
        }
        public IActionResult ThemDiemCachLy(DiemCachLy dcl) 
        {
            _db.diemcachly.Add(dcl);
            _db.SaveChanges();
            return View("Cau1");
        }
        public IActionResult Cau3()
        {
            ViewBag.MaDiemCly = (from dcl in _db.diemcachly
                                 select new
                                 {
                                     tendcl = dcl.TenDiemCachLy,
                                     madcl = dcl.MaDiemCachLy
                                 }).ToList();
            return View();
        }
    }
}
