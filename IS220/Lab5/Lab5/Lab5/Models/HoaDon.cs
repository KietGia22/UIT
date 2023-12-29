using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Lab5.Models
{
    public class HoaDon
    {
        [Column("MAHD", TypeName = "varchar(30)")]
        public String? MAHD { get; set; }

        [Column("MAKH", TypeName = "varchar(50)")]
        public String? MAKH { get; set; }

        [Column("THT", TypeName = "DECIMAL(10,2)")]
        public long? THT { get; set; }

        [Column("NGAYHD", TypeName = "DATE")]
        public DateTime? NGAYHD { get; set; }
    }
}
