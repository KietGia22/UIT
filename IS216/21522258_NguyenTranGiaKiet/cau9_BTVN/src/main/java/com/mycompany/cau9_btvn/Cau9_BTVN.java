/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.cau9_btvn;

import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author GIA KIET
 */
public class Cau9_BTVN {
    
    static Scanner in = new Scanner(System.in);
    static ArrayList<KhachHang> kh = new ArrayList();
    
    public boolean CheckLoaiDien(String TenKH, String MaKH, int LoaiDien){
        for(int i=0; i<kh.size(); i++){
            if(kh.get(i) instanceof SanXuat){
                if(kh.get(i).GetMaKH().equals(MaKH) && kh.get(i).GetTenKH().equals(TenKH)){
                    if (((SanXuat)kh.get(i)).GetLD() != LoaiDien){
                        return false;
                    }
                }
            }
        }
        return true;
    }
    
    public boolean CheckDateOfSanXuat(String TenKH, String MaKH, String NgayHD){
        for(int i=0; i<kh.size(); i++){
            if(kh.get(i) instanceof SanXuat){
                if(kh.get(i).GetMaKH().equals(MaKH) && kh.get(i).GetTenKH().equals(TenKH)){
                    if(kh.get(i).GetNgayHD().equals(NgayHD))
                        return false;
                }
            }
        }
        return true;
    }
    
    public boolean checkDate(String a){
        int date = Integer.parseInt(a.substring(0, 2));
        int month = Integer.parseInt(a.substring(3, 5));
        int year = Integer.parseInt(a.substring(6));
        if(month < 1 || month > 12)
            return false;
        else {
            switch(month){
                case 1: case 3: case 5: case 7: case 8: case 10: case 12:
                {
                    if(date < 1 || date > 31)
                        return false;
                    break;
                }
                case 4: case 6: case 9: case 11: {
                    if(date < 1 || date > 30)
                        return false;
                    break;
                }
                default:
                {
                    if ((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)) {
                        if (date < 1 || date > 29) {
                            return false;
                        }
                    } else {
                        if (date < 1 || date > 28) {
                            return false;
                        }
                    }
                    break;
                }
            }
        }
        return true;
    }
    
    public void Input(){
        String maKH, tenKH, ngayHD;
        float SLDien, DonGia;
        
        OUTER:
        while(true){
            System.out.println("Nhap doi tuong khach hang: \n1.Doi tuong sinh hoat\n2.Doi tuong kinh doanh\n3.Doi tuong san xuat");
            System.out.print("Nhap lua chon: ");
            int choice = in.nextInt();
            in.nextLine();
            switch(choice){
                case 1: {
                    System.out.print("Nhap ma khach hang: ");
                    maKH = in.nextLine();
                    if(maKH.equals("")){
                        break OUTER;
                    }
                    System.out.print("Nhap ten khach hang: ");
                    tenKH = in.nextLine();
                    System.out.print("Nhap ngay hoa don(dd/mm/yyyy): ");
                    
                    do{
                        ngayHD = in.nextLine();
                        if(checkDate(ngayHD) == false)
                            System.out.print("Vui long nhap lai ngay");
                    } while(checkDate(ngayHD) == false);
                    
                    System.out.print("Nhap so luong dien: ");
                    SLDien = in.nextFloat();
                    System.out.print("Nhap don gia: ");
                    DonGia = in.nextFloat();
                    System.out.print("Nhap dinh muc: ");
                    int DinhMuc = in.nextInt();
                    SinhHoat sh = new SinhHoat(maKH, tenKH, ngayHD, SLDien, DonGia, DinhMuc);
                    kh.add(sh);
                    break;
                }
                case 2: {
                    System.out.print("Nhap ma khach hang: ");
                    maKH = in.nextLine();
                    if(maKH.equals("")){
                        break OUTER;
                    }
                    System.out.print("Nhap ten khach hang: ");
                    tenKH = in.nextLine();
                    System.out.print("Nhap ngay hoa don(dd/mm/yyyy): ");
                    do{
                        ngayHD = in.nextLine();
                        if(checkDate(ngayHD) == false)
                            System.out.print("Vui long nhap lai ngay");
                    } while(checkDate(ngayHD) == false);
                    System.out.print("Nhap so luong dien: ");
                    SLDien = in.nextFloat();
                    System.out.print("Nhap don gia: ");
                    DonGia = in.nextFloat();
                    KinhDoanh kd = new KinhDoanh(maKH, tenKH, ngayHD, SLDien, DonGia);
                    kh.add(kd);
                    break;
                }
                case 3: {
                    System.out.print("Nhap ma khach hang: ");
                    maKH = in.nextLine();
                    if(maKH.equals("")){
                        break OUTER;
                    }
                    System.out.print("Nhap ten khach hang: ");
                    tenKH = in.nextLine();
                    System.out.print("Nhap ngay hoa don: ");
                    do{
                        ngayHD = in.nextLine();
                        if(checkDate(ngayHD) == false || CheckDateOfSanXuat(tenKH, maKH, ngayHD) == false)
                            System.out.print("Vui long nhap lai ngay: ");
                    } while(checkDate(ngayHD) == false || CheckDateOfSanXuat(tenKH, maKH, ngayHD) == false);
                    System.out.print("Nhap so luong dien: ");
                    SLDien = in.nextFloat();
                    System.out.print("Nhap don gia: ");
                    DonGia = in.nextFloat();
                    System.out.print("Nhap loai dien su dung (2 la 2 pha, 3 la 3 pha), neu cung ma khach hang va ten khach hang vui long nhap cung loai dien: ");
                    int LoaiDien;
                    do  {
                        LoaiDien = in.nextInt();
                        if(LoaiDien < 2 || LoaiDien > 3 || CheckLoaiDien(tenKH, maKH, LoaiDien) == false)
                            System.out.print("Vui long nhap lai loai dien: ");
                    } while(LoaiDien < 2 || LoaiDien > 3 || CheckLoaiDien(tenKH, maKH, LoaiDien) == false);
                    SanXuat sx = new SanXuat(maKH, tenKH, ngayHD, SLDien, DonGia, LoaiDien);
                    kh.add(sx);
                    break;
                }
            }
        }
    }  
    
    public void KHOutput(){
        for(int i=0; i<kh.size(); i++){
            kh.get(i).Output();
        }
    }
    
    public void InKhachHangTheoThangNam(int month, int year){
        boolean ok = false;
        for(int i=0; i<kh.size(); i++){
            int monthKH = Integer.parseInt(kh.get(i).GetNgayHD().substring(3, 5));
            int yearKH = Integer.parseInt(kh.get(i).GetNgayHD().substring(6));
            if(monthKH == month && yearKH == year)
            {
                kh.get(i).Output();
                ok = true;
            }
        }
        if(ok == false){
            System.out.println("Khong tim thay thong tin");
        }
    }

    public static void main(String[] args) {
        Cau9_BTVN bai9 = new Cau9_BTVN();
        bai9.Input();
        //bai9.KHOutput();
        int choice;
        while(true){
            System.out.println("\nNhap lua chon cua ban \n 1.Xuat thong tin hoa don dua vao ngay thang. \n2.Thoat");
            System.out.print("Lua chon: ");
            choice = in.nextInt();
            if(choice == 1){
                System.out.print("Nhap thang va nam cua hoa don muon xuat: ");
                int month = in.nextInt();
                int year = in.nextInt();
                bai9.InKhachHangTheoThangNam(month, year);
            } else {
                break;
            }
        }
    }
}
