using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations.Schema;

namespace Covid19.Models
{
    public class DiemCachLy
    {
        [Column("MaDiemCachLy", TypeName = "varchar(5)")]
        public string MaDiemCachLy { get; set; }
        [Column("TenDiemCachLy", TypeName = "varchar(100)")]
        public string TenDiemCachLy { get; set; }
        [Column("DiaChi", TypeName = "varchar(150)")]
        public string DiaChi { get; set; }
    }
}
