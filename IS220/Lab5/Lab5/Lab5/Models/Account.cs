using System.ComponentModel.DataAnnotations;

namespace Lab5.Models
{
    public class Account
    {
        [Key]
        public String USERNAME { get; set; }
        public String PASSWORD { get; set; }
        public String MAKH { get; set; }
    }
}
