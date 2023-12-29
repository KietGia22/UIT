using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Lab5.Models
{
    public class KhachHang
    {
        [Key]
        [Required]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("MAKH", TypeName = "varchar(36)")]
        public String? MAKH { get; set; }

        [Required]
        [StringLength(30, MinimumLength = 1, ErrorMessage = "Họ phải có ít nhất 1 ký tự")]
        [Column("HO", TypeName = "varchar(30)")]
        public String? HO { get; set; }

        [Required]
        [StringLength(30, MinimumLength = 1, ErrorMessage = "Tên phải có ít nhất 1 ký tự")]
        [Column("TEN", TypeName = "varchar(30)")]
        public String? TEN { get; set; }

        [Required]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd-MM-yyyy}")]
        [Column("NGAYSINH", TypeName = "date")]
        public DateTime? NGAYSINH { get; set; }

        [Required]
        [Column("DIACHI", TypeName = "varchar(50)")]
        public String? DIACHI { get; set; }

        [Required]
        [RegularExpression("^0[0-9]*$", ErrorMessage = "Số điện thoại phải có 10 chữ số và có số 0 ở đầu")]
        [StringLength(10)]
        [Column("SDT", TypeName = "varchar(10)")]
        public String? SDT { get; set; }
    }
}
