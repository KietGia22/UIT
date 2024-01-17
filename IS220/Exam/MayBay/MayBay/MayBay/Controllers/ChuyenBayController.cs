using MayBay.data;
using MayBay.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MayBay.Controllers
{
    public class ChuyenBayController : Controller
    {
        private readonly DbConnect _db;
        public ChuyenBayController(DbConnect db)
        {
            _db = db;
        }
        public IActionResult Cau2()
        {
            return View();
        }
        public IActionResult ThongTinChuyenBay(string MACH)
        {
            ViewBag.MACH = MACH;
            ViewBag.ChuyenBay = _db.chuyenbay.FirstOrDefault(ch => ch.MACH == MACH);
            //ViewBag.ChuyenBay = _db.chuyenbay.Find(MACH);
            ViewBag.ChoVip = _db.ct_cb.Where(ct => ct.MACH == MACH && ct.LOAIGHE == 1).Count();
            ViewBag.ChoThuong = _db.ct_cb.Where(ct => ct.MACH == MACH && ct.LOAIGHE == 0).Count();
            ViewBag.TTHK = (from ct in _db.ct_cb
                            join hk in _db.hanhkhach on ct.MAHK equals hk.MAHK
                            where ct.MACH == MACH
                            select new
                            {
                                mach = ct.MACH,
                                mahk = hk.MAHK,
                                hoten = hk.HOTEN,
                                dt = hk.DIENTHOAI,
                                lghe = ct.LOAIGHE,
                                sghe = ct.SOGHE
                            }).ToList();
            return View();
        }
        public IActionResult XoaHK(string MAHK, string MACH)
        {
            var hk = _db.ct_cb.FirstOrDefault(ct => ct.MAHK == MAHK && ct.MACH == MACH);
            if (hk != null)
            {
                _db.ct_cb.Remove(hk);
                _db.SaveChanges();
            }
            return Ok();
        }
        public IActionResult ViewSua(string MAHK, string MACH)
        {
            ViewBag.MAHK = MAHK;
            ViewBag.MACH = MACH;
            ViewBag.ctcb = _db.ct_cb.Where(ct => ct.MAHK == MAHK && ct.MACH == MACH).First();
            ViewBag.hk = _db.hanhkhach.FirstOrDefault(hk => hk.MAHK == MAHK);
            return View();
        }
        public IActionResult SuaHK(string MAHK, string MACH, int loaighe, string soghe)
        {
            var ct_update = _db.ct_cb.FirstOrDefault(ct => ct.MAHK == MAHK && ct.MACH == MACH);
            if (ct_update != null)
            {
                ct_update.LOAIGHE = loaighe;
                ct_update.SOGHE = soghe;
                _db.Update(ct_update);
                _db.SaveChanges();
            }
            return RedirectToAction("ViewSua", "ChuyenBay", new {MAHK = MAHK, MACH = MACH});
        }
        public IActionResult ThemKHChoChuyen(string MACH)
        {
            if (MACH == null)
                return View("Cau2");
            ViewBag.MACH = MACH;
            ViewBag.ChuyenBay = _db.chuyenbay.FirstOrDefault(ch => ch.MACH == MACH);
            //ViewBag.ChuyenBay = _db.chuyenbay.Find(MACH);
            ViewBag.ChoVip = _db.ct_cb.Where(ct => ct.MACH == MACH && ct.LOAIGHE == 1).Count();
            ViewBag.ChoThuong = _db.ct_cb.Where(ct => ct.MACH == MACH && ct.LOAIGHE == 0).Count();
            return View();
        }
        public IActionResult Add(string MACH, int loaighe, string soghe)
        {
            _db.ct_cb.Add(new CT_CB
            {
                MACH = Request.Form["MA"],
                MAHK = Request.Form["MAHK"],
                LOAIGHE = loaighe,
                SOGHE = soghe
            });
            _db.SaveChanges();
            return View("Cau2");
        }
    }
}
