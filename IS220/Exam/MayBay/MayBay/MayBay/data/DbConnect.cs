using MayBay.Models;
using Microsoft.EntityFrameworkCore;

namespace MayBay.data
{
    public class DbConnect : DbContext
    {
        public DbConnect(DbContextOptions options) : base(options) { }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChuyenBay>().HasKey(e => e.MACH);
            modelBuilder.Entity<HanhKhach>().HasKey(e => e.MAHK);
            modelBuilder.Entity<MayBayNe>().HasKey(e => e.MAMB);
            modelBuilder.Entity<CT_CB>().HasKey(e => new { e.MAHK, e.MACH });
        }
        public DbSet<ChuyenBay> chuyenbay { get; set; }
        public DbSet<HanhKhach> hanhkhach { get; set; }
        public DbSet<MayBayNe> maybay { get; set; }
        public DbSet<CT_CB> ct_cb { get; set; }
    }
}
