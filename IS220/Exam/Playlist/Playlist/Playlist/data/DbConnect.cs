using Playlist.Models;
using Microsoft.EntityFrameworkCore;
namespace Playlist.data
{
    public class DbConnect :DbContext
    {
        public DbConnect(DbContextOptions options) : base(options) { }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BaiHat>().HasKey(e => e.MaBaiHat);
            modelBuilder.Entity<Casi>().HasKey(e => e.MaCaSi);
            modelBuilder.Entity<NguoiNghe>().HasKey(e => e.MaNN);
            modelBuilder.Entity<PlayList>().HasKey(e => e.MaPlayList);
            modelBuilder.Entity<CaSi_BaiHat>().HasKey(e => new { e.MaBaiHat, e.MaCaSi });
            modelBuilder.Entity<Playlist_baihat>().HasKey(e => new { e.MaBaiHat, e.MaPlayList });

        }
        public DbSet<BaiHat> baihat { get; set; }
        public DbSet<Casi> casi { get; set; }
        public DbSet<NguoiNghe> nguoinghe { get; set; }
        public DbSet<PlayList> playlist { get; set; }
        public DbSet<CaSi_BaiHat> casi_baihat { get; set; }
        public DbSet<Playlist_baihat> playlist_baihat { get; set; }

    }
}
