using Lab5.Models;
using Microsoft.EntityFrameworkCore;
namespace Lab5.DataContext
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {
        }
        public DbSet<Account> Account { get; set; } = default!;
    }
}
