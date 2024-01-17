using ThueXe.Controllers;
using ThueXe.Models;
using Microsoft.EntityFrameworkCore;

namespace ThueXe.data
{
    public class DbConnect :DbContext
    {
        public DbConnect(DbContextOptions options) : base(options) { }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<KhachHang>().HasKey(e => e.MAKH);
            modelBuilder.Entity<CongViec>().HasKey(e => e.MACV);
            modelBuilder.Entity<BaoDuong>().HasKey(e => e.MABD);
            modelBuilder.Entity<Xe>().HasKey(e => e.SOXE);
            modelBuilder.Entity<CT_BD>().HasKey(e => new {e.MABD, e.MACV});
        }
        public DbSet<KhachHang> khachhang { get; set; }
        public DbSet<Xe> xe { get; set; }
        public DbSet<CongViec> congviec { get; set; }
        public DbSet<BaoDuong> baoduong { get; set; }
        public DbSet<CT_BD> ct_bd { get; set; }

    }
}
