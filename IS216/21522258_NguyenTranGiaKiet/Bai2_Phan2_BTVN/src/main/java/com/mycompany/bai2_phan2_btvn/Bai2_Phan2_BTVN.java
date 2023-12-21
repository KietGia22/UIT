/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.bai2_phan2_btvn;

/**
 *
 * @author GIA KIET
 */
import java.util.Scanner;

interface IChuyenXe{
    void Nhap();
    void Xuat();
}

abstract class ChuyenXe implements IChuyenXe
{
    private int MaSoChuyen;
    private String HoTen;
    private String SoXe;
    private int KLuongHang;
    private long DoanhThu;
    private int id;
    static Scanner in = new Scanner(System.in);
    
    public ChuyenXe(){};
    
    public ChuyenXe(int MaSoChuyen, String HoTen, String SoXe, int KLuongHang, long DoanhThu){
        this.MaSoChuyen = MaSoChuyen;
        this.HoTen = HoTen;
        this.SoXe = SoXe;
        this.KLuongHang = KLuongHang;
        this.DoanhThu = DoanhThu;
    }
    
    public void SetMaSoChuyen(int a){
        this.MaSoChuyen = a;
    }
    
    public int GetMaSoChuyen(){
        return this.MaSoChuyen;
    }
    
    public void SetHoTen(String a){
        this.HoTen = a;
    }
    
    public String GetHoTen(){
        return this.HoTen;
    }
    
    public void SetSoXe(String a){
        this.SoXe = a;
    }
    
    public String GetSoXe(){
        return this.SoXe;
    }
    
    public void SetKLuongHangHoa(int a){
        this.KLuongHang = a;
    }
    
    public int GetKLuongHangHoa(){
        return this.KLuongHang;
    }
    
    public void SetDoanhThu(int a){
        this.DoanhThu = a;
    }
    
    public long GetDoanhThu(){
        return this.DoanhThu;
    }
    
    public void SetId(int i){
        this.id = i;
    }
    public int GetId(){
        return this.id;
    }
    
    @Override
    public void Nhap(){
        System.out.print("Nhap ma so chuyen: ");
        MaSoChuyen = in.nextInt();
        in.nextLine();
        System.out.print("Nhap ten tai xe: ");
        HoTen = in.nextLine();
        System.out.print("Nhap so xe: ");
        SoXe = in.nextLine();
        System.out.print("Nhap khoi luong hang hoa: ");
        KLuongHang = in.nextInt();
        System.out.print("Nhap doanh thu cua chuyen xe: ");
        DoanhThu = in.nextLong();
        
    }
    
    @Override
    public void Xuat(){
        System.out.println("Ma So Chuyen cua chuyen xe: " + this.MaSoChuyen);
        System.out.println("Ho ten tai xe cua chuyen xe: " + this.HoTen);
        System.out.println("So xe cua chuyen xe: " + this.SoXe);
        System.out.println("Khoi luong hang hoa cua xe: " + this.KLuongHang + " kg");
    }
}

class ChuyenNoiThanh extends ChuyenXe{
    private int QDuongDi;
    
    public ChuyenNoiThanh(){};
    
    public ChuyenNoiThanh(int MaSoChuyen, String HoTen, String SoXe, int KLuongHang, long DoanhThu, int QDuongDi){
        super(MaSoChuyen, HoTen, SoXe,KLuongHang , DoanhThu);
        this.QDuongDi = QDuongDi;
    }
    
    public void SetQDuong(int a){
        this.QDuongDi = a;
    }
    
    public int GetQDuong(){
        return this.QDuongDi;
    }
    
    @Override
    public void Nhap(){
        super.Nhap();
        SetId(1);
        System.out.print("Nhap quang duong di cua chuyen xe: ");
        QDuongDi = in.nextInt();
    }
    
    @Override
    public void Xuat(){
        super.Xuat();
        System.out.println("Quang duong di cua chuyen xe: " + this.QDuongDi + " km");
    }
}

class ChuyenNgoaiThanh extends ChuyenXe{
    private String NoiDen;
    private int SoNgayVan;
    public ChuyenNgoaiThanh(){}
    public ChuyenNgoaiThanh(int MaSoChuyen, String HoTen, String SoXe, int KLuongHang, long DoanhThu, int SoNgayVan, String NoiDen){
        super(MaSoChuyen, HoTen, SoXe, KLuongHang, DoanhThu);
        this.NoiDen = NoiDen;
        this.SoNgayVan = SoNgayVan;
    }
    
