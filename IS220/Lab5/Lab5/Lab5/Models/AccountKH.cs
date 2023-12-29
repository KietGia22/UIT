using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Lab5.Models
{
    public class AccountKH
    {
        public String? MAKH { get; set; }
        [Required]
        [StringLength(30, MinimumLength = 1, ErrorMessage = "Họ phải có ít nhất 1 ký tự")]
        public String? HO { get; set; }

        [Required]
        [StringLength(30, MinimumLength = 1, ErrorMessage = "Tên phải có ít nhất 1 ký tự")]
        public String? TEN { get; set; }

        [Required]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd-MM-yyyy}")]
        [Column("NGAYSINH", TypeName = "date")]
        public DateTime? NGAYSINH { get; set; }

        [Required]
        public String? DIACHI { get; set; }

        [Required]
        [RegularExpression("^0[0-9]*$", ErrorMessage = "Số điện thoại phải có 10 chữ số và có số 0 ở đầu")]
        [StringLength(10)]
        public String? SDT { get; set; }

        [StringLength(50, MinimumLength = 6)]
        [Required]
        public String? USERNAME { get; set; }

        [StringLength(12, MinimumLength = 6, ErrorMessage = "The PASSWORD must be exactly 6 characters long.")]
        [Required]
        public String? PASSWORD { get; set; }
    }
}
