using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Lab5.Models
{
    public class CTHD
    {
        [Key]
        [Column("MAHD", TypeName = "varchar(30)")]
        public String? MAHD { get; set; }

        [Key]
        [Column("MAMA", TypeName = "varchar(30)")]
        public String? MAMA { get; set; }

        [Column("MAK", TypeName = "varchar(50)")]
        public String? MAK { get; set; }

        [Column("SL", TypeName = "INT")]
        public int? NGAYHD { get; set; }
    }
}
