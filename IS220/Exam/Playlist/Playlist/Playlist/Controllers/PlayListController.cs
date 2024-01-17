using Microsoft.AspNetCore.Mvc;
using Playlist.data;

namespace Playlist.Controllers
{
    public class PlayListController : Controller
    {
        private readonly DbConnect _db;
        public PlayListController(DbConnect db)
        {
            _db = db;
        }
        public IActionResult LietKePLNN(string MaNN)
        {
            ViewBag.table = (from pl in _db.playlist
                             where pl.MaNN == MaNN
                             select new
                             {
                                 mapl = pl.MaPlayList,
                                 mann = pl.MaNN,
                                 tenpl = pl.TenPlayList
                             }).ToList();
            return View("LietKePLNN");
        }
        public IActionResult XoaPlayList(string MaPlayList)
        {
            var query = (from pl_bh in _db.playlist_baihat
                         where pl_bh.MaPlayList == MaPlayList
                         select pl_bh).ToList();
            if (query.Any())
            {
                _db.playlist_baihat.RemoveRange(query);
                _db.SaveChanges();
            }

            var query1 = _db.playlist.FirstOrDefault(pl => pl.MaPlayList == MaPlayList);
            if (query1 != null)
            {
                _db.playlist.Remove(query1);
                _db.SaveChanges();
            }
            return Ok("Xoa thanh cong");
        }
        public IActionResult ViewThongTinPlayList(string MaPlayList)
        {
            ViewBag.thongtin = (from pl_bh in _db.playlist_baihat
                                join cs_bh in _db.casi_baihat on pl_bh.MaBaiHat equals cs_bh.MaBaiHat
                                join cs in _db.casi on cs_bh.MaCaSi equals cs.MaCaSi
                                join bh in _db.baihat on pl_bh.MaBaiHat equals bh.MaBaiHat
                                where pl_bh.MaPlayList == MaPlayList
                                select new
                                {
                                    tenbh = bh.TenBaiHat,
                                    tencs = cs.TenCaSi
                                }).ToList();
            return View();
        }
    }
}
