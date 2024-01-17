using Covid19.data;
using Covid19.Models;
using Microsoft.AspNetCore.Mvc;

namespace Covid19.Controllers
{
    public class CongNhanController : Controller
    {
        private readonly DbContest _db;
        public CongNhanController(DbContest db)
        {
            _db = db;
        }
        public IActionResult Cau2()
        {
            return View();
        }
        public IActionResult LietKeCongNhanCoTuNTrieuChung(int num)
        {
            ViewBag.result  = (from cn in _db.congnhan
                          join cntc in _db.CN_TC on cn.MaCongNhan equals cntc.MaCongNhan
                          group new { cn, cntc } by new { cn.TenCongNhan, cn.NamSinh, cn.NuocVe } into grouped
                          where grouped.Count() >= num
                          select new
                          {
                              TenCongNhan = grouped.Key.TenCongNhan,
                              NamSinh = grouped.Key.NamSinh,
                              NuocVe = grouped.Key.NuocVe,
                              SoTrieuChung = grouped.Count()
                          }).ToList();
            return View();
        }
        public IActionResult LietKeCongNhanTrongDiemCachLy(string MaDiemCachLy)
        {
            ViewBag.result = (from cn in _db.congnhan
                              where cn.MaDiemCachLy == MaDiemCachLy
                              select new
                              {
                                  macn = cn.MaCongNhan,
                                  tencn = cn.TenCongNhan
                              }).ToList();
            return View();
        }

        public IActionResult ViewCongNhan(string MaCongNhan)
        {
            if(MaCongNhan == null)
            {
                return View("LietKeCongNhanCoTuNTrieuChung");
            }
            var congNhan = _db.congnhan.FirstOrDefault(cn => cn.MaCongNhan == MaCongNhan);
            if(congNhan == null)
            {
                return View("Cau2");
            }
            return View(congNhan);
        }

        public IActionResult XoaCongNhan(string MaCongNhan)
        {
            var query = (from cntc in _db.CN_TC
                         where cntc.MaCongNhan == MaCongNhan
                         select cntc).ToList();
            if (query.Any())
            {
                _db.CN_TC.RemoveRange(query);
                _db.SaveChanges();
            }

            var query1 = _db.congnhan.FirstOrDefault(cn => cn.MaCongNhan == MaCongNhan);
            if(query1 != null)
            {
                _db.congnhan.Remove(query1);
                _db.SaveChanges();
            }
            return Ok("Xoa thanh cong");
        }
        public IActionResult UpdateCongNhan(CongNhan cn, string MaCNOld)
        {
            var cn_update = _db.congnhan.FirstOrDefault(cn => cn.MaCongNhan == MaCNOld);
            if(cn_update != null)
            {
                cn_update.MaCongNhan = cn.MaCongNhan;
                cn_update.TenCongNhan = cn.TenCongNhan;
                cn_update.GioiTinh = cn.GioiTinh;
                cn_update.NamSinh = cn.NamSinh;
                cn_update.NuocVe = cn.NuocVe;
                _db.Update(cn_update);
                _db.SaveChanges();
            }
            return RedirectToAction("ViewCongNhan", "CongNhan", new {cn.MaCongNhan});
        }
    }
}
