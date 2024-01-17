using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication1.Models
{
    public class CTCB
    {
        public string mach {  get; set; }
        public string mahk { get; set; }
        public string soghe { get; set; }
        public bool loaighe { get; set; }
        [ForeignKey("mach")]
        public virtual ChuyenBay ChuyenBay { get; set; }
        [ForeignKey("mahk")]
        public virtual HanhKhach hanhkhach { get; set; }
    }
}
