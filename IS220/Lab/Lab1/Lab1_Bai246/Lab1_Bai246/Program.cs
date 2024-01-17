using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab1_246
{
    //Nguyen Tran Gia Kiet
    //MSSV:21522258

    struct PhanSo
    {
        public int TuSo;
        public int MauSo;
        public PhanSo(int tu, int mau)
        {
            TuSo = tu;
            if (mau == 0)
                MauSo = 1;
            MauSo = mau;
        }
    }
    class Program
    {
        //Bai 2
        static PhanSo NhapPhanSo()
        {
            Console.Write("Nhap tu so: ");
            int TuSo = int.Parse(Console.ReadLine());

            int MauSo;
            do
            {
                Console.Write("Nhap mau so: ");
                MauSo = int.Parse(Console.ReadLine());
                if (MauSo == 0)
                {
                    Console.WriteLine("Vui long nhap lai");
                }
            } while (MauSo == 0);

            return new PhanSo(TuSo, MauSo);
        }

        static int UCLN(int a, int b)
        {
            if (b == 0) return a;
            return UCLN(b, a % b);
        }

        static void RutGon(ref PhanSo ps)
        {
            int SoRutGon = UCLN(ps.TuSo, ps.MauSo);
            ps.TuSo = ps.TuSo / SoRutGon;
            ps.MauSo = ps.MauSo / SoRutGon;
        }

        static void ChuyenDoiDau(ref PhanSo ps)
        {
            if (ps.MauSo < 0 || ps.TuSo < 0 && ps.MauSo < 0)
            {
                ps.TuSo *= -1;
                ps.MauSo *= -1;
            }
        }

        static void TinhToan(PhanSo ps1, PhanSo ps2)
        {
            RutGon(ref ps1);
            RutGon(ref ps2);

            PhanSo tong, hieu, tich, thuong;
            tong = new PhanSo(ps1.TuSo * ps2.MauSo + ps2.TuSo * ps1.MauSo, ps1.MauSo * ps2.MauSo);
            hieu = new PhanSo(ps1.TuSo * ps2.MauSo - ps2.TuSo * ps1.MauSo, ps1.MauSo * ps2.MauSo);
            tich = new PhanSo(ps1.TuSo * ps2.TuSo, ps1.MauSo * ps2.MauSo);
            thuong = new PhanSo(ps1.TuSo * ps2.MauSo, ps1.MauSo * ps2.TuSo);

            RutGon(ref tong);
            ChuyenDoiDau(ref tong);

            RutGon(ref hieu);
            ChuyenDoiDau(ref hieu);

            RutGon(ref tich);
            ChuyenDoiDau(ref tich);

            RutGon(ref thuong);
            ChuyenDoiDau(ref thuong);

            Console.WriteLine($"Tong hai phan so la: {tong.TuSo}/{tong.MauSo}");
            Console.WriteLine($"Hieu hai phan so la: {hieu.TuSo}/{hieu.MauSo}");
            Console.WriteLine($"Tich hai phan so la: {tich.TuSo}/{tich.MauSo}");
            Console.WriteLine($"Thuong hai phan so la: {thuong.TuSo}/{thuong.MauSo}");

        }

        //Bai 4
        static void ThaoTacChuoi(String str1_x, String str2_y)
        {
            Console.WriteLine($"Do dai cua chuoi ' {str1_x} ' la: {str1_x.Length}");

            String BaKiTuDau_x = str1_x.Length >= 3 ? str1_x.Substring(0, 3) : str1_x;
            Console.WriteLine($"Ba ki tu dau cua chuoi ' {str1_x} ' la: {BaKiTuDau_x}");

            String BaKiTuCuoi_x = str1_x.Length >= 3 ? str1_x.Substring(str1_x.Length - 3) : str1_x;
            Console.WriteLine($"Ba ki tu cuoi cua chuoi ' {str1_x} ' la: {BaKiTuCuoi_x}");

            String KiTuThuSau = str1_x.Length >= 6 ? str1_x.Substring(5, 1) : str1_x;
            Console.WriteLine($"Ki tu thu sau cua chuoi ' {str1_x} ' la: {KiTuThuSau}");

            String BaKiTuCuoi_y = str2_y.Length >= 3 ? str2_y.Substring(str2_y.Length - 3) : str2_y;
            String ChuoiMoi = BaKiTuDau_x + BaKiTuCuoi_y;
            Console.WriteLine($"Chuoi moi duoc tao la: {ChuoiMoi}");

            Boolean checkChuoi = str1_x.Equals(str2_y);
            if (checkChuoi)
            {
                Console.WriteLine($"Hai chuoi ' {str1_x} ' va ' {str2_y} ' bang nhau");
            }
            else
            {
                Console.WriteLine($"Hai chuoi ' {str1_x} ' va ' {str2_y} ' khong bang nhau");
            }

            int ViTri = str1_x.IndexOf(str2_y);
            if (ViTri >= 0)
            {
                Console.WriteLine($"' {str2_y} ' co xuat hien trong ' {str1_x} ' va xuat hien tai vi tri: {ViTri}");
            }
            else
            {
                Console.WriteLine($"' {str2_y} ' khong xuat hien trong ' {str1_x} '");
            }

            int[] viTriXuatHien = TimViTriXuatHien(str1_x, str2_y);
            if (viTriXuatHien.Length > 0)
            {
                Console.WriteLine($"Tat ca vi tri xuat hien cua ' {str2_y} ' trong ' {str1_x} ': {string.Join(", ", viTriXuatHien)}");
            }
            else
            {
                Console.WriteLine($"' {str2_y} ' khong xuat hien trong ' {str1_x} '");
            }
        }

        static int[] TimViTriXuatHien(string x, string y)
        {
            var viTriList = new System.Collections.Generic.List<int>();
            int viTri = x.IndexOf(y);
            while (viTri != -1)
            {
                viTriList.Add(viTri);
                viTri = x.IndexOf(y, viTri + 1);
            }
            return viTriList.ToArray();
        }

        static void Bai1()
        {
            double r, circumference;
            string stringR;
            Console.Write("\n\nNhap vao ban kinh duong tron: ");
            stringR = Console.ReadLine();
            r = double.Parse(stringR);
            Console.WriteLine($"Ban kinh cua hinh tron: {r}");
            circumference = r * 2 * Math.PI;
            Console.WriteLine($"Chu vi duong tron do la: {circumference}");
        }

        static void Bai2()
        {
            Console.WriteLine("\n\nNhap phan so thu nhat:");
            PhanSo phanSo1 = NhapPhanSo();

            Console.WriteLine("\nNhap phan so thu hai:");
            PhanSo phanSo2 = NhapPhanSo();

            TinhToan(phanSo1, phanSo2);
        }

        static void Bai3()
        {
            int day, month, year;
            String name, sex;
            Console.Write("\n\nName: ");
            name = Console.ReadLine();
            Console.Write("Day: ");
            day = int.Parse(Console.ReadLine());
            Console.Write("Month: ");
            month = int.Parse(Console.ReadLine());
            Console.Write("Year: ");
            year = int.Parse(Console.ReadLine());
            DateTime birth = new DateTime(year, month, day);
            Console.Write("sex: ");
            sex = Console.ReadLine();
            if (birth.Day == 29 && birth.Month == 2)
            {
                birth = birth.AddDays(1);
            }
            birth = birth.AddYears(sex == "nu" ? 55 : 60);
            Console.WriteLine($"Thoi diem nghi huu: {birth.ToString()}");
        }
        static void Bai4()
        {
            Console.Write("\n\nNhap chuoi x: ");
            string x = Console.ReadLine();

            Console.Write("\nNhap chuoi y: ");
            string y = Console.ReadLine();

            ThaoTacChuoi(x, y);
        }

        static void Bai5()
        {
            int electricUse, bill = 0;
            Console.Write("\n\nNhap so dien sd: ");
            electricUse = int.Parse(Console.ReadLine());
            if (electricUse <= 0)
            {
                Console.WriteLine("sao xai am dien duoc vay chi voi");
            }
            else if (electricUse <= 50)
            {
                bill = electricUse * 2000;
            }
            else
            {
                bill = 50 * 2000 + (electricUse - 50) * (electricUse > 100 ? 3500 : 2500);
            }
            Console.WriteLine($"Tien dien cua ban la: {bill}kw");
        }

        static void Bai6()
        {
            while (true)
            {
                Console.WriteLine("\n##################################");
                Console.WriteLine("1. Bai 1");
                Console.WriteLine("2. Bai 2");
                Console.WriteLine("3. Bai 3");
                Console.WriteLine("4. Bai 4");
                Console.WriteLine("5. Bai 5");
                Console.WriteLine("6. Thoat");
                Console.WriteLine("##################################");
                Console.Write("Chon chuc nang: ");
                int choice = int.Parse(Console.ReadLine());

                switch (choice)
                {
                    case 1:
                        Bai1();
                        break;
                    case 2:
                        Bai2();
                        break;
                    case 3:
                        Bai3();
                        break;
                    case 4:
                        Bai4();
                        break;
                    case 5:
                        Bai5();
                        break;
                    case 6:
                        return;
                    default:
                        Console.WriteLine("Khong tim thay chuc nang, vui long chon lai");
                        break;

                }

                Console.WriteLine("\n Nhan Enter de tiep tuc");
                Console.ReadLine();
                Console.Clear();
            }
        }

        static void Main(string[] args)
        {
            Bai6();
        }
    }
}
