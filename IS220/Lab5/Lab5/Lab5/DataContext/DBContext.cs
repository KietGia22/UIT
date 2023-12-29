using Lab5.Models;
using Microsoft.EntityFrameworkCore;
using static System.Net.Mime.MediaTypeNames;

namespace Lab5.DataContext
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>().HasKey(ele => ele.USERNAME);
            modelBuilder.Entity<KhachHang>().HasKey(ele => ele.MAKH);
            modelBuilder.Entity<MonAn>().HasKey(ele => ele.MAMA);
            modelBuilder.Entity<HoaDon>().HasKey(ele => ele.MAHD);
            modelBuilder.Entity<CTHD>().HasKey(ele => new { ele.MAMA, ele.MAHD});

        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            // Other configurations...
            optionsBuilder.UseLoggerFactory(LoggerFactory.Create(builder => builder.AddConsole()));
        }
        public DbSet<Account> Account { get; set; }
        public DbSet<KhachHang> KhachHang { get; set; }
        public DbSet<MonAn> MonAn { get; set; }
        public DbSet<HoaDon> HoaDon { get; set; }
        public DbSet<CTHD> CTHD { get; set; }
    }
}
