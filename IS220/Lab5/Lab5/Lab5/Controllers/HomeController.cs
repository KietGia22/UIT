using Lab5.Models;
using Lab5.DataContext;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace Lab5.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly ApplicationDbContext _context;

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
        public IActionResult Login(Account account)
        {
            string username = account.USERNAME;
            string password = account.PASSWORD;
            var check = _context.Account.SingleOrDefault(acc => acc.USERNAME == username && acc.PASSWORD == password);
            if (check != null)
            {
                return View("Index");
            }

            else
            {
                if (username != null)
                {
                    ViewBag.LoginFail = "Đăng nhập thất bại";
                    return View("Login");
                }
            }
            return View();
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}