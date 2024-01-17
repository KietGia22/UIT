using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab1_Bai9
{
    //Nguyen Tran Gia Kiet
    //MSSV:21522258

    class Program
    {
        //Bai 9
        static int SoChuSoCuaN(int So_N)
        {
            int demSo = 0;
            while (So_N > 0)
            {
                So_N /= 10;
                demSo++;
            }
            return demSo;
        }

        static void Main(string[] args)
        {
            //Bai 9
            Console.Write("\n\nNhap so n de dem so luong chu so: ");
            int So_N = int.Parse(Console.ReadLine());
            Console.WriteLine($"So chu so cua {So_N} la: {SoChuSoCuaN(So_N)}");
        }
    }
}