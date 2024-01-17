using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Lab2_Bai1
{
    class Program
    {
        interface IKhachHang {
            void XuatKhanhHang();
        }
        public abstract class KhachHang : IKhachHang
        {
            public int id { get ; set; }
            public string MaKH { get; set; }
            public string TenKH { get; set; }
            public int NgayHD { get; set; }
            public int ThangHD { get; set; }
            public int NamHD { get; set; }
            protected double SLDien { get; set; }
            protected double DonGia { get; set; }
            protected double ThanhTien { get; set; }

            public KhachHang() { }
            public KhachHang(int id, string maKH, string tenKH, int ngayHD, int thangHD, int namHD, double sLDien, double donGia, double thanhTien)
            {
                this.id = id;
                MaKH = maKH;
                TenKH = tenKH;
                NgayHD = ngayHD;
                ThangHD = thangHD;
                NamHD = namHD;
                SLDien = sLDien;
                DonGia = donGia;
                ThanhTien = thanhTien;
            }

            public virtual double TinhThanhTien() { return 0; }
            public virtual void XuatKhanhHang()
            {
                Console.WriteLine($"Mã khách hàng: {MaKH}");
                Console.WriteLine($"Tên khách hàng: {TenKH}");
                DateTime date = new DateTime(NamHD, ThangHD, NgayHD);
                string formattedDate = date.ToString("dd/MM/yyyy");
                Console.WriteLine($"Ngày hoá đơn: {formattedDate}");
                Console.WriteLine($"Số lượng điện đã dùng: {SLDien}kwh");
                Console.WriteLine($"Đơn giá: {DonGia}vnd");
            }

            public virtual void XuatthongtinKHtheoThangNam() {
                Console.WriteLine("------------------------------------------");
            }
        }

        class SinhHoat : KhachHang
        {
            protected double DinhMuc;

            public SinhHoat() : base() 
            {
                this.id = 1; 
            }
            public SinhHoat(int ID, string maKH, string tenKH, int ngayHD, int thangHD, int namHD, double sLDien, double donGia, double thanhTien, double dinhMuc) : 
                base(ID, maKH, tenKH, ngayHD, thangHD, namHD, sLDien, donGia, thanhTien)
            {
                this.id = ID;
                DinhMuc = dinhMuc;
            }

            public override void XuatKhanhHang()
            {
                base.XuatKhanhHang();
                Console.WriteLine($"Định mức: {DinhMuc}kwh");
                Console.WriteLine($"Thành tiền: {TinhThanhTien()}vnd");
            }

            public override void XuatthongtinKHtheoThangNam()
            {
                base.XuatthongtinKHtheoThangNam();
                Console.WriteLine($"Mã khách hàng: {MaKH}");
                Console.WriteLine($"Tên khách hàng: {TenKH}");
                Console.WriteLine($"Số lượng điện đã dùng: {SLDien}kwh");
                Console.WriteLine($"Thành tiền: {TinhThanhTien()}vnd");
                Console.WriteLine("------------------------------------------");

            }

            public override double TinhThanhTien() 
            {
                if (SLDien <= DinhMuc)
                    this.ThanhTien = this.SLDien * this.DonGia;
                else
                    this.ThanhTien = this.SLDien * this.DonGia * this.DinhMuc
                        + (this.SLDien - this.DinhMuc) * this.DonGia * 2;
                return this.ThanhTien;
            }

        }

        class KinhDoanh : KhachHang
        {
            public KinhDoanh() : base()
            {
                this.id = 2;
            }
            public KinhDoanh (int ID, string maKH, string tenKH, int ngayHD, int thangHD, int namHD, double sLDien, double donGia, double thanhTien) : 
                base(ID, maKH, tenKH, ngayHD, thangHD, namHD, sLDien, donGia, thanhTien)
            {
                this.id = ID;
            }
            public override void XuatKhanhHang()
            {
                base.XuatKhanhHang();
                Console.WriteLine($"Thành tiền: {TinhThanhTien()}vnd");
            }
            public override double TinhThanhTien()
            {
                double DThanhTIen = Convert.ToDouble(this.DonGia);
                if (this.SLDien > 400)
                    DThanhTIen = 400 * this.DonGia + ((this.SLDien - 400) * this.DonGia * 0.05);
                else
                    DThanhTIen = this.SLDien * this.DonGia;
                return DThanhTIen;
            }
            public override void XuatthongtinKHtheoThangNam()
            {
                base.XuatthongtinKHtheoThangNam();
                Console.WriteLine($"Mã khách hàng: {MaKH}");
                Console.WriteLine($"Tên khách hàng: {TenKH}");
                Console.WriteLine($"Số lượng điện đã dùng: {SLDien}kwh");
                Console.WriteLine($"Thành tiền: {TinhThanhTien()}vnd");
                Console.WriteLine("------------------------------------------");
            }
        }

        class SanXuat : KhachHang
        {
            protected int LoaiDien { get; set; }
            public SanXuat() : base()
            {
                this.id = 3;
            }
            public SanXuat(int ID, string maKH, string tenKH, int ngayHD, int thangHD, int namHD, double sLDien, double donGia, double thanhTien, int loaiD) :
                base(ID, maKH, tenKH, ngayHD, thangHD, namHD, sLDien, donGia, thanhTien)
            {
                this.id = ID;
                this.LoaiDien = loaiD;
            }
            public override void XuatKhanhHang()
            {
                base.XuatKhanhHang();
                Console.WriteLine($"Loại điện khách hàng sử dụng: {LoaiDien} pha");
                Console.WriteLine($"Thành tiền: {TinhThanhTien()}vnd");
            }
            public override double TinhThanhTien()
            {
                double DThanhTIen = Convert.ToDouble(this.ThanhTien);
                if (this.LoaiDien == 2)
                {
                    DThanhTIen = (SLDien > 200) ? 200 * this.DonGia + ((this.SLDien - 200) * this.DonGia * 0.98) : this.SLDien * this.DonGia;
                }
                else
                {
                    DThanhTIen = (SLDien > 150) ? 150 * this.DonGia + ((this.SLDien - 150) * this.DonGia * 0.97) : this.SLDien * this.DonGia;

                }
                return DThanhTIen;
            }
            public override void XuatthongtinKHtheoThangNam()
            {
                base.XuatthongtinKHtheoThangNam();
                Console.WriteLine($"Mã khách hàng: {MaKH}");
                Console.WriteLine($"Tên khách hàng: {TenKH}");
                Console.WriteLine($"Số lượng điện đã dùng: {SLDien}kwh");
                Console.WriteLine($"Thành tiền: {TinhThanhTien()}vnd");
                Console.WriteLine("------------------------------------------");
            }

        }

        static bool KiemTraNgayThangNam(int day, int month, int year)
        {
            if (month > 12 || month < 1)
                return false;
            switch (month)
            {
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12:
                    if (day < 1 || day > 31)
                        return false;
                    break;
                case 4:
                case 6:
                case 9:
                case 11:
                    if (day < 1 || day > 30)
                        return false;
                    break;
                default:
                    if ((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0))
                    {
                        if (day < 1 || day > 29)
                        {
                            return false;
                        }
                    }
                    else
                    {
                        if (day < 1 || day > 28)
                        {
                            return false;
                        }
                    }
                    break;
            }
            return true;
        }

        static int KiemtraNhap(string idkh, string name, int day, int month, int year, List<KhachHang> kh, int LoaiDien)
        {
            if (kh.Count == 0)
                return 1;
            foreach (KhachHang khachHang in kh)
            {
                if (string.Equals(idkh.ToLower(), khachHang.MaKH.ToLower()) && string.Equals(name.ToLower(), khachHang.TenKH.ToLower()))
                {
                    if (khachHang.NgayHD == day && khachHang.ThangHD == month && khachHang.NamHD == year && LoaiDien != khachHang.id)
                    {
                        Console.WriteLine("Khách hàng có cùng mã khách hàng và tên khách hàng giống một khách hàng khác nhưng có ngày tạo hoá đơn giống nhau và loại điện khác nhau");
                        return 0;
                    }    
                        
                    else if (khachHang.NgayHD == day && khachHang.ThangHD == month && khachHang.NamHD == year && LoaiDien == khachHang.id)
                    {
                        Console.WriteLine("Khách hàng có cùng mã khách hàng và tên khách hàng giống một khách hàng khác nhưng có ngày tạo hoá đơn giống nhau, mặc dù loại điện gióng nhau");
                        return 0;
                    }
                    else if (LoaiDien != khachHang.id)
                    {
                        Console.WriteLine("Khách hàng có cùng mã khách hàng và tên khách hàng giống một khách hàng khác nhưng khác loại điện");
                        return 0;
                    }    
                    else
                        return 1;
                }
                return 1;
            }
            return 1;
        }

        static void Nhap(List<KhachHang> kh)
        {
            string maKH, tenKH;
            int ngay, thang, nam, loaidien;
            double soLuongDien, donGia, dinhMuc;
            KhachHang dskh;
            int kiemtraNgay, kiemtraKH;
            int choice;
            while(true)
            {
                Console.WriteLine("----------Nhập khách hàng mới----------");
                Console.Write("Nhập mã khách hàng: ");
                maKH = Console.ReadLine();
                if (string.IsNullOrEmpty(maKH))
                {
                    break;
                }

                do
                {
                    Console.Write("Nhập tên khách hàng: ");
                    tenKH = Console.ReadLine();
                    Console.Write("Nhập ngày tạo hoá đơn: ");
                    ngay = Int32.Parse(Console.ReadLine());
                    Console.Write("Nhập tháng tạo hoá đơn: ");
                    thang = Int32.Parse(Console.ReadLine());
                    Console.Write("Nhập năm tạo hoá đơn: ");
                    nam = Int32.Parse(Console.ReadLine());
                    if(KiemTraNgayThangNam(ngay, thang, nam) == false)
                    {
                        kiemtraNgay = kiemtraKH = 0;
                        soLuongDien = donGia = 0;
                        choice = 0;
                        Console.WriteLine("Ngày tháng năm không hợp lệ");
                        continue;
                    }
                    else
                    {
                        kiemtraNgay = 1;
                    }
                    Console.Write("Nhập số lượng điện đã dùng: ");
                    soLuongDien = double.Parse(Console.ReadLine());
                    Console.Write("Nhập đơn giá: ");
                    donGia = double.Parse(Console.ReadLine());
                    Console.Write("Chọn kiểu khách hàng: \n\t1: Sinh hoạt\n\t2: Kinh doanh\n\t3: San xuat\n");
                    Console.Write("Nhap su lua chon cua ban: ");
                    choice = int.Parse(Console.ReadLine());
                    kiemtraKH = KiemtraNhap(maKH, tenKH, ngay, thang, nam, kh, choice);
                } while (kiemtraKH == 0 || kiemtraNgay == 0);

                switch (choice)
                {
                    case 1:
                        Console.Write("Nhập định mức: ");
                        dinhMuc = double.Parse(Console.ReadLine());
                        dskh = new SinhHoat(1, maKH, tenKH, ngay, thang, nam, soLuongDien, donGia, 0, dinhMuc);
                        kh.Add(dskh);
                        break;
                    case 2:
                        dskh = new KinhDoanh(2, maKH, tenKH, ngay, thang, nam, soLuongDien, donGia, 0);
                        kh.Add(dskh);
                        break;
                    case 3:
                        do
                        {
                            Console.Write("Nhập loại điện: ");
                            loaidien = Int32.Parse(Console.ReadLine());
                        } while (loaidien < 2 || loaidien > 3);
                        dskh = new SanXuat(3, maKH, tenKH, ngay, thang, nam, soLuongDien, donGia, 0, loaidien);
                        break; 
                    default:
                        break;
                }
            }
        }

        static void XuatHoaDonTheoThangNam(int thang, int nam, List<KhachHang> kh)
        {
            int oke = 0;
            foreach(var khachHang in kh)
            {
                if (khachHang.ThangHD == thang && khachHang.NamHD == nam)
                    khachHang.XuatthongtinKHtheoThangNam();
                oke = 1;
            }

            if(oke == 0)
            {
                Console.WriteLine("Không tìm thấy thông tin hoá đơn của các khách hàng theo tháng và năm mà bạn cung cấp");
            }
        }

        static void Main() {
            Console.OutputEncoding = Encoding.Unicode;
            Console.InputEncoding = Encoding.Unicode;
            List<KhachHang> danhSachKhachHang = new List<KhachHang>();
            Nhap(danhSachKhachHang);

            Console.Write("Nhập tháng muốn xem hoá đơn: ");
            int thang = Int32.Parse(Console.ReadLine());
            Console.Write("Nhập năm muốn xem hoá đơn: ");
            int nam = Int32.Parse(Console.ReadLine());
            XuatHoaDonTheoThangNam(thang, nam, danhSachKhachHang);
        }
    }
}

