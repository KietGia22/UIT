using Lab5.Models;
using Lab5.DataContext;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Lab5.Controllers
{
    public class OrderController : Controller
    {
        private readonly ILogger<OrderController> _logger;
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly ApplicationDbContext _context;
        public OrderController(ILogger<OrderController> logger, IHttpContextAccessor contextAccessor, ApplicationDbContext context)
        {
            _logger = logger;
            _contextAccessor = contextAccessor;
            _context = context;
        }
        public async Task<IActionResult> Index()
        {
            try
            {
                ViewBag.Food = await _context.MonAn.Where(ma => !ma.LOAIMA.Contains("Topping")).ToListAsync();
                if(ViewBag == null)
                {
                    ViewBag.LoginFail = ViewBag.Food;
                    return View("Error");
                }

                ViewBag.Topping = await _context.MonAn.Where(ma => ma.LOAIMA.Contains("Topping")).ToListAsync();
                return View();
            } catch (Exception ex)
            {
                ViewBag.LoginFail = ex.ToString();
                return View("Error");
            }
        }

        [HttpPost]
        [Route("Order/GetInfo")]
        public async Task<IActionResult> GetInfo(string value, string itemType)
        {
            try
            {
                // Lấy thông tin của món ăn từ database dựa trên giá trị được chọn
                var food = await _context.MonAn
                    .Where(ele => ele.MAMA == value)
                    .FirstAsync();

                // Trả về dữ liệu dưới dạng JSON
                return Json(food);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                return BadRequest("Error");
            }
        }

        [HttpPost]
        [Route("Order/PlaceOrder")]
        public IActionResult PlaceOrder([FromBody] OrderViewModel data)
        {
            try
            {
                //DateTime curDate = DateTime.Now;
                //string id = Guid.NewGuid().ToString()[..10];
                //var hoadon = new HoaDon
                //{
                //    MAHD = id,
                //    MAKH = _contextAccessor.HttpContext.Session.GetString("makh"),
                //    THT = !string.IsNullOrEmpty(Total) ? long.Parse(Total) : 0,
                //    NGAYHD = curDate,
                //};
                //_context.HoaDon.Add(hoadon);
                //_context.SaveChanges();

                //if (Total == 0)
                //{
                //    ViewBag.LoginFail = "Khong thay gi de hien";
                //    return View("~/Views/Error_main.cshtml");
                //}

                ViewBag.LoginFail = data.Total;
                return View("~/Views/Error_main.cshtml");

                // Other code...

                //return View("Index");
            }
            catch (Exception ex)
            {
                return BadRequest("Đặt món thất bại: " + ex.Message);
            }
        }
    }
}
