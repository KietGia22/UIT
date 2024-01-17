using System.ComponentModel.DataAnnotations;

namespace WebApplication1.Models
{
    public class MayBay
    {
        [Key]
        public string mamb {  get; set; }
        public string hangmb { get; set; }
        public int socho { get; set; }
        public int socho2 { get; set;}

    }
}
