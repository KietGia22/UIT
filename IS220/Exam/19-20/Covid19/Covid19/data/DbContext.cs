using Covid19.Controllers;
using Covid19.Models;
using Microsoft.EntityFrameworkCore;

namespace Covid19.data
{
    public class DbContest : DbContext
    {
        public DbContest(DbContextOptions options) : base(options) { }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CongNhan>().HasKey(ele => ele.MaCongNhan);
            modelBuilder.Entity<DiemCachLy>().HasKey(ele => ele.MaDiemCachLy);
            modelBuilder.Entity<TrieuChung>().HasKey(ele => ele.MaTrieuChung);
            modelBuilder.Entity<CN_TC>().HasKey(ele => new { ele.MaCongNhan, ele.MaTrieuChung });
        }
        public DbSet<CongNhan> congnhan { get; set; }
        public DbSet<DiemCachLy> diemcachly { get; set; }
        public DbSet<TrieuChung> trieuchung { get; set; }
        public DbSet<CN_TC> CN_TC { get; set; }
    }
}
