using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Lab5.Models
{
    public class Account
    {
        [Key]
        [Required]
        [Column("USERNAME", TypeName = "varchar(50)")]
        public String? USERNAME { get; set; }

        [StringLength(12, MinimumLength = 6, ErrorMessage = "The PASSWORD must be exactly 6 characters long.")]
        [Required]
        [Column("PASSWORD", TypeName = "varchar(100)")]
        public String? PASSWORD { get; set; }

        [Required]
        [Column("MAKH", TypeName = "varchar(36)")]
        public String? MAKH { get; set; }

    }
}
