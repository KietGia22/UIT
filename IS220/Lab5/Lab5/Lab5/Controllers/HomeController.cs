using Lab5.Models;
using Lab5.DataContext;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Lab5.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly ApplicationDbContext _context;
        public String makh = "";

        public HomeController(ILogger<HomeController> logger, IHttpContextAccessor contextAccessor, ApplicationDbContext context)
        {
            _logger = logger;
            _contextAccessor = contextAccessor;
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }
        public async Task<IActionResult> Login(Account account)
        {
            if(account.USERNAME != null && account.PASSWORD != null)
            {
                string username = account.USERNAME;
                string password = account.PASSWORD;
                var check = _context.Account.FirstOrDefault(acc => acc.USERNAME == username);

                if (check == null)
                {
                    ViewBag.LoginFail = "Không tìm thấy người dùng";
                    return View("Error");
                }

                //Console.WriteLine(account.PASSWORD);
                //Console.WriteLine(check.PASSWORD);

                var kh = await _context.KhachHang.FirstOrDefaultAsync(c => c.MAKH == check.MAKH);

                Console.WriteLine(BCrypt.Net.BCrypt.Verify(account.PASSWORD, check.PASSWORD));
                if (!BCrypt.Net.BCrypt.Verify(account.PASSWORD, check.PASSWORD))
                {
                    ViewBag.LoginFail = "Sai mật khẩu";
                    return View("Error");
                }

                if (kh != null)
                {
                    _contextAccessor.HttpContext.Session.SetString("name", kh.TEN);
                    _contextAccessor.HttpContext.Session.SetString("username", username);
                    _contextAccessor.HttpContext.Session.SetString("makh", kh.MAKH);
                }
                return View("ViewLogin");
            }
            return View();
        }
        public async Task<IActionResult> Register(AccountKH khachhang)
        {
            try
            {
                if(khachhang.HO != null && khachhang.TEN != null && khachhang.NGAYSINH != null && khachhang.DIACHI != null && khachhang.SDT != null && khachhang.USERNAME != null && khachhang.PASSWORD != null)
                {
                    khachhang.MAKH = Guid.NewGuid().ToString()[..36];
                    var newKH = new KhachHang
                    {
                        HO = khachhang.HO,
                        TEN = khachhang.TEN,
                        NGAYSINH = khachhang.NGAYSINH,
                        DIACHI = khachhang.DIACHI,
                        SDT = khachhang.SDT,
                        MAKH = khachhang.MAKH
                    };
                    makh = khachhang.MAKH;
                    _context.KhachHang.Add(newKH);
                    await _context.SaveChangesAsync();

                    var newAcc = new Account
                    {
                        USERNAME = khachhang.USERNAME,
                        PASSWORD = BCrypt.Net.BCrypt.HashPassword(khachhang.PASSWORD),
                        MAKH = makh
                    };
                    Console.WriteLine(khachhang.PASSWORD);
                    Console.WriteLine(newAcc.PASSWORD);
                    _context.Account.Add(newAcc);
                    await _context.SaveChangesAsync();
                    return View("Login");
                }
                return View("Register");
            } catch (Exception ex)
            {
                ViewBag.LoginFail = ex.ToString();
                return View("Register");
            }
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}