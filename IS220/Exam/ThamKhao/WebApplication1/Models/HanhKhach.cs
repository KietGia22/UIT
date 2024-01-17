using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication1.Models
{
    public class HanhKhach
    {
        [Key] 
        public string mahk {  get; set; }
        public string hoten { get; set; }
        public string diachi { get; set; }
        public string dienthoai { get; set; }
        public virtual CTCB ctcb { get; set; }
    }
}
