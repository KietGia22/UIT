using WebApplication1.Models;
using Microsoft.EntityFrameworkCore;

namespace WebApplication1.data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions options) : base(options) 
        { 
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CTCB>()
                .HasKey(ctcb => new { ctcb.mach, ctcb.mahk });
        }

        public DbSet<ChuyenBay> chuyenbay { get; set; }
        public DbSet<HanhKhach> hanhkhach { get; set; }

        public DbSet<CTCB> ct_cb { get; set; }
        public DbSet<MayBay> maybay { get; set; }
    }

}
