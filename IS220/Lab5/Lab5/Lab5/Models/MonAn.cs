using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Lab5.Models
{
    public class MonAn
    {
        [Key]
        [Column("MAMA", TypeName = "varchar(30)")]
        public String? MAMA { get; set; }

        [Column("TENMA", TypeName = "varchar(50)")]
        public String? TENMA { get; set; }

        [Column("DONGIA", TypeName = "DECIMAL(10,2)")]
        public long? DONGIA { get; set; }

        [Column("LOAIMA", TypeName = "varchar(50)")]
        public String? LOAIMA { get; set; }
    }
}
