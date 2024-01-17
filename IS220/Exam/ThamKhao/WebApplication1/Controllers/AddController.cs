using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using WebApplication1.data;
using WebApplication1.Models;
using Microsoft.EntityFrameworkCore;

namespace WebApplication1.Controllers
{
    public class AddController : Controller
    {
        public readonly AppDbContext db;
        private readonly ILogger<AddController> _logger;
        public AddController(AppDbContext db, ILogger<AddController> logger)
        {
            this.db = db;
            _logger = logger;
        }
        public IActionResult Index()
        {
            return View();
        }
        [Route("customer/add")]
        public IActionResult AddCustomer(string mahk, string hoten, string diachi, string dienthoai)
        {
            Console.WriteLine(mahk);
            HanhKhach newKH = new HanhKhach
            {
                mahk = mahk,
                hoten = hoten,
                diachi = diachi,
                dienthoai = dienthoai
            };
            db.hanhkhach.Add(newKH);
            db.SaveChanges();
            return View("Index");
        }
    }
}
