using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.data;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class ChuyenBayController : Controller
    {
        public readonly AppDbContext db;
        public ChuyenBayController(AppDbContext db)
        {
            this.db = db;
        }
        public IActionResult Index()
        {
            return View("Index");
        }

        public ActionResult TimChuyen(string mach)
        {
            var chuyenbay = db.chuyenbay.FirstOrDefault(x => x.mach == mach);
            var hanhkhach = db.ct_cb
            .Where(x => x.mach == mach)
            .Join(db.hanhkhach, ctcb => ctcb.mahk, hk => hk.mahk, (ctcb, hk) => new
            {
                mach = ctcb.mach,
                mahk = hk.mahk,
                name = hk.hoten,
                loaighe = ctcb.loaighe,
                sdt = hk.dienthoai,
                soghe = ctcb.soghe
            })
            .ToList();
            var gheVip = db.chuyenbay.Where(x => x.mach == mach).SelectMany(x => x.CTCBs).Where(x=>x.loaighe==true).Select(x => x.hanhkhach).ToList();
            var gheThuong = db.chuyenbay.Where(x => x.mach == mach).SelectMany(x => x.CTCBs).Where(x=>x.loaighe == false).Select(x => x.hanhkhach).ToList();
            ViewBag.chuyenbay = chuyenbay;
            ViewBag.hanhkhach = hanhkhach;
            ViewBag.gheVip = gheVip.Count;
            ViewBag.gheThuong = gheThuong.Count;
            return View("ChiTiet");
        }
        public ActionResult AddMode(string mach)
        {
            ViewBag.isAdd = true;
            return TimChuyen(mach);
        }
        public ActionResult AddCus(string mach, string mahk, string soghe,bool loaighe)
        {
            CTCB ctcb = new CTCB
            {
                mahk = mahk,
                mach = mach,
                soghe = soghe,
                loaighe = loaighe

            };
            db.Add(ctcb);
            db.SaveChanges();
            return TimChuyen(mach);
        }
        public ActionResult delete(string mach, string mahk)
        {
            var ctcb = db.ct_cb.FirstOrDefault(c => c.mach == mach && c.mahk == mahk);
            if (ctcb != null)
            {
                db.ct_cb.Remove(ctcb);
                db.SaveChanges();
            }
            return TimChuyen(mach);
        }

        public ActionResult edit(string mach, string mahk, string tenhk)
        {
            ViewBag.name = tenhk;
            ViewBag.mahk = mahk;
            ViewBag.mach = mach;
            return View("edit");
        }

        public ActionResult submitEdit(string mahk, string mach, string soghe, bool loaighe)
        {
            var ctcb = db.ct_cb.FirstOrDefault(c => c.mach == mach && c.mahk == mahk);
            ctcb.soghe = soghe;
            ctcb.loaighe = loaighe;
            db.SaveChanges();
            return TimChuyen(mach);
        }
    }
}
