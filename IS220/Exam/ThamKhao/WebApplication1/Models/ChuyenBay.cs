using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Reflection.PortableExecutable;

namespace WebApplication1.Models
{
    public class ChuyenBay
    {
        [Key] public string mach { get; set; }
        public string chuyen { get; set; }
        public string ddi { get; set; }
        public string dden { get; set; }
        public string ngay { get; set; }
        public string gbay { get; set; }
        public string gden { get; set; }
        public int thuong { get; set; }
        public int vip { get; set; }
        public string mamb {  get; set; }
        [ForeignKey("mamb")]
        public virtual MayBay maybay { get; set; }
        public virtual ICollection<CTCB> CTCBs { get; set; }
    }
}
