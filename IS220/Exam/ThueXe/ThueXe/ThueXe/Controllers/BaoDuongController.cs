using ThueXe.data;
using ThueXe.Models;
using Microsoft.AspNetCore.Mvc;
using System.Reflection.PortableExecutable;

namespace ThueXe.Controllers
{
    public class BaoDuongController : Controller
    {
        private readonly DbConnect _db;
        public BaoDuongController(DbConnect db)
        {
            _db = db;
        }
        public IActionResult Cau2()
        {
            return View();
        }
        public IActionResult LietKeSoXe(string soxe)
        {
            ViewBag.result = (from bd in _db.baoduong
                              join x in _db.xe on bd.SOXE equals x.SOXE
                              where x.SOXE == soxe
                              select new
                              {
                                  MaBD = bd.MABD,
                                  NgNhan = bd.NGAYNHAN,
                                  NgTra = bd.NGAYTRA ?? "",
                                  SoKM = bd.SOKM,
                                  ND = bd.NOIDUNG,

                              }).ToList();
            return View();
        }
        public IActionResult ChiTietCV(string MABD)
        {
            ViewBag.NgNhan = _db.baoduong.Where(bd => bd.MABD == MABD).Select(bd => bd.NGAYNHAN).FirstOrDefault();
            ViewBag.NgTra = _db.baoduong.Where(bd => bd.MABD == MABD).Select(bd => bd.NGAYTRA ?? "").FirstOrDefault();
            ViewBag.ThanhTien  = _db.baoduong.Where(bd => bd.MABD == MABD).Select(bd => bd.THANHTIEN).FirstOrDefault();
            ViewBag.tbResult = (from bd in _db.baoduong
                                join ct in _db.ct_bd on bd.MABD equals ct.MABD
                                join cv in _db.congviec on ct.MACV equals cv.MACV
                                where bd.MABD == MABD
                                select new
                                {
                                    macv = cv.MACV,
                                    tencv = cv.TENCV,
                                    dongia = cv.DONGIA
                                }).ToList();
            return View();
        }
        public IActionResult SuaBD(string MABD)
        {
            var baoduong = _db.baoduong.FirstOrDefault(bd => bd.MABD == MABD);
            return View(baoduong);
        }
        public IActionResult XoaCV(string MACV)
        {
            var query = (from cv in _db.ct_bd
                         where cv.MACV == MACV
                         select cv).ToList();
            if (query.Any())
            {
                _db.ct_bd.RemoveRange(query);
                _db.SaveChanges();
            }
            return Ok();
        }
        public IActionResult UpdateBD(string MaCNOld, BaoDuong bd)
        {
            var bd_update = _db.baoduong.FirstOrDefault(bd => bd.MABD == MaCNOld);

            if (bd_update != null)
            {
                bd_update.NGAYTRA = bd.NGAYTRA;

                _db.Update(bd_update);
                _db.SaveChanges();
            }

            return View("Cau2");  // Đặt giá trị MABD vào trong một object mới
        }

    }
}
