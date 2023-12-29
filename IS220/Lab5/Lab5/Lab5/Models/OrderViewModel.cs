using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace Lab5.Models
{

    public class OrderViewModel
    {
        public List<Object> MonAn { get; set; }
        public List<Object> MonAnKem { get; set; }
        public string Total { get; set; }
    }

}