    public void SetNoiDen(String a){
        this.NoiDen = a;
    }
    public String GetNoiDen(){
        return this.NoiDen;
    }
    
    public void SetNgayVan(int a){
        this.SoNgayVan = a;
    }
    public int GetNgayVan(){
        return this.SoNgayVan;
    }
    
    @Override
    public void Nhap(){
        super.Nhap();
        in.nextLine();
        SetId(2);
        System.out.print("Noi den cua chuyen ngoai thanh: ");
        NoiDen = in.nextLine();
        System.out.print("So ngay cua chuyen ngoai thanh: ");
        SoNgayVan = in.nextInt();
    }
    @Override
    public void Xuat(){
        super.Xuat();
        System.out.println("Noi den cua chuyen hang la: " + this.NoiDen);
        System.out.println("So ngay van chuyen cua chuyen ngoai thanh: " + this.SoNgayVan + " ngay");
    }
}

public class Bai2_Phan2_BTVN {

    static Scanner in = new Scanner(System.in);
    
    public static void NhapDanhSach(ChuyenXe chxe[], int soluong){
        for(int i=0; i<soluong; i++){
            System.out.print("NHap lua chon (1 la chuyen noi thanh, 2 la chuyen ngoai thanh): ");
            int option = in.nextInt();
            in.nextLine();
            if(option == 1){
                chxe[i] = new ChuyenNoiThanh();
                chxe[i].Nhap();
            }
            else if(option == 2){
                chxe[i] = new ChuyenNgoaiThanh();
                chxe[i].Nhap();
            }
        }
    }
    
    public static void XuatDanhSach(ChuyenXe chxe[], int soluong){
        for(int i = 0; i<soluong; i++){
            chxe[i].Xuat();
        }
    }
    
    public static int TongDoanhThuNoiThanh(ChuyenXe chxe[], int soluong){
        int sum = 0; 
        for(int i=0; i<soluong; i++){
            if(chxe[i].GetId() == 1){
                sum += chxe[i].GetDoanhThu();
            }
        }
        return sum;
    } 
    
    public static int TongDoanhThuNgoaiThanh(ChuyenXe chxe[], int soluong){
        int sum = 0; 
        for(int i=0; i<soluong; i++){
            if(chxe[i].GetId() == 2){
                sum += chxe[i].GetDoanhThu();
            }
        }
        return sum;
    } 
    
    public static int TongDoanhThu(ChuyenXe chxe[], int soluong){
        int sum = 0; 
        for(int i=0; i<soluong; i++){
                sum += chxe[i].GetDoanhThu();
        }
        return sum;
    } 
    
    public static void main(String[] args) {
        int soluong;
        do{
            System.out.print("Nhap so luong chuyen (Khong qua 20 chuyen): ");
            soluong = in.nextInt();
        }while(soluong > 20);
        ChuyenXe[] chxe = new ChuyenXe[soluong];
        NhapDanhSach(chxe, soluong);
        System.out.println("\n\n");
        XuatDanhSach(chxe, soluong);
        System.out.println("Tong doanh thu cua chuyen noi thanh va ngoai thanh: " + (TongDoanhThuNoiThanh(chxe, soluong) + TongDoanhThuNgoaiThanh(chxe, soluong) ));
        
        long max_NoiThanh = 0, max_NgoaiThanh = 0;
        for(int i=0; i<soluong; i++){
            if(chxe[i].GetId() == 1){
                if(chxe[i].GetDoanhThu() > max_NoiThanh){
                    max_NoiThanh = chxe[i].GetDoanhThu();
                }
            } else {
                if(chxe[i].GetDoanhThu() > max_NgoaiThanh){
                    max_NgoaiThanh = chxe[i].GetDoanhThu();
                }
            }
        }
        
        System.out.println("Chuyen xe co doanh thu cao nhat cua chuyen noi thanh la: ");
        for(int i = 0; i<soluong; i++){
            if(chxe[i].GetId() == 1){
                if(chxe[i].GetDoanhThu() == max_NoiThanh)
                    chxe[i].Xuat();
            }
        }
        System.out.println("Chuyen xe co doanh thu cao nhat cua chuyen ngoai thanh la: ");
        for(int i = 0; i<soluong; i++){
            if(chxe[i].GetId() == 2){
                if(chxe[i].GetDoanhThu() == max_NgoaiThanh)
                    chxe[i].Xuat();
            }
        }
    } 
}
