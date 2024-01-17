using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;

namespace Lab1_246
{
    //Nguyen Tran Gia Kiet
    //MSSV:21522258

    class Program
    {

        static int UCLN(int so1, int so2)
        {
            if (so2 == 0)
                return so1;
            else
                return UCLN(so2, so1 % so2);
        }

        static void Bai2(int TuSo, int MauSo)
        {
            TuSo = TuSo / UCLN(TuSo, MauSo);
            MauSo = MauSo / UCLN(TuSo, MauSo);
            Console.WriteLine(TuSo  + "/" + MauSo);
        }

        static void Bai3(int SoMuonTimUoc)
        {
            for (int i = 1; i <= SoMuonTimUoc; i++)
            {
                if (SoMuonTimUoc % i == 0)
                    Console.Write(i + " ");
            }
            Console.WriteLine("\n");
        }

        static void Bai4(string keobuabao, int index)
        {
            string[] game = {"keo", "bua", "bao"};
            int computerChoice = new Random().Next(0, 3);
            Console.WriteLine(computerChoice);
            if (game[computerChoice].Equals(keobuabao))
            {
                Console.WriteLine($"May tinh chon: {game[computerChoice]}, " +
                    $"Ban chon {keobuabao}. Ket qua Hoa");
            } 
            else if(computerChoice == 0 && index == 2 || 
                computerChoice == 1 && index == 0 ||
                computerChoice == 2 && index == 1)
            {
                Console.WriteLine($"May tinh chon: {game[computerChoice]}, " +
                    $"Ban chon {keobuabao}. Ket qua ban thua");
            }
            else if (computerChoice == 2 && index == 0 ||
                computerChoice == 0 && index == 1 ||
                computerChoice == 1 && index == 2)
            {
                Console.WriteLine($"May tinh chon: {game[computerChoice]}, " +
                    $"Ban chon {keobuabao}. Ket qua may thua");
            }
        }

        static void Bai5(int soLe)
        {
            for(int i=1; i<= soLe; i++)
            {
                if(i % 2 == 1)
                    Console.Write(i + " ");
            }
            Console.WriteLine("\n");
        }

        static void Bai6()
        {
            Console.WriteLine("Nhap ngay (1-31): ");
            int day = int.Parse(Console.ReadLine());

            Console.WriteLine("Nhap thang (1-12): ");
            int month = int.Parse(Console.ReadLine());

            Console.WriteLine("Nhap nam: ");
            int year = int.Parse(Console.ReadLine());

            DateTime inputDate = new DateTime(year, month, day);

            Console.WriteLine($"Ngay {day}/{month}/{year} la ngay thu {inputDate.DayOfYear} trong nam.");

            DayOfWeek dayOfWeek = inputDate.DayOfWeek;
            Console.WriteLine($"Ngay {day}/{month}/{year} la ngay thu {dayOfWeek + 1} trong tuan.");

            int weekNumber = GetIso8601WeekOfYear(inputDate);
            Console.WriteLine($"Ngay {day}/{month}/{year} la tuan thu {weekNumber} trong nam.");
        }

        static int GetIso8601WeekOfYear(DateTime time)
        {
            DateTimeFormatInfo dfi = DateTimeFormatInfo.CurrentInfo;
            Calendar cal = dfi.Calendar;

            return cal.GetWeekOfYear(time, dfi.CalendarWeekRule, dfi.FirstDayOfWeek);
        }

    static void Main(string[] args)
        {
            Console.WriteLine(UCLN(27, 81) + "\n");
            Bai2(4, 6);
            Bai3(8);
            Bai5(8);
            string[] game = { "keo", "bua", "bao" };
            int userChoice = new Random().Next(0, 3);
            Bai4(game[userChoice], userChoice);
            Bai6();
         }
    }
}
